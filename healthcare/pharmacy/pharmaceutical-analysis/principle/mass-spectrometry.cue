package principle

mass_spectrometry: {
  content: """
    === Structure of Mass Spectrometry

    A *mass spectrometry* (质谱) works by generating charged molecules or molecular
    fragments either in a high vacuum or immediately prior to the sample entering
    the high-vacuum region. The ionised molecules have to be generated in the
    gas phase. Once the molecules are charged and in the gas phase, they can be
    manipulated by the application of either *electric* or *magnetic* fields to
    enable the determination of their molecular weight and the molecular weight
    of any fragments which are produced by the molecule breaking up.

    Thus mass spectrometry can be divided into two parts: *ion generation* and
    *ion separation*.

    - *Ion generation*: The two most popular methods for ion generation are
      *electrospray ionisation* (ESI, 电喷雾电离) and *electron impact ionisation*
      (EI, 电子轰击电离). And there is also popular in certain areas of application
      is *matrix assisted laser desorption ionisation* (MALDI, 基质辅助激光解吸电离).

      - \(ion_generation_esi)
      - \(ion_generation_ei)
      - \(ion_generation_apci)
      - \(ion_generation_maldi)

    - *Ion separation*: 

      // TODO: complete ion separation section

    === Parameters of Mass Spectrometry

    Next we will introduce some parameters of mass spectrometry:

    - *ppm* (parts of million): 

      $ "ppm" := 10^6 × ("experimental value" - "theoretical value") /
        ("theoretical value") $

    - *resolution*:

      $ R := m / (Δ m) $

      where
      - $m$ is the mass-to-charge ratio ($m\\/z$) of the target ion, which is the
        exact mass value at the center of the mass spectral peek;
      - $Δ m$ is the mass width measured at $50%$ of the peak height (full width
        at half maximum, FWHM).

      \(figure_part_resolution)
  """
  ion_generation_esi: """
        The ESI is now the most widely applied method of ionisation because of its
        *ready compatibility* with *high-pressure liquid chromatography* (HPLC).
        And the ionisation takes place under atmospheric pressure.

        Applying a voltage to a liquid passing through *capillary* disintegrates
        the liquid meniscus to generate a fine spray of charged droplets. This
        phenomenon is described as: When a voltage is applied to the surface of
        a liquid infused through a capillary, the liquid is drawn to its counter
        electrode. Surface tension counteracts this force. At a specific voltage,
        the equilibrium between these two forces is independent of the surface
        curvature radius. At this point, the surface rapidly changes shape to
        form a pointed cone, the *Taylor cone*.

        // TODO: Taylor cone's angle

        In theory the cone would be infinitesimally sharp. However this would 
        cause an electric field singularity at its tip, so instead, liquid is
        sprayed from the tip of the cone.

        \(figure_part_esi)

        As charged primary droplets fly through the atmosphere, *solvent evaporates
        from them*. Solvent evaporation reduced the droplet size until charge-
        charge repulsion exceeds the surface tension holding the droplet intact.
        Any deviation from spherical shape leads to surface charge, which rapidly
        flows to the point of highest curvature until the threshold potential is
        reached to *form a new Taylor cone*.

        The net charge $Q_("Ry")$ on a spherical shape droplet with radius
        $R_("Ry")$ at *Rayleigh's limit* (electrostatic repulsion on the droplet
        surface overcomes solvent surface tension $γ$), resulting in *Coulombic
        jet fission* of the primary droplet into many small, highly charged
        droplets, is given by the equation:

        $ Q_("Ry") = 8 π sqrt(ε_0 γ R_("Ry")^3) $

        // TODO: how to derive this equation

        where
        - $Q_("Ry")$: the net charge on a spherical shape droplet, which is also
          the max charge this droplet can hold;
        - $ε_0$: permittivity of free space;
        - $γ$: surface tension of droplet;
        - $R_("Ry")$: the radius of droplet.

        So beyond the Rayleigh's limit, the primary droplet forms ins own
        electrospray, generating a series of highly charged secondary droplets,
        called *progeny droplets*.

        // TODO: read <Mass Spectrometry Using Electrospray Ionization>

        A typical mass-spectrometry graph with data from ESI-MS is like this:

        \(figure_part_esi_graph)
  """
  ion_generation_ei: """
        *Electron ionization* (EI) is an ionization method in which energetic
        electrons interact with solid or gas phase atoms or molecules to produce
        ions, this leads to *extensive fragmentation* which can be helpful for
        *structure determination of unknown compounds*. EI is the most useful
        for *organic compounds which have a molecular weight below 600 amu*.

        EI is not compatible with the use of HPLC as a method for introducing 
        the sample into the mass spectrometer. Several interfaces were developed
        which were compatible with EI type ionisation, such as *particle beam*
        (离子束接口) and *thermo-spray* (热喷雾接口). These have been almost
        completely superseded by the ESI interface. However, EI is still used in
        conjunction with sample introduction either via a direct heated probe
        or bia *gas chromatography* (气相色谱):

        1. The sample is introduced into the instrument source by heating it on
          the end of a probe until it evaporates, assisted by the high vacuum
          within the instrument or via a capillary GC column;
        2. Once in the vapour phase, the analyte is bombarded with the electrons
          produced by a rhenium or tungsten filament, which are accelerated towards
          a positive target with an energy of *70 eV*. The analyte is introduced
          between the filament and the target, and the electrons cause ionisation
          as follows:

          $ "M" + "e"^- -> "M"^+ + 2 "e"^- $

        3. Since the electrons used are of much higher energy than the strength
          of the bonds within the analyte (4-7 eV), *extensive fragmentation of
          the analyte usually occurs*;
        4. The molecule and its fragments are pushed out of the source by a
          *repeller plate* (排斥板) which has the same charge as the ions generated.

        \(figure_part_ei)

        This is an advantage when it comes to structural confirmation since the
        spectrum provides a unique fingerprint of the molecule which can be
        matched against a library spectrum and also can be interpreted:

        \(figure_part_ei_graph)
  """
  ion_generation_apci: """
        *Atmospheric pressure chemical ionisation* (APCI) is closely related to ESI
        and instruments carrying out ESI can be readily switched to operate in APCI
        mode.

        In APCI mode the eluent from the HPLC does not pass through a charged
        needle before entering the mass spectrometer source but via a heated
        tube so that it forms an aerosol. Upon exiting the heated tube an electric
        discharge is passed through the aerosol generating reactive species such
        as $"H"_3"O"^+$ and $"N"_2^+$, *which promote the ionisation of the analyte*.

        This technique has never achieved the level of popularity of ESI since
        most drug molecules can be ionised under ESI conditions. However, APCI
        can be used for the analysis of drug molecules of low polarity that are
        not ionised efficiently under ESI condition.

        \(figure_part_apci)
  """
  ion_generation_maldi: """
        *Matrix assisted laser desorption ionisation* (MALDI) uses a *nitrogen
        laser* to promote ionisation of molecules prior to ion separation in a mass
        spectrometry.

        1. The sample has to be dissolved in a matrix that absorbs UV radiation
          at round the wavelength 337 nm produced by the laser (a simple example
          of matrix is dihydroxybenzoic acid DHB):

          \(figure_part_structure_of_dihydroxybenzoic_acid)

          The sample solution is mixed with matrix solution on a metal plate and
          allowed to dry prior to being introduced into the instrument;

        2. The laser is then directed at the target plate to promote ionisation.
          This technique like ESI is a *soft ionisation technique* and the ions
          generated are most commonly due to *protonated*, or in *negative ion
          deprotonated*, molecular ions without extensive fragmentation occurring.

        \(figure_part_maldi)

        It has been widely applied in the characterisation of proteins since it
        allows ionisation of these high-molecular-weight species can be carried
        out. It is also a helpful technique for the determination of very polar
        compounds such as DNA oligomers (DNA fragments 10-20 base paris long)
        which contain a phosphate backbone and do not readily ionize in ESI mode
        because of the strong association of these molecules with sodium ions.

        So it's often used to analyze large biology molecules like:

        \(figure_part_maldi_graph)
  """
  figure_part_esi: #"""
    #align(center)[
      #figure(
        image("figures://electrospray-ionisation", width: 70%),
        caption: "A typical electrospray ionisation (ESI) setup"
      )
    ]
  """#
  figure_part_esi_graph: #"""
    #let ketoprofen-esi = "assets/typst/ketoprofen-esi-nist-msp.typ"
    #eval(
      str(read(ketoprofen-esi)),
      mode: "markup"
    )
  """#
  figure_part_ei: #"""
    #align(center)[
      #figure(
        image("figures://electron-impact-ionisation", width: 60%),
        caption: "A typical electron impact ionisation (EI) setup"
      )
    ]
  """#
  figure_part_ei_graph: #"""
    #let hydroxyphenylacetic-acid-ei = "assets/typst/4-hydroxyphenylacetic-acid-ei-nist-msp.typ"
    #eval(
      str(read(hydroxyphenylacetic-acid-ei)),
      mode: "markup"
    )
  """#
  figure_part_apci: #"""
    #align(center)[
      #figure(
        image("figures://atmospheric-pressure-chemical-ionisation", width: 60%),
        caption: "A typical atmospheric pressure chemical ionisation (APCI) setup"
      )
    ]
  """#
  figure_part_structure_of_dihydroxybenzoic_acid: #"""
    #align(center)[
      #figure(
        image("smiles://C1=CC(=C(C=C1O)O)C(=O)O", width: 20%),
        caption: "Chemical structure of popular matrix compound 2,4-dihydroxybenzoic acid (DHB)"
      )
    ]
  """#
  figure_part_maldi: #"""
    #align(center)[
      #figure(
        image("figures://matrix-assisted-laser-desorption-ionisation", width: 60%),
        caption: "Typical matrix assisted laser desorption ionisation setup"
      )
    ]
  """#
  figure_part_maldi_graph: #"""
    #let angiotensin-ii-maldi = "assets/typst/angiotensin-ii-maldi-nist-msp.typ"
    #eval(
      str(read(angiotensin-ii-maldi)),
      mode: "markup"
    )
  """#
  figure_part_resolution: #"""
    #let resolution = "assets/typst/resolution-of-mass-spectrometry.typ"
    #eval(
      str(read(resolution)),
      mode: "markup"
    )
  """#
  external_related: [
    "taylor-cone",
    "rayleigh-limit",
  ]
  external_link: [
    "https://doi.org/10.1038/s43586-023-00203-4"
  ]
}