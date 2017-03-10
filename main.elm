module Main exposing (..)

import Html exposing (text)

politely : String -> String
politely phrase =
    "Excuse me" ++ phrase

ask : String -> String -> String
ask thing place =
    "Is there a " ++ thing ++ " in the " ++ place ++ "?"

askPolitelyAboutCat : String -> String
askPolitelyAboutCat = politely << (ask "Cat")

main =
    text <| askPolitelyAboutCat "Hat"