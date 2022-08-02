local utils = {}

function utils.create_snippet(trigger, description, nodes, opts)
  local properties = {
    trig = trigger,
    name = trigger,
    dscr = description,
  }

  return require("luasnip").s(properties, nodes, opts)
end

return utils
