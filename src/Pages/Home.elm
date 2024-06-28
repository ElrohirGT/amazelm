module Pages.Home exposing (..)

import Browser
import Browser.Navigation as Nav
import Data.Product exposing (Product)
import Html exposing (..)
import Html.Attributes exposing (..)
import Url



-- MODEL


type alias Model =
    { products : List Product
    }


init =
    { products = []
    }



-- UPDATE


type Msg
    = TickCarrousel


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        TickCarrousel ->
            ( model, Cmd.none )



-- VIEW


view : Model -> Browser.Document Msg
view _ =
    { title = "Amazelm"
    , body =
        [ div []
            [ text "Welcome to Amazelm Home!"
            , a [] [ text "Go to another page" ]
            ]
        ]
    }
