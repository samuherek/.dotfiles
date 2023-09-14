if vim.g.vscode then
    -- VSCode extension
    vim.keymap.set("n", "<C-d>", "<C-d>zz")
    vim.keymap.set("n", "<C-u>", "<C-u>zz")
else
    -- ordinary Neovim
    require("samuherek.remap")
    require("samuherek.packer")
    require("samuherek.set")
end
