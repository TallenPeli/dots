-- Add plugin manager, I'm using packer because I don't like lazyvim
vim.cmd([[packadd packer.nvim]])

require('packer').startup(function()
    -- Plugin shit
    use 'lewis6991/gitsigns.nvim'
    use 'wbthomason/packer.nvim'
    use 'simrat39/symbols-outline.nvim'
    use 'neovim/nvim-lspconfig'
    use 'windwp/nvim-ts-autotag'
    use 'andweeb/presence.nvim'
    use 'justinmk/vim-dirvish'
    use 'brianhuster/dirvish-git.nvim'
    use 'echasnovski/mini.completion'
    use 'm4xshen/autoclose.nvim'
    use 'petertriho/nvim-scrollbar'
    use { "catppuccin/nvim", as = "catppuccin" }
    use {
      "folke/which-key.nvim",
      config = function()
        require("which-key").setup {}
      end
    }
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use "stevearc/dressing.nvim"
    use({
      "ziontee113/icon-picker.nvim",
      config = function()
        require("icon-picker").setup({
          disable_legacy_commands = true
        })
      end,
    })
end)

-- Language Servers :3
require'lspconfig'.pyright.setup{}
require'lspconfig'.clangd.setup{}
require'lspconfig'.rust_analyzer.setup{}
require'lspconfig'.html.setup{}
require'lspconfig'.cssls.setup{}
require'lspconfig'.lua_ls.setup{}
require'lspconfig'.jsonls.setup{}
-- I removed csharp_ls in favour of omnisharp because I use unity c# and not normal .net stuff
-- require'lspconfig'.csharp_ls.setup{}
require'lspconfig'.omnisharp.setup{}
require'lspconfig'.ts_ls.setup{}
require'lspconfig'.gdscript.setup{}

-- Set up the bottom tab thingy idk I copied teh config from github icl
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

-- This is for auto completing tags in html so I don't kill myself when trying to write html
require('nvim-ts-autotag').setup({
  opts = {
    enable_close = true, -- Auto close tags
    enable_rename = true, -- Auto rename pairs of tags
    enable_close_on_slash = false -- Auto close on trailing </
  },
  per_filetype = {
    ["xml"] = {
        enable_close = true
    }
  }
})

-- This is for the autocompletion thing
require('mini.completion').setup()

-- For gitsigns i guess
require('gitsigns').setup()

-- This is for the autoclose stuff plugin
require("autoclose").setup({
    options = {
        disabled_filetypes = { "text", "markdown" },
    },
})

-- Options for treesitter, for making sure some parsers are installed
require('nvim-treesitter').setup({
    ensure_installed = { 'gdscript' }
})

-- Setup for the telescope plugin
require('telescope').setup{}

-- Tiny plugin to show where errors are in your code so I don't forget about them
require("scrollbar").setup()

-- For the symbols sidebar. For looking at the structure of the code
require("symbols-outline").setup({
    highlight_hovered_item = true,
    show_guides = true,
    auto_preview = true,
    position = 'left',
    relative_width = true,
    width = 40,
    auto_close = false,
    show_numbers = false,
    show_relative_numbers = false,
    show_symbol_details = true,
    preview_bg_highlight = 'Pmenu',
    autofold_depth = nil,
    auto_unfold_hover = true,
    fold_markers = { '', '' },
    wrap = false,
    keymaps = { -- These keymaps can be a string or a table for multiple keys
        close = {"<Esc>", "q"},
        goto_location = "<Cr>",
        focus_location = "o",
        hover_symbol = "<C-space>",
        toggle_preview = "K",
        rename_symbol = "r",
        code_actions = "a",
        fold = "h",
        unfold = "l",
        fold_all = "W",
        unfold_all = "E",
        fold_reset = "R",
    },
    lsp_blacklist = {},
    symbol_blacklist = {},
    symbols = {
        File = { icon = "", hl = "@text.uri" },
        Module = { icon = "󰆧", hl = "@namespace" },
        Namespace = { icon = "", hl = "@namespace" },
        Package = { icon = "", hl = "@namespace" },
        Class = { icon = "", hl = "@type" },
        Method = { icon = "󰊕", hl = "@method" },
        Property = { icon = "", hl = "@method" },
        Field = { icon = "", hl = "@field" },
        Constructor = { icon = "", hl = "@constructor" },
        Enum = { icon = "", hl = "@type" },
        Interface = { icon = "", hl = "@type" },
        Function = { icon = "󰡱", hl = "@function" },
        Variable = { icon = "󰫧", hl = "@constant" },
        Constant = { icon = "", hl = "@constant" },
        String = { icon = "", hl = "@string" },
        Number = { icon = "󰎠", hl = "@number" },
        Boolean = { icon = "", hl = "@boolean" },
        Array = { icon = "", hl = "@constant" },
        Object = { icon = "󰅴", hl = "@type" },
        Key = { icon = "󰌆", hl = "@type" },
        Null = { icon = "NULL", hl = "@type" },
        EnumMember = { icon = "", hl = "@field" },
        Struct = { icon = "", hl = "@type" },
        Event = { icon = "", hl = "@type" },
        Operator = { icon = "", hl = "@operator" },
        TypeParameter = { icon = "󱄽", hl = "@parameter" },
        Component = { icon = "󰠱", hl = "@function" },
        Fragment = { icon = "", hl = "@constant" },
    },
})

-- Set up wl-clip for y and p commands because I want this shit to interact with my system better
vim.opt.clipboard = 'unnamedplus'

if vim.fn.executable('wl-copy') == 1 then
    vim.g.clipboard = {
        name = 'wl-clipboard',
        copy = {
            ['+'] = 'wl-copy',
            ['*'] = 'wl-copy',
        },
        paste = {
            ['+'] = 'wl-paste --no-newline',
            ['*'] = 'wl-paste --no-newline',
        },
        cache_enabled = 0,
    }
end

-- Set normal vim Preferences
vim.cmd([[set number relativenumber]])
vim.cmd([[set tabstop=4]])
vim.cmd([[set shiftwidth=4]])
vim.cmd([[set expandtab]])
vim.cmd([[syntax on]])

-- Set keybinds
vim.g.mapleader = "t"
-- telescope keybinds
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
-- Symbols outline keybinds
vim.keymap.set('n', '<leader>so', '<cmd>SymbolsOutline<CR>', { desc = 'Open Symbols outline' })
-- icon picker keybinds
vim.keymap.set('n', '<leader>np', '<cmd>IconPickerNormal nerd_font<CR>', { desc = 'Open nerd font picker' })
vim.keymap.set('n', '<leader>ep', '<cmd>IconPickerNormal emoji<CR>', { desc = 'Open emoji picker' })
vim.keymap.set('n', '<leader>sp', '<cmd>IconPickerNormal symbols<CR>', { desc = 'Open symbols picker' })
vim.keymap.set('n', '<leader>ip', '<cmd>IconPickerNormal emoji nerd_font symbols<CR>', { desc = 'Open icon picker' })

-- Disable netrw (file manager thing in neovim) because it's ass and I want dirvish instead
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set colors
vim.cmd.colorscheme "catppuccin-mocha"

