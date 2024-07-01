module Images exposing (..)

{-| This module adds autocompletion to all static images in the site.
-}


{-| Represents all static icons in the site, this would normally be SVG's
-}
type SiteIcon
    = Hamburguer
    | Search
    | Cart
    | User
    | DownArrow
    | Destination
    | AddToCart


{-| Represents all static images in the site
-}
type Images
    = Logo
    | Icon SiteIcon


logoToString name =
    String.concat [ "imgs/icons/", name ]


toString : Images -> String
toString img =
    case img of
        Logo ->
            "imgs/AmazonLogo.png"

        Icon Hamburguer ->
            logoToString "Hamburguer.svg"

        Icon Search ->
            logoToString "Search.svg"

        Icon Cart ->
            logoToString "Cart.svg"

        Icon User ->
            logoToString "User.svg"

        Icon DownArrow ->
            logoToString "DownArrow.svg"

        Icon Destination ->
            logoToString "Destination.svg"

        Icon AddToCart ->
            logoToString "AddToCart.svg"
