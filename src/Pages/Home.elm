module Pages.Home exposing (..)

import Browser
import Css exposing (..)
import Data.Product exposing (Product)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)
import Routing exposing (goToDetails)



-- MODEL


type alias Model =
    { products : List Product
    }


init : { products : List a }
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
-- view : Model -> Browser.Document Msg


view : Model -> { title : String, body : List (Html msg) }
view _ =
    { title = "Amazelm"
    , body =
        [ div []
            [ headerView
            ]
        ]
    }


headerView : Html msg
headerView =
    div
        [ src "help.png"
        , css
            [ displayFlex
            , justifyContent spaceBetween
            , padding (rem 1)
            ]
        ]
        [ div []
            [ img [] []
            , img [] []
            ]
        , div []
            [ text "ElrohirGT"
            , img [] []
            , img [] []
            ]
        ]
