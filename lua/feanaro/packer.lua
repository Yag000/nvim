-- Only required if you have packer configured as `opt`
vim.cmd.packadd("packer.nvim")

return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        -- or                            , branch = '0.1.x',
        requires = { { "nvim-lua/plenary.nvim" } },
    })

    use({ "catppuccin/nvim", as = "catppuccin" })

    use({
        "nvim-treesitter/nvim-treesitter",

        run = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
    })

    use("nvim-treesitter/playground")
    use("theprimeagen/harpoon")
    use("mbbill/undotree")
    use("tpope/vim-fugitive")

    use({
        "VonHeikemen/lsp-zero.nvim",
        branch = "v1.x",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },

            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
        },
    })

    use({
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup({
                icons = false,
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end,
    })

    use({
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                panel = {
                    enabled = true,
                    auto_refresh = false,
                    keymap = {
                        jump_prev = "[[",
                        jump_next = "]]",
                        accept = "<CR>",
                        refresh = "gr",
                        open = "<M-CR>",
                    },
                    layout = {
                        position = "bottom", -- | top | left | right
                        ratio = 0.4,
                    },
                },
                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                    debounce = 75,
                    keymap = {
                        accept = "<M-l>",
                        accept_word = false,
                        accept_line = false,
                        next = "<M-]>",
                        prev = "<M-[>",
                        dismiss = "<C-]>",
                    },
                },
                filetypes = {
                    yaml = true,
                    markdown = true,
                    help = false,
                    gitcommit = true,
                    gitrebase = true,
                    hgcommit = false,
                    svn = false,
                    cvs = false,
                    ["."] = false,
                },
            })
        end,
    })

    use("ThePrimeagen/vim-be-good")
    use("eandrju/cellular-automaton.nvim")

    use("jose-elias-alvarez/null-ls.nvim") -- Useful for formatting

    use("christoomey/vim-tmux-navigator")  -- tmux & split window navigation

    -- auto closing
    use("windwp/nvim-autopairs")       -- autoclose parens, brackets, quotes, etc...

    use("norcalli/nvim-colorizer.lua") -- colorize hex codes, etc...

    -- Add context at the top of the buffer
    use("nvim-treesitter/nvim-treesitter-context")

    -- Telescope plugins
    use({
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
    })

    use {
        "AckslD/nvim-neoclip.lua",
        requires = {
            'nvim-telescope/telescope.nvim',
        },
    }

    use { 'nvim-telescope/telescope-ui-select.nvim' }

    use({
        "aaronhallaert/advanced-git-search.nvim",
        config = function()
            -- optional: setup telescope before loading the extension
            require("telescope").setup {
                -- move this to the place where you call the telescope setup function
                extensions = {
                    advanced_git_search = {
                        -- Insert Config here
                    }
                }
            }

            require("telescope").load_extension("advanced_git_search")
        end,
        requires = {
            -- Insert Dependencies here
        },
    })

    use {
        "nvim-telescope/telescope-live-grep-args.nvim",
    }

    use 'lervag/vimtex'
end)
