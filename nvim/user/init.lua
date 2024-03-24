vim.api.nvim_create_autocmd("FileType", {
  desc = "Set spell and tw when editing commit message",
  pattern = { "gitcommit" },
  command = "setlocal spell tw=72",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.md", "*.tex" },
  command = "setlocal spell",
})

vim.g["gitblame_date_format"] = "%r"
vim.o.scrolloff = 10

vim.api.nvim_set_keymap("t", "<ESC><ESC>", "<C-\\><C-n>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })

if vim.g.neovide then
  vim.o.guifont = "Iosevka Term:h24"
  vim.opt.linespace = 0
  vim.g.neovide_scale_factor = 1.0
  vim.g.neovide_transparency = 0.95
  vim.g.neovide_cursor_vfx_mode = "torpedo"

  vim.g.neovide_padding_top = 0
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_left = 0

  -- vim.g.neovide_input_use_logo = 1
  vim.api.nvim_set_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
  -- vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true})
  vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("t", "<D-v>", '<C-\\><C-n>"+Pi', { noremap = true, silent = true })

  -- vim.g.neovide_unlink_border_highlights = true

  vim.g.neovide_refresh_rate = 60

  vim.api.nvim_set_keymap(
    "n",
    "<C-=>",
    ":lua vim.g.neovide_scale_factor = math.min(vim.g.neovide_scale_factor + 0.1,  3.0)<CR>",
    { silent = true }
  )
  vim.api.nvim_set_keymap(
    "n",
    "<C-->",
    ":lua vim.g.neovide_scale_factor = math.max(vim.g.neovide_scale_factor - 0.1,  0.1)<CR>",
    { silent = true }
  )
end

return {
  colorscheme = "kanagawa-dragon",
  options = {
    opt = {
      showtabline = 0,
      tabstop = 4,
      shiftwidth = 4,
    },
    g = {
      icons_enabled = true,
    },
  },
  lsp = {
    formatting = {
      format_on_save = {
        enabled = true, -- enable format on save
        allow_filetypes = { -- only allow formatting on save for these filetypes
          "lua",
          "python",
          "go",
        },
      },
    },
  },
  plugins = {
    "AstroNvim/astrocommunity",
    -- { import = "astrocommunity.git.git-blame-nvim" },
    { "rebelot/kanagawa.nvim" },
    { import = "astrocommunity.color.transparent-nvim" },
    {
      "echasnovski/mini.nvim",
      init = function()
        local statusline = require "mini.statusline"
        statusline.setup { use_icons = true }
        --  here we set the section for cursor location to LINE:COLUMN
        ---@diagnostic disable-next-line: duplicate-set-field
        statusline.section_location = function() return "%2l:%-2v" end
      end,
    },
    {
      "rebelot/heirline.nvim",
      optional = true,
      opts = function(_, opts)
        opts.statusline = nil
        opts.winbar = nil
      end,
    },
  },
}
