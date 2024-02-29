module Main (main) where

import System.Directory ( doesFileExist )
import System.Environment ( getArgs )

import Html ( Title )
import Markup ( parse )
import Convert ( convert )

process :: Html.Title -> String -> String
process title = show . convert title . Markup.parse

usage :: String
usage = "USAGE\n"
     ++ "\n"
     ++ "blog-generator \n"
     ++ "\tReads custom markup from standard input and writes the converted HTML to standard output.\n"
     ++ "\n"
     ++ "blog-generator <source file> <destination file>\n"
     ++ "\tReads custom markup from the file <source file> and writes the converted HTML to the file <destination file>.\n"

main :: IO ()
main = do
    args <- getArgs
    case args of
        [] -> getContents >>= putStrLn . process ""
        [srcFile, destFile] -> doesFileExist srcFile 
                            >>= \exists -> if exists then readFile srcFile >>= writeFile destFile . process "" 
                                           else error "Source file doesn't exist"
        _ -> putStrLn usage
