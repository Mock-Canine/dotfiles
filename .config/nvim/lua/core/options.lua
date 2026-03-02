-- Display options
vim.wo.number = true -- Make line numbers default
vim.wo.signcolumn = 'yes' -- Keep signcolumn on by default
vim.o.relativenumber = true -- set relative numbered lines
vim.o.wrap = false -- display lines as one long line
vim.o.linebreak = true -- companion to wrap don't split words(only works when wrap is true)
vim.o.breakindent = true -- Enable break indent(only works when wrap is true)
vim.o.scrolloff = 4 -- minimal number of screen lines to keep above and below the cursor
vim.o.sidescrolloff = 8 -- minimal number of screen columns either side of cursor if wrap is `false`
vim.o.splitbelow = true -- force all horizontal splits to go below current window
vim.o.splitright = true -- force all vertical splits to go to the right of current window
vim.o.cmdheight = 1 -- more space in the neovim command line for displaying messages
vim.g.have_nerd_font = true

-- Search options
vim.o.hlsearch = false -- Set highlight on search
vim.o.ignorecase = true -- Case-insensitive searching UNLESS \C or capital in search
vim.o.smartcase = true -- smart case
vim.opt.iskeyword:append '-' -- hyphenated words recognized by searches
vim.opt.wildmode = 'list:longest' -- list all matches, and only complete to longest common match
vim.opt.wildignore = '*.png,*.jpg,*.gif,*.swp,*.o' -- Do not suggest the files

-- System related options
vim.o.fileencoding = 'utf-8' -- the encoding written to a file
vim.o.clipboard = 'unnamedplus' -- Sync clipboard between OS and Neovim.
vim.o.mouse = 'a' -- Enable mouse mode
vim.o.whichwrap = 'bshl' -- which "horizontal" keys are allowed to travel to prev/next line
vim.o.updatetime = 250 -- Decrease update time
vim.o.timeoutlen = 300 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.o.backup = false -- creates a backup file
vim.o.swapfile = false -- creates a swapfile
vim.o.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.o.undofile = true -- Save undo history even after closing the file
vim.opt.runtimepath:remove '/usr/share/vim/vimfiles' -- separate vim plugins from neovim in case vim still in use
  -- more useful diffs (nvim -d) by ignoring whitespace and smarter algorithm
vim.opt.diffopt:append('iwhite')
vim.opt.diffopt:append('algorithm:histogram')
vim.opt.diffopt:append('indent-heuristic')
vim.opt.colorcolumn = '80' -- show a column at 80 characters as a guide for long lines
vim.opt.list = true
vim.opt.listchars = 'nbsp:¬,extends:»,precedes:«,trail:•' -- show more hidden characters
vim.g.c_syntax_for_h = 1

-- Editing options
vim.opt.termguicolors = true -- set termguicolors to enable highlight groups
vim.o.cursorline = false -- highlight the current line
vim.o.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.o.tabstop = 4 -- insert n spaces for a tab
vim.o.softtabstop = 4 -- Number of spaces that a tab counts for while performing editing operations
vim.o.expandtab = true -- convert tabs to spaces
vim.o.smartindent = true -- make indenting smarter again
vim.o.autoindent = true -- copy indent from current line when starting new one
vim.o.backspace = 'indent,eol,start' -- allow backspace on
vim.o.completeopt = 'menuone,noselect' -- Set completeopt to have a better completion experience
vim.o.pumheight = 10 -- pop up menu height
vim.opt.shortmess:append 'c' -- don't give |ins-completion-menu| messages
vim.opt.formatoptions:remove { 'c', 'r', 'o' } -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.
