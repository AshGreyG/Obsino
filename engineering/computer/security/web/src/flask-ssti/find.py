import re
import sys

DANGEROUS_CLASSES = [
    "subprocess.Popen",
    "os._wrap_close",
    "warnings.catch_warnings"
]

def main() -> None:
    subclass_return = sys.stdin.read().rstrip().replace("\n", "")
    sr = re.findall(r"'(.*?)'", subclass_return)
    for idx, name in enumerate(sr):
        if name in DANGEROUS_CLASSES:
            print(f"{name} -> {idx}")

if __name__ == "__main__":
    main()
