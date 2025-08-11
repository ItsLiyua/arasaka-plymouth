<div align="center">

# Arasaka Plymouth Theme

A plymouth theme inspired by the Arasaka Corporation from Cyberpunk 2077.
Now also in a flake!

<img src="https://gitlab.com/pSchwietzer/arasaka-plymouth/-/raw/main/progress-7.png" width="768" alt="Arasaka Plymouth Theme" />

</div>

## Installation

### NixOS

Add the repo to your flake inputs:

```nix
arasaka-plymouth = {
  url = "github:ItsLiyua/arasaka-plymouth";
  inputs.nixpkgs.follows = "nixpkgs";
};
```

Then set it inside your plymouth configuration:

```nix
{ pkgs, inputs, ... }:
{
  boot.plymouth = {
    enable = true;
    theme = "arasaka";
    themePackage = [ inputs.plymouth-arasaka.packages.${pkgs.system}.default ];
  };
}
```

You might have to tweak the configuration provided a little for it to fit into your already present system.

# Special Thanks

- [pSchwietzer](https://gitlab.com/pSchwietzer/arasaka-plymouth) for the original package.
- [Plymouth-Themes-NixOs-Conversion](https://github.com/Melechtna/Plymouth-Themes-NixOs-Conversion) for the base NixOS package template.
- [Plymouth Themes](https://github.com/adi1090x/plymouth-themes) for the base theme and inspiration (Rog 2).
- [Valency Graphics](https://www.valencygraphics.com/cyberpunk-2077) for the Arasaka logo.
