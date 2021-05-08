-- Follow installation instructions from https://github.com/haskell/haskell-language-server
local util = require 'lspconfig/util'

require'lspconfig'.hls.setup{
    root_dir = util.root_pattern("*.cabal", "stack.yaml", "cabal.project", "package.yaml", "hie.yaml", ".ghci")
}
