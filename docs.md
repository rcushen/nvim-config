# Key Mappings

`<leader>w`: Write the current buffer
`<leader>q`: Close the currrent buffer

`<leader>y`: Yank the selection to system register
`<leader>Y`: Yank the line to system register

`<leader>u`: Open and focus undotree

`<leader>f`: Format the current buffer, using the LSP

`<leader>ff`: Find all files, respecting gitignore
`<leader>fe`: Find the current buffer in the file tree
`<leader>fb`: Find all buffers
`<leader>fb`: Live grep
`<leader>fh`: Find help tags

`<C-x>`: Open hsplit above from Telescope or nvim-tree
`<C-v>`: Open vsplit left from Telescope or nvim-tree

`<leader>xx`: Toggle the Trouble window
`<leader>xw`: Toggle the Trouble window for the current workspace
`<leader>xd`: Toggle the Trouble window for the current document
`<leader>xq`: Toggle the trouble window for the quickfix list
`<leader>xq`: Toggle the trouble window for the location list
`gR`: Toggles the trouble window to show references to the symbol under the cursor
    based on the Language Server Protocol (LSP) references. This is particularly
    useful when you're using Neovim's built-in LSP client or a similar plugin to work
    with code, as it allows you to quickly see where functions, variables, or other
    symbols are being used across your project.

`zc`: Close a fold
`zo`: Open a fold
`zM`: Close all folds
`zR`: Open all folds

`gcc`: Comment out a line
`gc`: Comment out the selection

`<leader>vws`: Search for workspace symbols
`<leader>vd`: Pop up a floating dialogue with diagnostics
`K`: Pop up a floating dialogue with information on the symbol
`"[d"` and `"]d"` navigate to the next and previous diagnostic messages, respectively.

`"<leader>vca"` shows code actions available at the cursor location.
`"<leader>vrr"` lists references to the symbol under the cursor in the quickfix window.
`"<leader>vrn"` renames the symbol under the cursor.

`"<leader>vrr"` lists references to the symbol under the cursor in the quickfix window.
`"<leader>vrn"` renames the symbol under the cursor.

# Useful Commands

:StripWhitespace
