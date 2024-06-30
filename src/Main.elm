module Main exposing (Model, Msg(..), init, main, subscriptions, update, view)

import Browser
import Browser.Navigation as Nav
import Html
import Html.Styled exposing (toUnstyled)
import Pages.Details as DetailsPage
import Pages.Home as HomePage
import Pages.NotFound as NotFoundPage
import Routing exposing (Route(..))
import Url



-- MAIN


main : Program Flags Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlChange = UrlChanged
        , onUrlRequest = LinkClicked
        }



-- MODEL


type alias Model =
    { key : Nav.Key
    , basePath : Maybe String
    , route : Route
    , home : HomePage.Model
    }


type alias Flags =
    Maybe String


init : Flags -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init basePath url navKey =
    ( Model navKey basePath (Routing.parseUrl basePath url) HomePage.init, Cmd.none )



-- UPDATE


type Msg
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url
    | HomeMsg HomePage.Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Nav.pushUrl model.key (Url.toString url) )

                Browser.External href ->
                    ( model, Nav.load href )

        UrlChanged url ->
            ( { model | route = Routing.parseUrl model.basePath url }
            , Cmd.none
            )

        HomeMsg mg ->
            let
                ( newModel, command ) =
                    HomePage.update mg model.home
            in
            ( { model | home = newModel }, Cmd.map HomeMsg command )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- VIEW


view : Model -> Browser.Document Msg
view model =
    let
        viewPage page pageModel toMsg =
            let
                { title, body } =
                    page pageModel
            in
            { title = title
            , body = List.map (Html.map toMsg) (List.map toUnstyled body)
            }
    in
    case model.route of
        Home ->
            viewPage HomePage.view model.home HomeMsg

        Details id ->
            DetailsPage.view model

        ShoppingCart id ->
            DetailsPage.view model

        NotFound ->
            NotFoundPage.view model



-- viewLink : String -> Html msg
-- viewLink path =
--     li [] [ a [ href path ] [ text path ] ]
