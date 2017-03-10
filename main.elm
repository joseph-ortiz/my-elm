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


type alias Dog =
    { name : String
    , age : Int
    }

dog =
    { name = "Dyno"
    , age = 2
    }

renderDog : Dog -> String
renderDog dog =
    dog.name ++ " is " ++ (toString dog.age) ++ " years old."

main =
    text <| renderDog dog