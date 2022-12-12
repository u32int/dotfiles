local launch = require("awful").spawn.with_shell

cmds = {
    "sh ~/.fehbg",
    "xset r rate 300 50"
}

for _, cmd in ipairs(cmds) do
    launch(cmd)
end
