module Main (main) where

main :: IO ()
main = print $ html_ "My page title" $ append_ (h1_ "My page title") (p_ "Hello, world!")

html_ :: Title -> Structure -> Html
html_ title structure = 
    Html $ el "html" 
        $ el "head" (el "title" title)
        <> el "body" (show structure)

el :: String -> String -> String
el tag content = "<" <> tag <> ">" <> content <> "</" <> tag <> ">"

type Title = String

newtype Html = Html String
instance Show Html where
    show (Html s) = s
    
newtype Structure = Structure String 
instance Show Structure where
    show (Structure s) = s

append_ :: Structure -> Structure -> Structure
append_ (Structure s1) (Structure s2) = Structure $ s1 <> s2

p_ :: String -> Structure
p_ = Structure . el "p"

h1_ :: String -> Structure
h1_ = Structure . el "h1"
