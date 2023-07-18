return {
   'rcarriga/nvim-notify',
    lazy = false,
    config = function()
        require('notify').setup({
          background = '#000000'
        })
    end
}
