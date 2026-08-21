# kosmos

## Project Kosmos - Server Version

Kosmos is a personal project designed to provide NixOS configuration files for my homelab.

> **Warning:** This project is currently in **pre-pre-release**. Everything may break. **Use it at your own risk!**

## Structure

```text
.
├── configuration.nix
├── LICENSE
├── README.md
├── system
│   ├── meta.nix
│   ├── network.nix
│   ├── pkg.nix
│   └── services.nix
└── users
    └── alice.nix
```

`alice.nix` is included as an example user configuration. Additional users can be added as `users/<username>.nix`.

The main `configuration.nix` automatically imports `.nix` files from the `users/` directory, so new user configuration files do not need to be added manually to the import list.

## Installation

See [INSTALL.md](INSTALL.md) for the installation guide.

The installation process follows the standard NixOS installation workflow. The guide covers partition mounting, generating the hardware configuration, cloning this repository, and installing NixOS with the Kosmos configuration.

## Documentation

More documentation will be added as the project develops.

## License

MIT License. See [LICENSE](LICENSE).

Software and packages referenced by this configuration are subject to their respective licenses.
