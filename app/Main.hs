module Main (main) where
    
import Html

main :: IO ()
main = print $ html_ "My page title" $ append_ (h1_ "My page title") (p_ "Hello, world!")
