module Main (main) where

import Html

title = "<My> <page> <title>"
content =  
    (h_ 1 title)
    <>
    (ol_ [ p_ "\"Hello\"", 
           p_ "&",
           code_ "\'world\'!" ])

main :: IO ()
main = print $ html_ title content
