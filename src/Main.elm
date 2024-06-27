module Main exposing (..)

-- Press buttons to increment and decrement a counter.
--
-- Read how it works:
--   https://guide.elm-lang.org/architecture/buttons.html
--

import Browser
import Html exposing (Html, button, div, input, text)
import Html.Attributes exposing (placeholder, style, type_, value)
import Html.Events exposing (onClick, onInput)



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    { name : String
    , password : String
    , repeatedPassword : String
    }


init : Model
init =
    { name = ""
    , password = ""
    , repeatedPassword = ""
    }



-- UPDATE


type Msg
    = Name String
    | Password String
    | RepeatedPassword String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Name newName ->
            { model
                | name = newName
            }

        Password newPwd ->
            { model
                | password = newPwd
            }

        RepeatedPassword newPwd ->
            { model
                | repeatedPassword = newPwd
            }



-- VIEW


inputView t p v msg =
    input [ type_ t, placeholder p, value v, onInput msg ] []


view : Model -> Html Msg
view model =
    div [ style "display" "flex", style "flex-direction" "column" ]
        [ inputView "text" "Username:" model.name Name
        , inputView "password" "Password:" model.password Password
        , inputView "password" "Repeat your password:" model.repeatedPassword RepeatedPassword
        , statusView model
        ]


statusView : Model -> Html Msg
statusView model =
    if String.length model.password == 0 then
        text ""

    else if String.length model.password <= 8 then
        text "Password is too short!"

    else if not (String.any Char.isUpper model.password) || not (String.any Char.isLower model.password) || not (String.any Char.isDigit model.password) then
        text "The password must contain lower case letters, upper case letters and numbers!"

    else if model.password == model.repeatedPassword then
        text "Passwords Match!"

    else
        text "Password don't match!"
