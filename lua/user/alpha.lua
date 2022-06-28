local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")

local function button(sc, txt, keybind, keybind_opts)
  local b = dashboard.button(sc, txt, keybind, keybind_opts)
  b.opts.hl = "Function"
  b.opts.hl_shortcut = "Type"
  return b
end

dashboard.section.header.val = {
  [[ __________________        ]],
  [[< Hello!           >       ]],
  [[ ------------------        ]],
  [[      \   ^__^             ]],
  [[       \  (oo)\_______     ]],
  [[          (__)\       )\/\ ]],
  [[              ||----w |    ]],
  [[              ||     ||    ]],
}

dashboard.section.buttons.val = {
	button("f", "  Find file", ":Telescope find_files <CR>"),
	button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	button("p", "  Find project", ":Telescope projects <CR>"),
	button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	button("t", "  Find text", ":Telescope live_grep <CR>"),
	button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
	button("q", "  Quit Neovim", ":qa<CR>"),
}

math.randomseed(os.time())

local function pick_color()
  local colors = {"String", "Identifier", "Keyword", "Number"}
  return colors[math.random(#colors)]
end

dashboard.section.header.opts.hl = pick_color()

local function footer()
-- NOTE: requires the fortune-mod package to work
	-- local handle = io.popen("fortune")
	-- local fortune = handle:read("*a")
	-- handle:close()
	-- return fortune
  return "You are more than what you have become."
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
