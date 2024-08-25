-- Wacky table unpack deprecation fix (https://github.com/hrsh7th/nvim-cmp/issues/1017)
table.unpack = table.unpack or unpack

local utils = require "utils"

return {
  table.unpack(utils.get_lua_files "plugins/spec"),
}
