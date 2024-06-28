module Routing exposing (..)

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
