module Html.Internal(module Html.Internal)
    where

import Numeric.Natural ( Natural )

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
p_ = Structure . el "p" . escape

h_ :: Natural -> String -> Structure
h_ num = Structure . el ("h" <> show num) . escape

ul_ :: [Structure] -> Structure
ul_ = Structure . el "ul" . concatMap (el "li" . show)

ol_ :: [Structure] -> Structure
ol_ = Structure . el "ol" . concatMap (el "li" . show)

code_ :: String -> Structure
code_ = Structure . el "pre" . escape

-- Escaping rules from https://stackoverflow.com/a/7382028
escape :: String -> String
escape = concatMap $ \char -> case char of
    '&' -> "&amp;"
    '<' -> "&lt;"
    '>' -> "&gt;"
    '"' -> "&quot;"
    '\'' -> "&#39;"
    _ -> [char]
