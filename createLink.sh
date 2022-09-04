mkdir -p ~/.config/nvim/
mkdir -p ~/.config/nvim/init/
mkdir -p ~/.config/nvim/lua/kevin/
mkdir -p ~/.config/nvim/after
mkdir -p ~/.config/nvim/after/plugin
mkdir -p ~/.config/nvim/ftplugin
mkdir -p ~/.config/nvim/plugin

# links
ln -sf ~/nvim_lua_config/after/plugin/harpoon.rc.lua ~/.config/nvim/after/plugin/harpoon.rc.lua
ln -sf ~/nvim_lua_config/after/plugin/lualine.rc.lua ~/.config/nvim/after/plugin/lualine.rc.lua
ln -sf ~/nvim_lua_config/after/plugin/neogit.rc.lua ~/.config/nvim/after/plugin/neogit.rc.lua
ln -sf ~/nvim_lua_config/after/plugin/nvim-cmp.rc.lua ~/.config/nvim/after/plugin/nvim-cmp.rc.lua
ln -sf ~/nvim_lua_config/after/plugin/nvim-dap-ui.rc.lua ~/.config/nvim/after/plugin/nvim-dap-ui.rc.lua
ln -sf ~/nvim_lua_config/after/plugin/nvim-dap.rc.lua ~/.config/nvim/after/plugin/nvim-dap.rc.lua
ln -sf ~/nvim_lua_config/after/plugin/nvim-surround.rc.lua ~/.config/nvim/after/plugin/nvim-surround.rc.lua
ln -sf ~/nvim_lua_config/after/plugin/nvim-tree.rc.lua ~/.config/nvim/after/plugin/nvim-tree.rc.lua
ln -sf ~/nvim_lua_config/after/plugin/nvim-treesitter.rc.lua ~/.config/nvim/after/plugin/nvim-treesitter.rc.lua
ln -sf ~/nvim_lua_config/after/plugin/telescope-ui-select.rc.lua ~/.config/nvim/after/plugin/telescope-ui-select.rc.lua
ln -sf ~/nvim_lua_config/after/plugin/telescope.rc.lua ~/.config/nvim/after/plugin/telescope.rc.lua

ln -sf ~/nvim_lua_config/ftplugin/java.lua ~/.config/nvim/ftplugin/java.lua
ln -sf ~/nvim_lua_config/ftplugin/python.lua ~/.config/nvim/ftplugin/python.lua
ln -sf ~/nvim_lua_config/ftplugin/javascript.lua ~/.config/nvim/ftplugin/javascript.lua
ln -sf ~/nvim_lua_config/ftplugin/typescript.lua ~/.config/nvim/ftplugin/typescript.lua
ln -sf ~/nvim_lua_config/ftplugin/vue.lua ~/.config/nvim/ftplugin/vue.lua
ln -sf ~/nvim_lua_config/ftplugin/go.lua ~/.config/nvim/ftplugin/go.lua
ln -sf ~/nvim_lua_config/ftplugin/kotlin.lua ~/.config/nvim/ftplugin/kotlin.lua
ln -sf ~/nvim_lua_config/ftplugin/ps1.lua ~/.config/nvim/ftplugin/ps1.lua

ln -sf ~/nvim_lua_config/lua/kevin/init.lua ~/.config/nvim/lua/kevin/init.lua
ln -sf ~/nvim_lua_config/lua/kevin/constants.lua ~/.config/nvim/lua/kevin/constants.lua
ln -sf ~/nvim_lua_config/lua/abbreviations.lua ~/.config/nvim/lua/abbreviations.lua
ln -sf ~/nvim_lua_config/lua/augroups.lua ~/.config/nvim/lua/augroups.lua
ln -sf ~/nvim_lua_config/lua/base.lua ~/.config/nvim/lua/base.lua
ln -sf ~/nvim_lua_config/lua/functions.lua ~/.config/nvim/lua/functions.lua
ln -sf ~/nvim_lua_config/lua/macos.lua ~/.config/nvim/lua/macos.lua
ln -sf ~/nvim_lua_config/lua/maps.lua ~/.config/nvim/lua/maps.lua
ln -sf ~/nvim_lua_config/lua/plugins.lua ~/.config/nvim/lua/plugins.lua
ln -sf ~/nvim_lua_config/lua/utils.lua ~/.config/nvim/lua/utils.lua
ln -sf ~/nvim_lua_config/lua/windows.lua ~/.config/nvim/lua/windows.lua

ln -sf ~/nvim_lua_config/plugin/lspconfig.lua ~/.config/nvim/plugin/lspconfig.lua
ln -sf ~/nvim_lua_config/plugin/plugin/null-ls.rc.lua ~/.config/nvim/plugin/null-ls.rc.lua

ln -sf ~/nvim_lua_config/init.lua ~/.config/nvim/init.lua
