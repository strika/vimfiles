Strika's Vim configuration
==========================

Thanks to these guys:

* [Drew Neil](http://vimcasts.org)
* [Gary Bernhardt](http://destroyallsoftware.com)
* [Janus project](https://github.com/carlhuda/janus)
* [Mislav Marohnić](http://mislav.uniqpath.com/)
* [Tim Pope](http://tbaggery.com)

## Installation:

Prerequisites: ruby, git, ack.

1. Move your existing configuration somewhere else:  
   `mv ~/.vim* ~/.gvim* my_backup`
2. Clone this repo into ".vim":  
   `git clone https://github.com/strika/vimfiles ~/.vim`
3. Go into ".vim" and run "rake":  
   `cd ~/.vim && rake`
4. Open vim and run:
   `:BundleInstall`

This will install "~/.vimrc" and "~/.gvimrc" symlinks that point to
files inside the ".vim" directory.

## Features:

### `vimrc`

* 2 spaces, no tabs
* incremental, case-insensitive search
* 'Leader' character mapped to "," (comma)
* `<CR>` - remove highlighting after search
* cursor keys for movement are disabled
* `<C-j/k/h/l>` - switch between splits (no need to prepend `<C-w>`)
* relative line numbers by default
* `<C-n>` switches between relative and absolute line numbers
* `Q` - format lines
* `,,` alternates between two most recent buffers
* `,f` - opens file search with :CtrlP plugin:
  * `,b` - search in directory of current buffer
  * `,gl` - in `lib/`
  * `,gm` - in `app/models`
  * `,gv` - in `app/views`
  * `,gc` - in `app/controllers`
  * `,gs` - in `specs`
* `,cf` - search for merge conflicts in buffer
* `:KillWhitespace` - strip trailing whitespace
* `,,` switches between two last buffers
* `,s` opens spec
* `,v` opens spec in split view

### Ack

* `:Ack -w foo_bar --no-js --no-css`
* `:Ack!` - search, but don't jump to first match
* `:AckFromSearch`
* `:AckAdd` - append to existing quickfix list
* `,a` - opens Ack with cursor between ""
* `,A` - opens Ack and searches for the word below cursor

### Surround

* `cs"'` - change string from double to single quotes
* `ds(` - delete surrounding parentheses
* `ysiW]` - surround current WORD with square brackets
* `ysst` - surround current line in a HTML tag
* `ysip<c-t>` - nest current paragraph in a HTML tag

Visual mode: `S`. Insert mode: `<c-s>`.

Surround + rails.vim:

* `-` → `<% -%>`
* `=` → `<%= %>`
* `#` → `<%# %>`
* `e` - nest block and append `end` keyword
* `E` - like `e`, but prompt for text to prepend before block

### Commentary

* `\\{motion}` - comment/uncomment lines that {motion} moves over
* `\\\` - comment/uncomment [count] lines
* `{Visual}\\` - comment/uncomment the highlighted lines
* `\\u` - uncomment the current and adjacent commented lines

### ruby.vim

Motions:

* `]m` / `[m` - next / previous method
* `]M` / `[M` - end of method definition
* `]]` / `[[` - next / previous class/module
* `][` / `[]` - end of class/module

Text objects:

* `am` - a method
* `im` - inner method
* `aM` - a class
* `iM` - inner class

### matchit.vim

`%` alternates between matching HTML tags, class/control flow statements and
matching `end` in Ruby, and more. Also works in visual mode.

### Tabular

In visual mode:

* `:Tabularize assignment`
* `:Tabularize argument_list`
* `:Tabularize /=>`

### Fugitive

* `:Gcommit`
* `:Gstatus`
  * jump between lines that represent files with `<c-n>`, `<c-p>`
  * `-` - add/reset file (visual mode too)
  * `<Enter>` - open current file in the window below
  * `p` - run `git add --patch` for current file
  * `C` - invoke `:Gcommit`
* `:[range]Gbrowse! -` - copy GitHub URL for code that's currently selected
* `:[range]Gblame`

* `:Gedit feature:%` - version of the current file in the "feature" branch
* `:Gwrite` - `add %`
* `:Gread` - `checkout %`
* `:Gremove` - `rm %`
* `:Gmove <dest>` - `mv % <dest>`

## Plugins:

* ack
* coffee-script
* commentary
* ctrlp
* endwise
* fugitive
* javascript
* markdown
* rails
* ruby
* vim-textobj-rubyblock
* vimclojure

## Included colorschemes:

* solarized
