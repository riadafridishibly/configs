vim.api.nvim_create_autocmd("FileType", {
  desc = "Set spell and tw when editing commit message",
  pattern = {"gitcommit"},
  command = "setlocal spell tw=72",
})

vim.api.nvim_create_autocmd(
  {"BufRead", "BufNewFile"},
  { pattern = { "*.md", "*.tex"}, command = "setlocal spell" }
)

vim.g['gitblame_date_format'] = '%r'
vim.o.guifont ="JetBrainsMono Nerd Font:h22"
vim.o.scrolloff = 10

if vim.g.neovide == true then
  vim.api.nvim_set_keymap("n", "<C-=>", ":lua vim.g.neovide_scale_factor = math.min(vim.g.neovide_scale_factor + 0.1,  3.0)<CR>", { silent = true })
  vim.api.nvim_set_keymap("n", "<C-->", ":lua vim.g.neovide_scale_factor = math.max(vim.g.neovide_scale_factor - 0.1,  0.1)<CR>", { silent = true })
  -- vim.api.nvim_set_keymap("n", "<C-+>", ":lua vim.g.neovide_transparency = math.min(vim.g.neovide_transparency + 0.05, 1.0)<CR>", { silent = true })
  -- vim.api.nvim_set_keymap("n", "<C-_>", ":lua vim.g.neovide_transparency = math.max(vim.g.neovide_transparency - 0.05, 0.0)<CR>", { silent = true })
  -- vim.api.nvim_set_keymap("n", "<C-0>", ":lua vim.g.neovide_scale_factor = 0.5<CR>", { silent = true })
  -- vim.api.nvim_set_keymap("n", "<C-)>", ":lua vim.g.neovide_transparency = 0.9<CR>", { silent = true })
end

return {
  colorscheme = "duskfox",
  options = {
    opt = {
      tabstop = 4,
      shiftwidth = 4,
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
    { import = "astrocommunity.colorscheme.nightfox-nvim" },
    -- { import = "astrocommunity.colorscheme.github-nvim-theme" },
    -- { import = "astrocommunity.color.transparent-nvim" },
  },
}
