-- This plugin defines the 'surround motion'
--
-- The surround motion works like the inner `i` motion, but instead it changes
-- things surrounding a locator. For instance given the word `hello`, if I use
-- surround `ysiw(` the output will be `hello`
--
--
-- Cheat sheet
--
--    Old text                    Command         New text
-- ----------------------------------------------------------------------------
--    surr*ound_words             ysiw)           (surround_words)
--    *make strings               ys$"            "make strings"
--    [delete ar*ound me!]        ds]             delete around me!
--    remove <b>HTML t*ags</b>    dst             remove HTML tags
--    'change quot*es'            cs'"            "change quotes"
--    <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
--    delete(functi*on calls)     dsf             function calls
--
-- source: https://github.com/kylechui/nvim-surround
return {
  'kylechui/nvim-surround',
  version = "^3.0.0",
  event = "VeryLazy",
  config = function() require("nvim-surround").setup({}) end
}
