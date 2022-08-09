
local create_snippet = require("plugins.luasnip.utils").create_snippet

return {
  create_snippet("once", "C include guard",
    fmta([[
    #ifndef <>_H
    #define <>_H

    <>

    #endif /* <>_H */
    ]], { i(1), rep(1), i(0), rep(1) })),

  create_snippet("#i", "C include",
    fmta([[#include <><>]], {
      c(1, {
        sn(nil, { t([[<]]), r(1, "header"), t([[>]]) }),
        sn(nil, { t([["]]), r(1, "header"), t([["]]) }),
      }),
      i(0)
    }),
    {
      stored = { header = i(1) }
    }),
}
