module Pages.Components.Header exposing (..)

import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)
import Images as Imgs
import Routing exposing (goToHome)
import Theme exposing (cssGaps, cssTheme, fontSizes, gaps, locale, theme)


headerView : Html msg
headerView =
    let
        bigIconStyles =
            css
                [ Css.width cssGaps.m
                , Css.height cssGaps.m
                ]

        smallIconStyles =
            css
                [ Css.width cssGaps.s
                , Css.height cssGaps.s
                ]
    in
    div
        [ css
            [ displayFlex
            , flexDirection column
            , backgroundColor cssTheme.background
            , padding cssGaps.s
            , Css.property "gap" gaps.s
            ]
        ]
        [ div
            [ css
                [ displayFlex
                , justifyContent spaceBetween
                , alignItems center
                , color cssTheme.white
                ]
            ]
            [ div
                [ css
                    [ displayFlex
                    , alignItems center
                    ]
                ]
                [ img
                    [ bigIconStyles
                    , Imgs.Hamburguer
                        |> Imgs.Icon
                        |> Imgs.toString
                        |> src
                    ]
                    []
                , a [ goToHome ]
                    [ img
                        [ css
                            [ Css.height (rem 2.3)
                            ]
                        , Imgs.Logo
                            |> Imgs.toString
                            |> src
                        ]
                        []
                    ]
                ]
            , div
                [ css
                    [ displayFlex
                    , alignItems center
                    , Css.property "gap" gaps.xs
                    ]
                ]
                [ p
                    [ css
                        [ fontFamilies Theme.fontFamilies.text
                        , fontSize fontSizes.text
                        , fontWeight bold
                        ]
                    ]
                    [ text "ElrohirGT" ]
                , img
                    [ bigIconStyles
                    , Imgs.User
                        |> Imgs.Icon
                        |> Imgs.toString
                        |> src
                    ]
                    []
                , img
                    [ bigIconStyles
                    , Imgs.Cart
                        |> Imgs.Icon
                        |> Imgs.toString
                        |> src
                    ]
                    []
                ]
            ]
        , div
            [ css
                [ displayFlex
                , backgroundColor cssTheme.white
                , borderRadius cssGaps.xs
                ]
            ]
            [ input
                [ css
                    [ flexGrow (num 1)
                    , border zero
                    , borderRadius cssGaps.xs
                    , padding2 zero cssGaps.s
                    , fontSize fontSizes.bigText
                    ]
                , placeholder "Buscar en Amazon"
                ]
                []
            , button
                [ css
                    [ padding cssGaps.xs
                    , border zero
                    , backgroundColor cssTheme.lightSecondary
                    , borderRadius cssGaps.xs
                    , position relative
                    ]
                ]
                [ img
                    [ bigIconStyles
                    , Imgs.Search
                        |> Imgs.Icon
                        |> Imgs.toString
                        |> src
                    ]
                    []
                ]
            ]
        , div
            [ css
                [ displayFlex
                , alignItems center
                , justifyContent spaceBetween
                ]
            ]
            [ div
                [ css
                    [ displayFlex
                    , Css.property "gap" gaps.xs
                    , alignItems center
                    ]
                ]
                [ p
                    [ css
                        [ fontFamilies Theme.fontFamilies.text
                        , color cssTheme.white
                        , fontSize fontSizes.text
                        ]
                    ]
                    [ text "Advanced Options" ]
                , img
                    [ smallIconStyles
                    , Imgs.DownArrow
                        |> Imgs.Icon
                        |> Imgs.toString
                        |> src
                    ]
                    []
                ]
            , div
                [ css
                    [ displayFlex
                    , Css.property "gap" gaps.xs
                    , alignItems center
                    ]
                ]
                [ img
                    [ smallIconStyles
                    , Imgs.Destination
                        |> Imgs.Icon
                        |> Imgs.toString
                        |> src
                    ]
                    []
                , p
                    [ css
                        [ fontFamilies Theme.fontFamilies.text
                        , color cssTheme.white
                        , fontSize fontSizes.text
                        ]
                    ]
                    [ text "Enviar a Adolfo - Miami 33206" ]
                ]
            ]
        ]
