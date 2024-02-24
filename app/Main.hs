module Main (main) where

import Html

title = "<My> <page> <title>"
content = append_ (h1_ title) (p_ "\"Hello\" & \'world\'!")

main :: IO ()
main = print $ html_ title content
