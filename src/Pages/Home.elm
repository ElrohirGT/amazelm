module Pages.Home exposing (..)

import Browser
import Css exposing (..)
import Data.Product exposing (Product)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)
import Routing exposing (goToDetails)
import Theme exposing (cssTheme, gaps, theme)



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
    let
        imageStyles =
            css
                [ Css.width (rem 2)
                , Css.height (rem 2)
                ]
    in
    div
        [ css
            [ displayFlex
            , justifyContent spaceBetween
            , alignItems center
            , padding (rem 1)
            , backgroundColor cssTheme.background
            , color cssTheme.white
            ]
        ]
        [ div
            [ css
                [ displayFlex
                ]
            ]
            [ img
                [ imageStyles
                ]
                []
            , img
                [ imageStyles
                ]
                []
            ]
        , div
            [ css
                [ displayFlex
                , alignItems center
                , Css.property "gap" gaps.s
                , fontFamilies [ "Inter", "sans-serif" ]
                ]
            ]
            [ p [] [ text "ElrohirGT" ]
            , img [ imageStyles ] []
            , img [ imageStyles ] []
            ]
        ]
