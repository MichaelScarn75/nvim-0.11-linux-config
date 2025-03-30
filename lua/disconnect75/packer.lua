-- This file can be loaded by calling `lua require('plugins')` from your init.vim
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    -- Packer can manage itself
    use ('wbthomason/packer.nvim')

    use ({
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    })

    -- Assorted Themes
    -- Uncomment here and also the relevant files in nvim/after/plugin/
    use ({
        'scottmckendry/cyberdream.nvim',
    })

    use ({
        'tiagovla/tokyodark.nvim',
        as = 'tokyodark',
    })

    use ({
        'rose-pine/neovim',
        as = 'rose-pine',
    })

    use({
        "craftzdog/solarized-osaka.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    })

    use ({
        "maxmx03/solarized.nvim",
    })

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/playground')
    use('ThePrimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use('vim-airline/vim-airline')
    use('vim-airline/vim-airline-themes')
    use('sharkdp/fd')
    use('BurntSushi/ripgrep')
    use('preservim/nerdtree')
    use('mfussenegger/nvim-dap')
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

    use('easymotion/vim-easymotion')

    use {'rmagatti/auto-session'}

    use {'stevearc/oil.nvim'}

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
