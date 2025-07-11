require('formatter').setup({
  logging = false,
  filetype = {
    javascript = {
        -- prettierd
       function()
          return {
            exe = "prettierd",
            args = {vim.api.nvim_buf_get_name(0)},
            stdin = true
          }
        end
    },
    css = {
        function()
            return {
                exe = "prettierd",
                args = {vim.api.nvim_buf_get_name(0)},
                stdin = true
            }
        end
    },
    scss = {
        function()
            return {
                exe = "prettierd",
                args = {vim.api.nvim_buf_get_name(0)},
                stdin = true
            }
        end
    },
  }
})
