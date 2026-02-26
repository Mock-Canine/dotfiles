-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
local opts = { noremap = true, silent = true }


-- Optimize existing keymaps
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true }) -- Disable the spacebar key's default behavior in Normal and Visual modes

vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true }) -- Allow moving the cursor through wrapped lines with j, k
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set('n', '<Esc>', ':noh<CR>', opts) -- clear highlights

vim.keymap.set('n', 'x', '"_x', opts) -- delete single character without copying into register

vim.keymap.set('n', '<C-d>', '<C-d>zz', opts) -- Vertical scroll and center
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

vim.keymap.set('n', 'n', 'nzzzv') -- Find and center(zv for unfold if needed)
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', '*', '*zzzv')
vim.keymap.set('n', '#', '#zzzv')
vim.keymap.set('n', 'g*', 'g*zzzv')

vim.keymap.set('n', '?', '?\\v') -- "very magic" (less escaping needed) regexes by default
vim.keymap.set('n', '/', '/\\v')
vim.keymap.set('c', '%s/', '%sm/')

vim.keymap.set('v', 'p', '"_dP', opts) -- Keep last yanked when pasting

local function put_and_strip(key) -- Make `p` / `P` strip Windows CR (^M)
  return function()
    vim.cmd("normal! " .. key)
    vim.cmd([['[,']s/\r//ge]])
  end
end
vim.keymap.set("n", "p", put_and_strip("p"), opts)
vim.keymap.set("n", "P", put_and_strip("P"), opts)


-- Newly defined keymaps
vim.keymap.set('', 'H', '^') -- Jump to start and end of line using the home row keys
vim.keymap.set('', 'L', '$')

vim.keymap.set('n', '<C-w>e', '<C-w>=', opts) -- Window management(<C-w> is the prefix key of window operations)

vim.keymap.set('n', '<C-s>', ':mksession! .session.vim<CR>', { noremap = true, silent = false, desc = 'Save session'}) -- Save and load session
vim.keymap.set('n', '<C-l>', ':source .session.vim<CR>', { noremap = true, silent = false, desc = 'Load session'})

vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts) -- Buffers
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)
vim.keymap.set('n', '<C-i>', '<C-i>', opts) -- to restore jump forward

vim.keymap.set('v', '<S-Tab>', '<gv', opts) -- Stay in indent mode
vim.keymap.set('v', '<Tab>', '>gv', opts)

--- Keymaps with leader key
vim.keymap.set('n', '<leader>tw', '<cmd>set wrap!<CR>',vim.tbl_extend('force', opts, {desc = '[T]oggle [W]rap'})) -- Toggle line wrapping

local diagnostics_active = true -- Toggle diagnostics

vim.keymap.set('n', '<leader>td', function()
  diagnostics_active = not diagnostics_active

  if diagnostics_active then
    vim.diagnostic.enable(true)
  else
    vim.diagnostic.enable(false)
  end
end, vim.tbl_extend('force', opts, {desc = '[T]oggle [D]iagnostics'}))

vim.keymap.set('n', '[d', function() -- Diagnostic keymaps
  vim.diagnostic.jump { count = -1, float = true }
end, { desc = 'Go to previous diagnostic message' })

vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump { count = 1, float = true }
end, { desc = 'Go to next diagnostic message' })

vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

