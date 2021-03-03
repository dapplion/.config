local o = vim.o
local w = vim.wo
local b = vim.bo

local utils = require('utils')

vim.g.mapleader = ';'

b.autoindent = true
b.expandtab = true
b.softtabstop = 4
b.shiftwidth = 4
b.tabstop = 4
b.smartindent = true
b.modeline = false

o.backspace = [[indent,eol,start]]
o.hidden = true
w.winfixwidth = true

o.lazyredraw = true

o.splitbelow = true
o.splitright = true

w.cursorline = true
b.synmaxcol = 4000

w.number = true
w.relativenumber = true

w.list = true
if vim.fn.has('multi_byte') == 1 and vim.o.encoding == 'utf-8' then
  o.listchars = [[tab:▸ ,extends:❯,precedes:❮,nbsp:±,trail:…]]
else
  o.listchars = [[tab:> ,extends:>,precedes:<,nbsp:.,trail:_]]
end

w.colorcolumn = [[100]]
w.wrap = false

o.termguicolors = true

o.clipboard = [[unnamed,unnamedplus]]

o.scrolloff = 4

o.timeoutlen = 300

o.mouse = 'a'

if o.shell == 'fish$' then
  o.shell = [[/bin/bash]]
end


o.completeopt = [[menuone,noinsert,noselect]]

-- General mappings, not depending on any plugins
utils.map('v', 'J', [[:m '>+1<cr>gv=gv]], {noremap = true})
utils.map('v', 'K', [[:m '<-2<cr>gv=gv]], {noremap = true})

utils.map('n', '<A-Tab>', ':tabnext<cr>', {noremap = true})
utils.map('n', '<A-S-Tab>', ':tabprev<cr>', {noremap = true})

utils.map('n', '<Up>', [[:echoerr "Do not do that!!"<cr>]], {noremap = true})
utils.map('n', '<Down>', [[:echoerr "Do not do that!!"<cr>]], {noremap = true})
utils.map('n', '<Left>', [[:echoerr "Do not do that!!"<cr>]], {noremap = true})
utils.map('n', '<Right>', [[:echoerr "Do not do that!!"<cr>]], {noremap = true})

utils.create_augroup({
  {'FileType', '*', 'setlocal', 'shiftwidth=4'},
  {'FileType', 'ocaml,lua', 'setlocal', 'shiftwidth=2'},
  {'FileType', 'dap-rel', [[lua require('dap.ext.autocompl').attach()]]}
}, 'Tab2')

utils.create_augroup({
  {'BufNewFile,BufReadPost', '*.md', 'set', 'filetype=markdown'},
  {'BufRead,BufNewFile', '*.yapl', 'set', 'filetype=yapl'}
}, 'BufE')
