return {
  {
    "rest-nvim/rest.nvim",
    config = function()
      require'nvim-treesitter.install'.ensure_installed = {
        "http"    
      }
    end
  }
}
