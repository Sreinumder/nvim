return {
	"echasnovski/mini.operators",
	dependencies = { "echasnovski/mini.ai" },
	keys = {
		{ "s", desc = "Substitute Operator" },
		{ "gm", desc = "Multiply Operator" },
		{ "<A-s>", desc = "Exchange Operator" },
		{ "g=", desc = "Evaluate Operator" },
    -- pain points solved
    { "<A-s><A-s>", "V<A-s>", desc = "Exchange Operator line-wise", remap = true },
		{ "S", "s$", desc = "Substitute to EoL", remap = true },
		{ "gmM", "gm$", desc = "Multiply to EoL", remap = true },
		{ "<A-S>", "<A-s>$", desc = "Exchange to EoL", remap = true },
		{ "<leader>gh", "<A-s>ia<A-s>ila", desc = "Exchange arg", remap = true },
		{ "<leader>gl", "<A-s>ia<A-s>ina", desc = "Exchange arg", remap = true },
	},
	version = "*",
	opts = {
		evaluate = { prefix = "g=" },
		exchange = { prefix = "<A-s>" },
		multiply = { prefix = "gm" },
		replace = { prefix = "s" },
		sort = { prefix = "" },
	},
}
