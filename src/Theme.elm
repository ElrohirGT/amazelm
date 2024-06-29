module Theme exposing (..)

import Css exposing (hex, rem)


theme =
    { background = "#232f3e"
    , lightBackground = "#364759"
    , primary = "#146eb4"
    , secondary = "#ff9900"
    , lightSecondary = "#FFB84D"
    , black = "#000"
    , white = "#fff"
    , onWhite = "#858585"
    , correctColor = "#00c04b"
    }


cssTheme =
    { background = hex (String.dropLeft 1 theme.background)
    , lightBackground = hex (String.dropLeft 1 theme.lightBackground)
    , primary = hex (String.dropLeft 1 theme.primary)
    , secondary = hex (String.dropLeft 1 theme.secondary)
    , lightSecondary = hex (String.dropLeft 1 theme.lightSecondary)
    , black = hex (String.dropLeft 1 theme.black)
    , white = hex (String.dropLeft 1 theme.white)
    , onWhite = hex (String.dropLeft 1 theme.onWhite)
    , correctColor = hex (String.dropLeft 1 theme.correctColor)
    }


{-| The gaps used on the webpage
-}
gaps =
    { xs = "0.2rem"
    , s = "0.8rem"
    , m = "1.5rem"
    , l = "2rem"
    , xl = "3rem"
    }


{-| The gaps transformed into values that elm-css can use. This assumes all gaps are rem values
-}
cssGaps =
    { xs = rem (Maybe.withDefault 0.0 (String.toFloat (String.dropRight 3 gaps.xs)))
    , s = rem (Maybe.withDefault 0.0 (String.toFloat (String.dropRight 3 gaps.s)))
    , m = rem (Maybe.withDefault 0.0 (String.toFloat (String.dropRight 3 gaps.m)))
    , l = rem (Maybe.withDefault 0.0 (String.toFloat (String.dropRight 3 gaps.l)))
    , xl = rem (Maybe.withDefault 0.0 (String.toFloat (String.dropRight 3 gaps.xl)))
    }


{-| The fonts used on the website for each type of text
-}
fontFamilies =
    { titles = [ "Inter", "sans-serif" ]
    , subtitles = [ "Inter", "sans-serif" ]
    , text = [ "Inter", "sans-serif" ]
    }
