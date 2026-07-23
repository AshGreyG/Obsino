from __future__ import annotations

from dataclasses import dataclass
import os
from pathlib import Path
from typing import Callable

os.environ.setdefault("MPLCONFIGDIR", "/tmp/matplotlib")

import argparse
import matplotlib.pyplot as plt

plt.rcParams["font.family"] = "Libertinus Serif"

import numpy as np
from matplotlib.axes import Axes
from numpy.typing import NDArray


FloatArray = NDArray[np.float64]

DEFAULT_OUTPUT = Path("assets/figures/polynomial-generalization.png")
DEFAULT_SEED = 20260723
NOISE_STD = 0.25
BAYES_MSE = NOISE_STD ** 2


@dataclass(frozen=True)
class LearningCurve:
    train_sizes: FloatArray
    train_error: FloatArray
    test_error: FloatArray
    degrees: FloatArray


def target_function(x: FloatArray) -> FloatArray:
    return 0.7 - 1.3 * x + 1.9 * x**2 - 0.8 * x**3 + 0.35 * x**5


def sample_data(
    rng: np.random.Generator,
    sample_size: int,
    noise_std: float = NOISE_STD,
) -> tuple[FloatArray, FloatArray]:
    x = rng.uniform(-1.0, 1.0, size=sample_size)
    y = target_function(x) + rng.normal(0.0, noise_std, size=sample_size)
    return x, y


def polynomial_features(x: FloatArray, degree: int) -> FloatArray:
    return np.vander(x, N=degree + 1, increasing=True)


def fit_polynomial(
    x: FloatArray,
    y: FloatArray,
    degree: int,
    ridge: float = 1e-8,
) -> FloatArray:
    design = polynomial_features(x, degree)
    penalty = ridge * np.eye(design.shape[1], dtype=np.float64)
    penalty[0, 0] = 0.0
    return np.linalg.solve(design.T @ design + penalty, design.T @ y)


def predict_polynomial(x: FloatArray, coefficients: FloatArray) -> FloatArray:
    design = polynomial_features(x, len(coefficients) - 1)
    return design @ coefficients


def mse(prediction: FloatArray, target: FloatArray) -> float:
    return float(np.mean((prediction - target) ** 2))


def growing_degree(train_size: int) -> int:
    return min(12, max(1, train_size // 16))


def estimate_learning_curve(
    train_sizes: list[int],
    degree_fn: Callable[[int], int],
    rng: np.random.Generator,
    repetitions: int,
    test_x: FloatArray,
    test_y: FloatArray,
    ridge: float,
) -> LearningCurve:
    train_errors: list[float] = []
    test_errors: list[float] = []
    degrees: list[float] = []

    for train_size in train_sizes:
        repeated_train_errors: list[float] = []
        repeated_test_errors: list[float] = []
        degree = degree_fn(train_size)

        for _ in range(repetitions):
            train_x, train_y = sample_data(rng, train_size)
            coefficients = fit_polynomial(train_x, train_y, degree, ridge=ridge)
            repeated_train_errors.append(
                mse(predict_polynomial(train_x, coefficients), train_y)
            )
            repeated_test_errors.append(
                mse(predict_polynomial(test_x, coefficients), test_y)
            )

        train_errors.append(float(np.mean(repeated_train_errors)))
        test_errors.append(float(np.mean(repeated_test_errors)))
        degrees.append(float(degree))

    return LearningCurve(
        train_sizes=np.asarray(train_sizes, dtype=np.float64),
        train_error=np.asarray(train_errors, dtype=np.float64),
        test_error=np.asarray(test_errors, dtype=np.float64),
        degrees=np.asarray(degrees, dtype=np.float64),
    )


def plot_learning_curve(
    ax: Axes,
    title: str,
    curve: LearningCurve,
    show_degree_axis: bool = False,
) -> None:
    ax.plot(
        curve.train_sizes,
        curve.train_error,
        color="#1565c0",
        marker="o",
        linewidth=1.6,
        label="training error",
    )
    ax.plot(
        curve.train_sizes,
        curve.test_error,
        color="#c62828",
        marker="s",
        linewidth=1.6,
        label="generalization error",
    )
    ax.axhline(
        BAYES_MSE,
        color="#424242",
        linestyle="--",
        linewidth=1.0,
        label="Bayes error",
    )
    ax.set_title(title)
    ax.set_xscale("log", base=2)
    ax.set_yscale("log")
    ax.set_xlabel("training examples")
    ax.set_ylabel("mean squared error")
    ax.grid(True, alpha=0.25)

    if show_degree_axis:
        degree_ax = ax.twinx()
        degree_ax.step(
            curve.train_sizes,
            curve.degrees,
            where="post",
            color="#2e7d32",
            linewidth=1.2,
            alpha=0.7,
        )
        degree_ax.set_ylabel("polynomial degree", color="#2e7d32")
        degree_ax.tick_params(axis="y", colors="#2e7d32")


def draw_figure(output_path: Path, seed: int, repetitions: int) -> None:
    rng = np.random.default_rng(seed)
    train_sizes = [8, 12, 16, 24, 32, 48, 64, 96, 128, 192, 256, 384, 512]
    test_x, test_y = sample_data(rng, 8192)

    fixed_underfit = estimate_learning_curve(
        train_sizes,
        degree_fn=lambda _: 1,
        rng=rng,
        repetitions=repetitions,
        test_x=test_x,
        test_y=test_y,
        ridge=1e-8,
    )
    sufficient_capacity = estimate_learning_curve(
        train_sizes,
        degree_fn=lambda _: 5,
        rng=rng,
        repetitions=repetitions,
        test_x=test_x,
        test_y=test_y,
        ridge=1e-8,
    )
    growing_capacity = estimate_learning_curve(
        train_sizes,
        degree_fn=growing_degree,
        rng=rng,
        repetitions=repetitions,
        test_x=test_x,
        test_y=test_y,
        ridge=1e-5,
    )

    fig, axes = plt.subplots(1, 3, figsize=(15, 4.8), sharey=True)
    plot_learning_curve(axes[0], "Fixed degree 1: under-capacity", fixed_underfit)
    plot_learning_curve(axes[1], "Fixed degree 5: sufficient capacity", sufficient_capacity)
    plot_learning_curve(
        axes[2],
        "Growing degree: non-parametric analogue",
        growing_capacity,
        show_degree_axis=True,
    )

    handles, labels = axes[0].get_legend_handles_labels()
    fig.legend(handles, labels, loc="lower center", ncol=3, frameon=False)
    fig.suptitle("Training-set size changes training and generalization error")
    fig.tight_layout(rect=(0, 0.12, 1, 0.93))

    output_path.parent.mkdir(parents=True, exist_ok=True)
    fig.savefig(output_path, dpi=500)
    plt.close(fig)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Generate polynomial-regression learning-curve figures.",
    )
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--seed", type=int, default=DEFAULT_SEED)
    parser.add_argument("--repetitions", type=int, default=150)
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    draw_figure(args.output, seed=args.seed, repetitions=args.repetitions)
    print("[+] Saved figure:", args.output)


if __name__ == "__main__":
    main()
