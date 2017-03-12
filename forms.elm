import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import String exposing (length)
import Regex exposing (regex, contains)

main =
  Html.beginnerProgram { model = model, view = view, update = update }

-- MODEL

type alias Model =
  { name : String
  , password : String
  , passwordAgain : String
  , age : String
  }

model : Model
model =
  Model "" "" "" ""

-- UPDATE
type Msg
  = Name String
    | Password String
    | PasswordAgain String
    | Age String

update : Msg -> Model -> Model
update msg model =
  case msg of
    Name name ->
      { model | name = name }

    Password password ->
      { model | password = password }

    PasswordAgain password ->
      { model | passwordAgain = password }

    Age age ->
      {model | age = age }

-- VIEW
view : Model -> Html Msg
view model =
  div []
    [ input [ type_ "text", placeholder "Name", onInput Name ] []
    , input [ type_ "password", placeholder "Password", onInput Password ] []
    , input [ type_ "password", placeholder "Re-enter Password", onInput PasswordAgain ] []
    , input [ type_ "number", placeholder "0", onInput Age] []
    , viewValidation model
    ]

viewValidation : Model -> Html msg
viewValidation model =
  let
    (matchColor, matchMessage) =
      if model.password == model.passwordAgain then
        ("green", "OK")
      else
        ("red", "Passwords do not match!")

    (lengthColor, lengthMessage) =
      if length model.password >= 8 then
        ("green", "Password length is good")
      else
        ("red", "Passwords must be atleast 8 in length!")

    (hasUpperColor, hasUpperMessage) =
        if contains (regex "[A-Z]") model.password then
          ("green", "Has an upper case")
        else
          ("red", "Needs an Upper Case")

    (hasLowerColor, hasLowerMessage) =
        if contains (regex "[a-z]") model.password then
          ("green", "Has a lower case")
        else
          ("red", "Needs an lower Case")

    (hasNumberColor, hasNumberMessage) =
        if contains (regex "[0-9]") model.password then
          ("green", "Has a number")
        else
          ("red", "Needs a number")

    (ageIsNumberColor, ageIsNumberMessage) =
        if contains (regex "[0-9]") model.age then
          ("green", "Age is a number")
        else
          ("red", "Age is NOT a number")

  in
      div []
      [ div [ style [("color", matchColor)] ] [text matchMessage]
      , div [ style [("color", lengthColor)] ] [text lengthMessage]
      , div [ style [("color", hasUpperColor)] ] [text hasUpperMessage]
      , div [ style [("color", hasLowerColor)] ] [text hasLowerMessage]
      , div [ style [("color", hasNumberColor)] ] [text hasNumberMessage]
      , div [ style [("color", ageIsNumberColor)] ] [text ageIsNumberMessage]
      ]
