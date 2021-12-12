require("user.options")
require("user.keymaps")
require("user.plugins")
require("user.colorscheme")
require("user.autocmd")
require("user.cmp")
require("user.lsp")
require("lualine").setup{
  tabline = {
    lualine_a = {'buffers'},
    -- lualine_b = {'branch'},
    -- lualine_c = {'filename'},
    -- lualine_x = {},
    -- lualine_y = {},
    -- lualine_z = {'tabs'}
  }
}

