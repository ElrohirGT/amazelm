module Data.Product exposing (..)

import Json.Decode as Decode exposing (Decoder, float, int, list, string)
import Json.Decode.Pipeline exposing (optional, required)


type alias Product =
    { id : Int
    , title : String
    , description : String
    , category : String
    , price : Float
    , rating : Float
    , discountPercentage : Float
    , stock : Int
    , brand : String
    , thumbnail : String
    , images : List String
    }


productDecoder : Decoder Product
productDecoder =
    Decode.succeed Product
        |> required "id" int
        |> required "title" string
        |> required "description" string
        |> required "category" string
        |> required "price" float
        |> required "rating" float
        |> required "discountPercentage" float
        |> required "stock" int
        |> optional "brand" string ""
        |> required "thumbnail" string
        |> required "images" (list string)
