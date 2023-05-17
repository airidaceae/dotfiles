-- vim: set noet ts=2 sw=2

vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function()
	use 'wbthomason/packer.nvim'


	-------------------
	-- Color Schemes --
	-------------------

	-- Base16 Themes
	use {'chriskempson/base16-vim', opt = true}

	-- Rosé Pine
	use ({
		'rose-pine/neovim',
		as = 'rose-pine',
		config = function()
			require('rose-pine').setup {
				disable_background = true
			}
			vim.cmd('colorscheme rose-pine')
		end
	})

	-- Seoul256 (and Goyo writing mode)
	use ({
		'junegunn/seoul256.vim',
		opt = true,
		config = function()
			vim.g.seoul256_background = 234
		end
	})
	use {'junegunn/goyo.vim', opt = true, cmd = 'Goyo'}


	-- TOML
	use {'cespare/vim-toml', opt = true}

	-- Rust
	use {'rust-lang/rust.vim', opt = true}

	-- RON
	use {'ron-rs/ron.vim', opt = true}

	-- GLSL
	use {'tikhomirov/vim-glsl', opt = true}

	-- Yuck (eww config format)
	use {'elkowar/yuck.vim'}

	-- Parinfer (for yuck and other yucky stuff like Lisp)
	use {'eraserhd/parinfer-rust', run = "cargo build --release"}

	-- VimTeX
	use {'lervag/vimtex', opt = true, ft = { "tex" }}

	-- Icons
	use {'kyazdani42/nvim-web-devicons'}

	-- Status Line: Lualine
	use {
		'nvim-lualine/lualine.nvim',
		after = 'rose-pine',  -- Avoid race w/ bar reading colorscheme
		requires = {'kyazdani42/nvim-web-devicons', opt = true},
		config = function()
			require('lualine').setup {
				options = {
					icons_enabled = true,
					theme = 'rose-pine',
					component_separators = { left = '│', right = '│'},
					section_separators = { left = ' ', right = ' '},
					disabled_filetypes = {},
					always_divide_middle = true,
				},
				sections = {
					lualine_a = {{'mode', fmt = function(str) return str:sub(1,1) end}},
					lualine_b = {
						'branch',
						{
							'diff',
							colored = true,
						},
						{
							'diagnostic',
							sources = {'coc', 'nvim_diagnostic'},
							update_in_insert = true
						},
					},
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
				extensions = {}
			}
	end}

	-- Syntax Highlighting: Treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = function()
			require('nvim-treesitter.configs').setup {
				ensure_installed = "all",
				sync_install = false,
				ignore_install = {""},
				highlight = {
					enable = true,
					disable = { "latex" },
					-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
					-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
					-- Using this option may slow down your editor, and you may see some duplicate highlights.
					-- Instead of true it can also be a list of languages
					additional_vim_regex_highlighting = false,
				},
				indent = {
					enable = true
				}
			}
	end}

	-- Code Formatting: Neoformat
	use {
		'sbdchd/neoformat'
	}

	-- LSP: CoC
	use {
		'neoclide/coc.nvim', 
		branch = 'release',
		run = ':CocUpdateSync',
		config = function()
			vim.cmd('let g:coc_global_extensions = ["coc-snippets", "coc-json", "coc-rust-analyzer", "coc-toml", "coc-vimtex", "coc-clangd", "coc-java", "coc-sh", "coc-lua", "coc-highlight", "coc-prettier"]')
		end
	}


	-- Tab Bar: Barbar
	use {
		'romgrk/barbar.nvim',
		requires = {'kyazdani42/nvim-web-devicons'}
	}

	-- Key Chording Helper: whick-key.nvim
	use {
		'folke/which-key.nvim',
		config = function()
			require('which-key').setup {
				-- TODO: Figure out how to put config in here
			}
		end
	}

	-- Fuzzy Finder: telescope.nvim
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} },
		config = function()  -- Nothing here is actually applied.
			local actions = require('telescope.actions')
			require('telescope').setup{
				defaults = {
				mappings = {
						i = {
							["<esc>"] = actions.close
						},
				},
				vimgrep_arguments = {
					'rg',
					'--color=never',
					'--hidden',
					'--no-heading',
					'--with-filename',
					'--line-number',
					'--column',
					'--smart-case'
				},
					prompt_prefix = "> ",
					selection_caret = "> ",
					entry_prefix = "	",
					initial_mode = "insert",
					selection_strategy = "reset",
					sorting_strategy = "descending",
					layout_strategy = "horizontal",
					layout_config = {
						horizontal = {
							mirror = false,
						},
						vertical = {
							mirror = false,
						},
					},
					file_sorter =  require'telescope.sorters'.get_fuzzy_file,
					file_ignore_patterns = {},
					generic_sorter =	require'telescope.sorters'.get_generic_fuzzy_sorter,
					winblend = 0,
					border = {},
					borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
					color_devicons = true,
					use_less = true,
					path_display = {},
					set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
					file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
					grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
					qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
				}
		}
	end}



end)
