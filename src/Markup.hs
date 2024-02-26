module Markup(
    Document,
    Structure(..),
    parse
) where
    
import Numeric.Natural (Natural)
import Data.Maybe (maybeToList)

type Document = [Structure]

data Structure
    = Heading Natural String
    | Paragraph String
    | UnorderedList [String]
    | OrderedList [String]
    | CodeBlock [String]
    deriving Show

parse :: String -> Document
parse = parseLines Nothing . lines

parseLines :: Maybe Structure -> [String] -> Document
parseLines context remainingLines =
    case remainingLines of
        -- No lines remaining
        [] -> maybeToList context
        
        -- Heading
        ('*' : ' ' : line) : rest ->
            maybe id (:) context (Heading 1 (trim line) : parseLines Nothing rest)

        -- Unordered list
        ('-' : ' ' : line) : rest ->
            case context of 
                Just (UnorderedList list) -> parseLines (Just (UnorderedList (list <> [trim line]))) rest
                _ -> maybe id (:) context (parseLines (Just (UnorderedList [trim line])) rest)

        -- Ordered list
        ('#' : ' ' : line) : rest ->
            case context of
                Just (OrderedList list) -> parseLines (Just (OrderedList (list <> [trim line]))) rest
                _ -> maybe id (:) context (parseLines (Just (OrderedList [trim line])) rest)

        -- Code
        ('>' : ' ' : line) : rest ->
            case context of
                Just (CodeBlock list) -> parseLines (Just (CodeBlock (list <> [line]))) rest
                _ -> maybe id (:) context (parseLines (Just (CodeBlock [trim line])) rest)

        -- Paragraph
        currentLine : rest ->
            let
                line = trim currentLine
            in
                if line == ""
                then
                    maybe id (:) context (parseLines Nothing rest)
                else
                    case context of
                    Just (Paragraph paragraph) ->
                        parseLines (Just (Paragraph (unwords [paragraph, line]))) rest
                    _ ->
                        maybe id (:) context (parseLines (Just (Paragraph line)) rest)

trim :: String -> String
trim = unwords . words
