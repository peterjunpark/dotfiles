return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  opts = function(_, opts)
    local logo = [[

███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗          Z
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║      Z    
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║   z       
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ z         
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║           
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝           
                                                             
              ]]
    logo = string.rep("\n", 5) .. logo .. "\n\n"
    opts.config.header = vim.split(logo, "\n")
  end,
}
