return {
  "pteroctopus/faster.nvim",
  opts = {
    behaviours = {
      bigfile = {
        on = true,
        extra_patterns = {
          { filesize = 0.4, pattern = "*.md" },
        },
      },
    },
  },
}
