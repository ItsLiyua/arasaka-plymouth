<div align="center">

# Arasaka Plymouth Theme

A plymouth theme inspired by the Arasaka Corporation from Cyberpunk 2077.

<img src="https://gitlab.com/pSchwietzer/arasaka-plymouth/-/raw/main/progress-7.png" width="768" alt="Arasaka Plymouth Theme" />

</div>

## Installation

### NixOS

This repo provides a [NixOS package](package.nix) for the theme. Copy it's contents or just download the file into your NixOS configuration and add it to the `packageOverrides` and `systemPackages` attributes, as shown below:

> Note: The [Package](package.nix) will always use the main branch.

```nix
{ pkgs, ... }:

{
	nixpkgs.config.packageOverrides = pkgs: rec {
        # Adjust the path for the package.nix file
		arasaka-plymouth = pkgs.callPackage ../packages/arasaka-plymouth/package.nix {};
	};

	environment.systemPackages = with pkgs; [
		arasaka-plymouth
	];

	boot = {
        # Enable the plymouth service
		plymouth = {
			enable = true;
			themePackages = [
				pkgs.arasaka-plymouth
			];
			theme = "arasaka";
		};

        # ... other boot configuration
	};
}
```

# Special Thanks

- [Plymouth-Themes-NixOs-Conversion](https://github.com/Melechtna/Plymouth-Themes-NixOs-Conversion) for the base NixOS package template.
- [Plymouth Themes](https://github.com/adi1090x/plymouth-themes) for the base theme and inspiration (Rog 2).
- [Valency Graphics](https://www.valencygraphics.com/cyberpunk-2077) for the Arasaka logo.
