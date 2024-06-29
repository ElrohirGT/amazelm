module Api.Products exposing (..)

import Data.Product exposing (Product, productDecoder)
import Json.Decode as Decoder exposing (Decoder, list)
import Json.Decode.Pipeline exposing (required)


type alias GetProductsResponse =
    { products : List Product
    }


getProductsResponseDecoder : Decoder GetProductsResponse
getProductsResponseDecoder =
    Decoder.succeed GetProductsResponse
        |> required "products" (list productDecoder)
