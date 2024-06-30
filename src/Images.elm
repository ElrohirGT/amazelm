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
            "imgs/icons/Hamburguer.svg"

        Icon Search ->
            "imgs/icons/Search.svg"

        Icon Cart ->
            "imgs/icons/Cart.svg"

        Icon User ->
            "imgs/icons/User.svg"

        Icon DownArrow ->
            "imgs/icons/DownArrow.svg"

        Icon Destination ->
            "imgs/icons/Destination.svg"
