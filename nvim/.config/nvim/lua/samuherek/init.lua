if vim.g.vscode then
    -- VSCode extension
else
    -- ordinary Neovim
    require("samuherek.remap")
    require("samuherek.packer")
    require("samuherek.set")
end
