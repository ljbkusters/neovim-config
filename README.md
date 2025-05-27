# Neovim Config

This is my personal neovim configuration! 

# Config structure

The `init.lua` file imports the right lua files in the right order to configure
neovim and serves as an entrypoint for neovim configuration.

All configuration files are stored in the `lua/config/` directory. Here we
define default neovim configuration, like settings, (default) remaps, and other
core neovim funcionality. The Lazy plugin manager is also bootstrapped here.

We use the multi-file lazy approach to manage plugins. These plugins are
imported from the `lua/plugins/` directory. Each (lua) file there defines one
or more plugins that need to be installed. It also manages the configuration of
each plugin.
