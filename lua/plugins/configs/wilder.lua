local wilder = require("wilder")

wilder.setup({ modes = { ":" } })

wilder.set_option(
  "renderer",
  wilder.wildmenu_renderer({
    highlighter = wilder.lua_pcre2_highlighter(),
  })

)
