-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/airis/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/airis/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/airis/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/airis/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/airis/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["barbar.nvim"] = {
    loaded = true,
    path = "/home/airis/.local/share/nvim/site/pack/packer/start/barbar.nvim",
    url = "https://github.com/romgrk/barbar.nvim"
  },
  ["base16-vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/airis/.local/share/nvim/site/pack/packer/opt/base16-vim",
    url = "https://github.com/chriskempson/base16-vim"
  },
  ["coc.nvim"] = {
    config = { "\27LJ\2\nÞ\1\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0¾\1let g:coc_global_extensions = [\"coc-snippets\", \"coc-json\", \"coc-rust-analyzer\", \"coc-toml\", \"coc-vimtex\", \"coc-clangd\", \"coc-java\", \"coc-sh\", \"coc-lua\", \"coc-highlight\", \"coc-prettier\"]\bcmd\bvim\0" },
    loaded = true,
    path = "/home/airis/.local/share/nvim/site/pack/packer/start/coc.nvim",
    url = "https://github.com/neoclide/coc.nvim"
  },
  ["goyo.vim"] = {
    commands = { "Goyo" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/airis/.local/share/nvim/site/pack/packer/opt/goyo.vim",
    url = "https://github.com/junegunn/goyo.vim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/airis/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n\31\0\1\6\0\1\0\5\18\3\0\0009\1\0\0)\4\1\0)\5\1\0D\1\4\0\bsubå\5\1\0\a\0%\00096\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\t\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\0034\4\0\0=\4\b\3=\3\n\0025\3\14\0004\4\3\0005\5\v\0003\6\f\0=\6\r\5>\5\1\4=\4\15\0035\4\16\0005\5\17\0>\5\2\0045\5\18\0005\6\19\0=\6\20\5>\5\3\4=\4\21\0035\4\22\0=\4\23\0035\4\24\0=\4\25\0035\4\26\0=\4\27\0035\4\28\0=\4\29\3=\3\30\0025\3\31\0004\4\0\0=\4\15\0034\4\0\0=\4\21\0035\4 \0=\4\23\0035\4!\0=\4\25\0034\4\0\0=\4\27\0034\4\0\0=\4\29\3=\3\"\0024\3\0\0=\3#\0024\3\0\0=\3$\2B\0\2\1K\0\1\0\15extensions\ftabline\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\fsources\1\3\0\0\bcoc\20nvim_diagnostic\1\2\1\0\15diagnostic\21update_in_insert\2\1\2\1\0\tdiff\fcolored\2\1\2\0\0\vbranch\14lualine_a\1\0\0\bfmt\0\1\2\0\0\tmode\foptions\1\0\0\23disabled_filetypes\23section_separators\1\0\2\nright\6 \tleft\6 \25component_separators\1\0\2\nright\bâ”‚\tleft\bâ”‚\1\0\3\18icons_enabled\2\25always_divide_middle\2\ntheme\14rose-pine\nsetup\flualine\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/airis/.local/share/nvim/site/pack/packer/opt/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  neoformat = {
    loaded = true,
    path = "/home/airis/.local/share/nvim/site/pack/packer/start/neoformat",
    url = "https://github.com/sbdchd/neoformat"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nÿ\1\0\0\5\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0005\4\a\0=\4\b\3=\3\t\0025\3\n\0=\3\v\2B\0\2\1K\0\1\0\vindent\1\0\1\venable\2\14highlight\fdisable\1\2\0\0\nlatex\1\0\2\venable\2&additional_vim_regex_highlighting\1\19ignore_install\1\2\0\0\5\1\0\2\17sync_install\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/airis/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/airis/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/airis/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["parinfer-rust"] = {
    loaded = true,
    path = "/home/airis/.local/share/nvim/site/pack/packer/start/parinfer-rust",
    url = "https://github.com/eraserhd/parinfer-rust"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/airis/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["ron.vim"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/airis/.local/share/nvim/site/pack/packer/opt/ron.vim",
    url = "https://github.com/ron-rs/ron.vim"
  },
  ["rose-pine"] = {
    after = { "lualine.nvim" },
    config = { "\27LJ\2\n€\1\0\0\3\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0'\2\6\0B\0\2\1K\0\1\0\26colorscheme rose-pine\bcmd\bvim\1\0\1\23disable_background\2\nsetup\14rose-pine\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/home/airis/.local/share/nvim/site/pack/packer/start/rose-pine",
    url = "https://github.com/rose-pine/neovim"
  },
  ["rust.vim"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/airis/.local/share/nvim/site/pack/packer/opt/rust.vim",
    url = "https://github.com/rust-lang/rust.vim"
  },
  ["seoul256.vim"] = {
    config = { "\27LJ\2\n5\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1ê\0=\1\2\0K\0\1\0\24seoul256_background\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/airis/.local/share/nvim/site/pack/packer/opt/seoul256.vim",
    url = "https://github.com/junegunn/seoul256.vim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nŽ\b\0\0\b\0)\0@6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3'\0005\4\t\0005\5\a\0005\6\5\0009\a\4\0=\a\6\6=\6\b\5=\5\n\0045\5\v\0=\5\f\0045\5\14\0005\6\r\0=\6\15\0055\6\16\0=\6\17\5=\5\18\0046\5\0\0'\a\19\0B\5\2\0029\5\20\5=\5\21\0044\5\0\0=\5\22\0046\5\0\0'\a\19\0B\5\2\0029\5\23\5=\5\24\0044\5\0\0=\5\25\0045\5\26\0=\5\27\0044\5\0\0=\5\28\0045\5\29\0=\5\30\0046\5\0\0'\a\31\0B\5\2\0029\5 \0059\5!\5=\5\"\0046\5\0\0'\a\31\0B\5\2\0029\5#\0059\5!\5=\5$\0046\5\0\0'\a\31\0B\5\2\0029\5%\0059\5!\5=\5&\4=\4(\3B\1\2\1K\0\1\0\rdefaults\1\0\0\21qflist_previewer\22vim_buffer_qflist\19grep_previewer\23vim_buffer_vimgrep\19file_previewer\bnew\19vim_buffer_cat\25telescope.previewers\fset_env\1\0\1\14COLORTERM\14truecolor\17path_display\16borderchars\1\t\0\0\bâ”€\bâ”‚\bâ”€\bâ”‚\bâ•­\bâ•®\bâ•¯\bâ•°\vborder\19generic_sorter\29get_generic_fuzzy_sorter\25file_ignore_patterns\16file_sorter\19get_fuzzy_file\22telescope.sorters\18layout_config\rvertical\1\0\1\vmirror\1\15horizontal\1\0\0\1\0\1\vmirror\1\22vimgrep_arguments\1\t\0\0\arg\18--color=never\r--hidden\17--no-heading\20--with-filename\18--line-number\r--column\17--smart-case\rmappings\1\0\n\rwinblend\3\0\19color_devicons\2\ruse_less\2\18prompt_prefix\a> \20selection_caret\a> \17entry_prefix\6\t\17initial_mode\vinsert\23selection_strategy\nreset\21sorting_strategy\15descending\20layout_strategy\15horizontal\6i\1\0\0\n<esc>\1\0\0\nclose\nsetup\14telescope\22telescope.actions\frequire\0" },
    loaded = true,
    path = "/home/airis/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-glsl"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/airis/.local/share/nvim/site/pack/packer/opt/vim-glsl",
    url = "https://github.com/tikhomirov/vim-glsl"
  },
  ["vim-toml"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/airis/.local/share/nvim/site/pack/packer/opt/vim-toml",
    url = "https://github.com/cespare/vim-toml"
  },
  vimtex = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/airis/.local/share/nvim/site/pack/packer/opt/vimtex",
    url = "https://github.com/lervag/vimtex"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/home/airis/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["yuck.vim"] = {
    loaded = true,
    path = "/home/airis/.local/share/nvim/site/pack/packer/start/yuck.vim",
    url = "https://github.com/elkowar/yuck.vim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nŽ\b\0\0\b\0)\0@6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3'\0005\4\t\0005\5\a\0005\6\5\0009\a\4\0=\a\6\6=\6\b\5=\5\n\0045\5\v\0=\5\f\0045\5\14\0005\6\r\0=\6\15\0055\6\16\0=\6\17\5=\5\18\0046\5\0\0'\a\19\0B\5\2\0029\5\20\5=\5\21\0044\5\0\0=\5\22\0046\5\0\0'\a\19\0B\5\2\0029\5\23\5=\5\24\0044\5\0\0=\5\25\0045\5\26\0=\5\27\0044\5\0\0=\5\28\0045\5\29\0=\5\30\0046\5\0\0'\a\31\0B\5\2\0029\5 \0059\5!\5=\5\"\0046\5\0\0'\a\31\0B\5\2\0029\5#\0059\5!\5=\5$\0046\5\0\0'\a\31\0B\5\2\0029\5%\0059\5!\5=\5&\4=\4(\3B\1\2\1K\0\1\0\rdefaults\1\0\0\21qflist_previewer\22vim_buffer_qflist\19grep_previewer\23vim_buffer_vimgrep\19file_previewer\bnew\19vim_buffer_cat\25telescope.previewers\fset_env\1\0\1\14COLORTERM\14truecolor\17path_display\16borderchars\1\t\0\0\bâ”€\bâ”‚\bâ”€\bâ”‚\bâ•­\bâ•®\bâ•¯\bâ•°\vborder\19generic_sorter\29get_generic_fuzzy_sorter\25file_ignore_patterns\16file_sorter\19get_fuzzy_file\22telescope.sorters\18layout_config\rvertical\1\0\1\vmirror\1\15horizontal\1\0\0\1\0\1\vmirror\1\22vimgrep_arguments\1\t\0\0\arg\18--color=never\r--hidden\17--no-heading\20--with-filename\18--line-number\r--column\17--smart-case\rmappings\1\0\n\rwinblend\3\0\19color_devicons\2\ruse_less\2\18prompt_prefix\a> \20selection_caret\a> \17entry_prefix\6\t\17initial_mode\vinsert\23selection_strategy\nreset\21sorting_strategy\15descending\20layout_strategy\15horizontal\6i\1\0\0\n<esc>\1\0\0\nclose\nsetup\14telescope\22telescope.actions\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: coc.nvim
time([[Config for coc.nvim]], true)
try_loadstring("\27LJ\2\nÞ\1\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0¾\1let g:coc_global_extensions = [\"coc-snippets\", \"coc-json\", \"coc-rust-analyzer\", \"coc-toml\", \"coc-vimtex\", \"coc-clangd\", \"coc-java\", \"coc-sh\", \"coc-lua\", \"coc-highlight\", \"coc-prettier\"]\bcmd\bvim\0", "config", "coc.nvim")
time([[Config for coc.nvim]], false)
-- Config for: rose-pine
time([[Config for rose-pine]], true)
try_loadstring("\27LJ\2\n€\1\0\0\3\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0'\2\6\0B\0\2\1K\0\1\0\26colorscheme rose-pine\bcmd\bvim\1\0\1\23disable_background\2\nsetup\14rose-pine\frequire\0", "config", "rose-pine")
time([[Config for rose-pine]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nÿ\1\0\0\5\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0005\4\a\0=\4\b\3=\3\t\0025\3\n\0=\3\v\2B\0\2\1K\0\1\0\vindent\1\0\1\venable\2\14highlight\fdisable\1\2\0\0\nlatex\1\0\2\venable\2&additional_vim_regex_highlighting\1\19ignore_install\1\2\0\0\5\1\0\2\17sync_install\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd lualine.nvim ]]

-- Config for: lualine.nvim
try_loadstring("\27LJ\2\n\31\0\1\6\0\1\0\5\18\3\0\0009\1\0\0)\4\1\0)\5\1\0D\1\4\0\bsubå\5\1\0\a\0%\00096\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\t\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\0034\4\0\0=\4\b\3=\3\n\0025\3\14\0004\4\3\0005\5\v\0003\6\f\0=\6\r\5>\5\1\4=\4\15\0035\4\16\0005\5\17\0>\5\2\0045\5\18\0005\6\19\0=\6\20\5>\5\3\4=\4\21\0035\4\22\0=\4\23\0035\4\24\0=\4\25\0035\4\26\0=\4\27\0035\4\28\0=\4\29\3=\3\30\0025\3\31\0004\4\0\0=\4\15\0034\4\0\0=\4\21\0035\4 \0=\4\23\0035\4!\0=\4\25\0034\4\0\0=\4\27\0034\4\0\0=\4\29\3=\3\"\0024\3\0\0=\3#\0024\3\0\0=\3$\2B\0\2\1K\0\1\0\15extensions\ftabline\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\fsources\1\3\0\0\bcoc\20nvim_diagnostic\1\2\1\0\15diagnostic\21update_in_insert\2\1\2\1\0\tdiff\fcolored\2\1\2\0\0\vbranch\14lualine_a\1\0\0\bfmt\0\1\2\0\0\tmode\foptions\1\0\0\23disabled_filetypes\23section_separators\1\0\2\nright\6 \tleft\6 \25component_separators\1\0\2\nright\bâ”‚\tleft\bâ”‚\1\0\3\18icons_enabled\2\25always_divide_middle\2\ntheme\14rose-pine\nsetup\flualine\frequire\0", "config", "lualine.nvim")

time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Goyo lua require("packer.load")({'goyo.vim'}, { cmd = "Goyo", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType tex ++once lua require("packer.load")({'vimtex'}, { ft = "tex" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/airis/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]], true)
vim.cmd [[source /home/airis/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]]
time([[Sourcing ftdetect script at: /home/airis/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]], false)
time([[Sourcing ftdetect script at: /home/airis/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], true)
vim.cmd [[source /home/airis/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]]
time([[Sourcing ftdetect script at: /home/airis/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], false)
time([[Sourcing ftdetect script at: /home/airis/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]], true)
vim.cmd [[source /home/airis/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]]
time([[Sourcing ftdetect script at: /home/airis/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
