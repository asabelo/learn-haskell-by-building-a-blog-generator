module Main (main) where

main :: IO ()
main = putStrLn $ makeHtml "My page title" "Hello, world!"

makeHtml :: String -> String -> String
makeHtml title body = html_ $ (head_.title_ $ title) <> body_ body

html_ :: String -> String
html_ content = "<html>" <> content <> "</html>"

body_ :: String -> String
body_ content = "<body>" <> content <> "</body>"

head_ :: String -> String
head_ content = "<head>" <> content <> "</head>"

title_ :: String -> String
title_ content = "<title>" <> content <> "</title>"
