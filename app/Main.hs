module Main (main) where

main :: IO ()
main = putStrLn $ makeHtml "My page title" "Hello, world!"

makeHtml :: String -> String -> String
makeHtml title body = html_ $ (head_.title_ $ title) <> body_ (h1_ title <> p_ body)

html_ :: String -> String
html_ = el "html"

body_ :: String -> String
body_ = el "body"

head_ :: String -> String
head_ = el "head"

title_ :: String -> String
title_ = el "title"

p_ :: String -> String
p_ = el "p"

h1_ :: String -> String
h1_ = el "h1"

el :: String -> String -> String
el tag content = "<" <> tag <> ">" <> content <> "</" <> tag <> ">"


newtype Html = Html String
    deriving Show

newtype Structure = Structure String 
    deriving Show

append_ :: Structure -> Structure -> Structure
append_ (Structure s1) (Structure s2) = Structure $ s1 <> s2
