module Main (main) where

import Html

title = "<My> <page> <title>"
content = append_ 
    (h1_ title)
    (ol_ [ p_ "\"Hello\"", 
           p_ "&",
           code_ "\'world\'!" ])

main :: IO ()
main = print $ html_ title content
