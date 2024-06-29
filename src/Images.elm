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


{-| Represents all static images in the site
-}
type Images
    = Logo
    | Icon SiteIcon


toString : Images -> String
toString img =
    case img of
        Logo ->
            "imgs/AmazonLogo.png"

        Icon Hamburguer ->
            "imgs/icons/hamburguer.svg"

        Icon Search ->
            "imgs/icons/search.svg"

        Icon Cart ->
            "imgs/icons/cart.svg"

        Icon User ->
            "imgs/icons/user.svg"
