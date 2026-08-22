# kosmos

## Project Kosmos — Server Version

Kosmos is a personal project providing NixOS configuration files for my homelab.

> **Status: Alpha / Pre-release**  
> The core Kosmos base is stable, but many features and components are still experimental. Configuration, defaults, and system behavior may change as the project develops. **Use it at your own risk.**

## What is Kosmos?

Kosmos provides a modular NixOS configuration intended to serve as the foundation for my homelab systems.

The project is currently in its **alpha** stage. The underlying configuration structure is stable enough for regular development and testing, while many higher-level components are still experimental and subject to change.

## Structure

```text
.
├── configuration.nix
├── INSTALL.md
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

`alice.nix` is included as an example user configuration. Additional users can be added as:

```text
users/<username>.nix
```

The main `configuration.nix` automatically imports `.nix` files from the `users/` directory, so new user configuration files do not need to be added manually to the import list.

## Installation

See [INSTALL.md](INSTALL.md) for the installation guide.

The installation process follows the standard NixOS installation workflow and covers:

- preparing and mounting the target disk
- generating the hardware configuration
- cloning Kosmos
- installing the configuration
- performing a dry build before installation

## Development Status

Kosmos has moved beyond the **pre-pre-release** stage and is now considered an **alpha / pre-release** project.

The distinction is intentional:

- the **base configuration** is relatively stable;
- the **project as a whole** is not yet considered stable;
- many features are experimental;
- breaking changes may still occur between releases.

Expect the project to evolve quickly as the configuration and its components mature.

## Documentation

Documentation will continue to expand as the project develops.

For installation instructions, see [INSTALL.md](INSTALL.md).

## License

MIT License. See [LICENSE](LICENSE).

Software and packages referenced by this configuration are subject to their respective licenses.
