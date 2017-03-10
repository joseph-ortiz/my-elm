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




type alias Person =
    { name : String
    , power : Int
    }

heroes = [
    { name = "Doctor Strange", power = 120}
    ,{name = "Spider Man", power = 90}
    ,{name = "Thor", power = 100}]

names : List Person -> List String
names peeps = List.map (\peep -> peep.name) peeps

findPerson : String -> List Person -> Maybe Person
findPerson name peeps = List.foldl
    (\peep memo -> case memo of
        Just _ ->
            memo
        Nothing ->
            if peep.name == name then
                Just peep
            else
                Nothing
    )
    Nothing
    peeps

main =
    text <| toString <| findPerson "Thor" heroes