local M = {}
local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')
local opt = vim.o
local api = vim.api




M.setup = function()
     dashboard.section.header.val = {
"            :h-                                  Nhy`               ",
"           -mh.                           h.    `Ndho               ",
"           hmh+                          oNm.   oNdhh               ",
"          `Nmhd`                        /NNmd  /NNhhd               ",
"          -NNhhy                      `hMNmmm`+NNdhhh               ",
"          .NNmhhs              ```....`..-:/./mNdhhh+               ",
"           mNNdhhh-     `.-::///+++////++//:--.`-/sd`               ",
"           oNNNdhhdo..://++//++++++/+++//++///++/-.`                ",
"      y.   `mNNNmhhhdy+/++++//+/////++//+++///++////-` `/oos:       ",
" .    Nmy:  :NNNNmhhhhdy+/++/+++///:.....--:////+++///:.`:s+        ",
" h-   dNmNmy oNNNNNdhhhhy:/+/+++/-         ---:/+++//++//.`         ",
" hd+` -NNNy`./dNNNNNhhhh+-://///    -+oo:`  ::-:+////++///:`        ",
" /Nmhs+oss-:++/dNNNmhho:--::///    /mmmmmo  ../-///++///////.       ",
"  oNNdhhhhhhhs//osso/:---:::///    /yyyyso  ..o+-//////////:/.      ",
"   /mNNNmdhhhh/://+///::://////     -:::- ..+sy+:////////::/:/.     ",
"     /hNNNdhhs--:/+++////++/////.      ..-/yhhs-/////////::/::/`    ",
"       .ooo+/-::::/+///////++++//-/ossyyhhhhs/:///////:::/::::/:    ",
"       -///:::::::////++///+++/////:/+ooo+/::///////.::://::---+`   ",
"       /////+//++++/////+////-..//////////::-:::--`.:///:---:::/:   ",
"       //+++//++++++////+++///::--                 .::::-------::   ",
"       :/++++///////////++++//////.                -:/:----::../-   ",
"       -/++++//++///+//////////////               .::::---:::-.+`   ",
"       `////////////////////////////:.            --::-----...-/    ",
"        -///://////////////////////::::-..      :-:-:-..-::.`.+`    ",
"         :/://///:///::://::://::::::/:::::::-:---::-.-....``/- -   ",
"           ::::://::://::::::::::::::----------..-:....`.../- -+oo/ ",
"            -/:::-:::::---://:-::-::::----::---.-.......`-/.      ``",
"           s-`::--:::------:////----:---.-:::...-.....`./:          ",
"          yMNy.`::-.--::..-dmmhhhs-..-.-.......`.....-/:`           ",
"         oMNNNh. `-::--...:NNNdhhh/.--.`..``.......:/-              ",
"        :dy+:`      .-::-..NNNhhd+``..`...````.-::-`                ",
"                        .-:mNdhh:.......--::::-`                    ",
"                           yNh/..------..`                          ",
"                                                                    ",
}

    dashboard.section.buttons.val = {
        dashboard.button( "f", "  > Find file", ":Telescope find_files<CR>"),
        dashboard.button( "F", "  > Browse file", ":Telescope file_browser<CR>"),
        dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
        dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),
    }
    local fortune = require("alpha.fortune")
    dashboard.section.footer.val = fortune()
    alpha.setup(dashboard.opts)
end

return M
