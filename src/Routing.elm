module Routing exposing (..)

import Html exposing (Attribute)
import Html.Attributes exposing (href)
import Url exposing (Url)
import Url.Parser as P exposing ((</>), Parser, s)


type Route
    = Home
    | Details Int
    | ShoppingCart Int
    | NotFound


routeParser : Parser (Route -> a) a
routeParser =
    P.oneOf
        [ P.map Home P.top
        , P.map Details (s "details" </> P.int)
        , P.map ShoppingCart (s "cart" </> P.int)
        ]


parseUrl : Url -> Route
parseUrl url =
    case P.parse routeParser url of
        Just a ->
            a

        Nothing ->
            NotFound


{-| Generates an href attribute to go to the details page
-}
goToDetails : Int -> Attribute msg
goToDetails id =
    href (String.concat [ "details/", String.fromInt id ])


{-| Generates an href attribute to go to the home page
-}
goToHome : Attribute msg
goToHome =
    href "/"


{-| Generates an href attribute to go to the shopping cart page
-}
goToShoppingCart : Int -> Attribute msg
goToShoppingCart id =
    href (String.concat [ "cart/", String.fromInt id ])
