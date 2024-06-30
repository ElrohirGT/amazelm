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


genRouteParser : Maybe String -> Parser (Route -> a) a
genRouteParser maybeBasePath =
    case maybeBasePath of
        Just basePath ->
            P.oneOf
                [ P.map Home (s basePath </> P.top)
                , P.map Details (s basePath </> s "details" </> P.int)
                , P.map ShoppingCart (s basePath </> s "cart" </> P.int)
                ]

        Nothing ->
            P.oneOf
                [ P.map Home P.top
                , P.map Details (s "details" </> P.int)
                , P.map ShoppingCart (s "cart" </> P.int)
                ]


parseUrl : Maybe String -> Url -> Route
parseUrl basePath url =
    let
        routeParser =
            genRouteParser basePath
    in
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
