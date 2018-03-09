module Main exposing (..)

import Html exposing (Html, text, div, h1, img, input, form, label, span, small, button)
import Html.Attributes exposing (src, class, placeholder, attribute, type_, id, for)
import List
import Types.Attempt exposing (Attempt, AttemptId)


---- MODEL ----


type alias Model =
    {}


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )



---- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- VIEW ----


type Space
    = P1
    | P2
    | P3
    | P4
    | P5


type SpaceDirection
    = A
    | H
    | V
    | L
    | R
    | T
    | B


spacesCls : List ( SpaceDirection, Space ) -> String
spacesCls =
    String.join " " << List.map spaceCls


spaceCls : ( SpaceDirection, Space ) -> String
spaceCls ( dir, scale ) =
    let
        pre =
            case dir of
                A ->
                    "pa"

                H ->
                    "ph"

                V ->
                    "pv"

                L ->
                    "pl"

                R ->
                    "pr"

                T ->
                    "pt"

                B ->
                    "pb"

        post =
            case scale of
                P1 ->
                    "1"

                P2 ->
                    "2"

                P3 ->
                    "3"

                P4 ->
                    "4"

                P5 ->
                    "5"
    in
        pre ++ post


view : Model -> Html Msg
view model =
    div
        [ class "pa3 mw7-ns center" ]
        [ box [ ( T, P5 ), ( B, P4 ) ]
            []
            [ viewSearchForm ]
        , box [ ( V, P4 ) ]
            []
            [ viewNewAttemptForm ]
        ]


box space attrs children =
    div ((class <| spacesCls space) :: attrs) children


viewSearchForm =
    div [ class "measure center" ]
        [ label [ class "f6 b db mb2", for "search" ]
            [ text "Search"
            , span [ class "normal black-60" ]
                [ text "(optional)" ]
            ]
        , input [ placeholder "What ails you?", attribute "aria-describedby" "search-desc", class "input-reset ba b--black-20 pa2 mb2 db w-100", id "search", type_ "text" ]
            []
        , small [ class "f6 black-60 db mb2", id "search-desc" ]
            [ text "Helper text for the form control." ]
        ]


viewNewAttemptForm =
    form []
        [ div [ class "flex flex-row flex-wrap" ]
            [ div [ class "w-50 pb3 pr3" ] <| viewFormInput "Title" "title"
            , div [ class "w-50 pb3" ] <| viewFormInput "Date" "date"
            , div [ class "w-100 pb3" ] <| viewFormInput "Description" "description"
            , viewButton [] [ text "Submit" ]
            ]
        ]


viewButton attrs children =
    button ([ class "db dim pa3 mr3 fw6 bg-light-yellow dark-blue bw1 ba b--black-20 pointer" ] ++ attrs) children


viewFormInput labelText inputId =
    [ label
        [ class "f6 b db mb2", for inputId ]
        [ text labelText
        ]
    , input [ attribute "aria-describedby" <| inputId ++ "-desc", class "input-reset ba b--black-20 pa2 mb2 db w-100", id inputId, type_ "text" ]
        []
    , small [ class "f6 black-60 db mb2", id <| inputId ++ "-desc" ]
        [ text "Helper text for the form control." ]
    ]



---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
