require("options")
require("plugins")

-- Source - https://stackoverflow.com/a
-- Posted by Blomiir, modified by community. See post 'Timeline' for change history
-- Retrieved 2025-12-12, License - CC BY-SA 4.0


vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        local mode = vim.api.nvim_get_mode().mode
        local filetype = vim.bo.filetype
        if vim.bo.modified == true and mode == 'n' and filetype ~= "oil" then
            vim.cmd('lua vim.lsp.buf.format()')
        else
        end
    end
})
