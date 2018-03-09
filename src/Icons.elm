module Icons
    exposing
        ( star
        , zap
        )

import Html exposing (Html)
import Svg exposing (Svg, svg)
import Svg.Attributes exposing (..)


svgFeatherIcon : String -> List (Svg msg) -> Html msg
svgFeatherIcon className =
    svg
        [ class <| "feather feather-" ++ className
        , fill "none"
        , height "16"
        , stroke "currentColor"
        , strokeLinecap "round"
        , strokeLinejoin "round"
        , strokeWidth "2"
        , viewBox "0 0 24 24"
        , width "16"
        ]


star : Html msg
star =
    svgFeatherIcon "star"
        [ Svg.polygon [ points "12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2" ] []
        ]


zap : Html msg
zap =
    svgFeatherIcon "zap"
        [ Svg.polygon [ points "13 2 3 14 12 14 11 22 21 10 12 10 13 2" ] []
        ]
