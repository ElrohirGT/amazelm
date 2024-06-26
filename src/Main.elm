module Main exposing (..)

-- Press buttons to increment and decrement a counter.
--
-- Read how it works:
--   https://guide.elm-lang.org/architecture/buttons.html
--

import Browser
import Html exposing (Html, button, div, input, text)
import Html.Attributes exposing (placeholder, value)
import Html.Events exposing (onClick, onInput)



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    { content : String
    }


init : Model
init =
    { content = ""
    }



-- UPDATE


type Msg
    = UpdateContent String


update : Msg -> Model -> Model
update msg model =
    case msg of
        UpdateContent newContent ->
            { model
                | content = newContent
            }



-- VIEW


view : Model -> Html Msg
view model =
    let
        contentLength =
            String.length model.content
    in
    div []
        [ input [ placeholder "Text to reverse: ", value model.content, onInput UpdateContent ] []
        , div [] [ text (String.reverse model.content) ]
        , if contentLength == 0 then
            div [] []

          else
            div [] [ text (String.concat [ "The length is: ", String.fromInt contentLength ]) ]
        ]
