return {
  "nvim-neotest/neotest",
  optional = true,
  dependencies = {
    "olimorris/neotest-rspec",
  },
  opts = {
    adapters = {
      ["neotest-rspec"] = {
      },
    },
  },
}
