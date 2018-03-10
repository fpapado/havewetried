module Main exposing (..)

import Html exposing (Html, text, div, h1, img, input, form, label, span, small, button, p, a)
import Html.Attributes exposing (src, class, placeholder, attribute, type_, id, for, href, alt)
import List
import Mocks exposing (fakeAttempts)
import Types.Attempt as Attempt exposing (Attempt, AttemptViewModel)
import Types.Comment as Comment exposing (Comment, CommentViewModel)
import Icons exposing (star, zap)


---- MODEL ----


type alias Model =
    { entries : List Attempt
    }


init : ( Model, Cmd Msg )
init =
    ( { entries = fakeAttempts }, Cmd.none )



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
        , box [ ( V, P4 ) ]
            []
          <|
            List.map
                (viewEntry << Attempt.toViewModel)
                model.entries
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
            , viewButton [ class "f6" ] [ text "Submit" ]
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


viewEntry : AttemptViewModel -> Html msg
viewEntry entry =
    div [ class "bt bb b--black-20" ]
        [ div [ class "pv4 ph3 ph0-l flex flex-column flex-row-ns" ]
            [ div [ class "pr3-ns mb4 mb0-ns w-100 w-40-ns" ]
                [ h1 [ class "pb3 f3 fw1 baskerville mt0 mb0 lh-title" ]
                    [ text entry.title ]
                , div
                    [ class "flex" ]
                    [ viewCounterStar <| toString entry.upvotes

                    -- , viewCounterZap "10"
                    ]
                ]
            , div [ class "w-100 w-60-ns pl3-ns" ] <|
                List.map
                    (box [ ( B, P4 ) ] []
                        << viewComment
                        << Comment.toViewModel
                    )
                    entry.comments
            ]
        ]


viewComment : CommentViewModel -> List (Html msg)
viewComment comment =
    [ p [ class "mt0 f6 f5-l lh-copy" ]
        [ text comment.content ]
    , p [ class "f6 lh-copy mv0" ]
        [ text "By Person Personson" ]
    ]


viewCounterStar num =
    div [ class "flex pv1 ph2 f6 bg-light-yellow ba b--black-10 br-pill justify-center items-center" ]
        [ star, span [ class "pl1" ] [ text num ] ]


viewCounterZap num =
    div [ class "flex pv1 ph2 f6 bg-washed-red ba b--black-10 br-pill justify-center items-center" ]
        [ zap, span [ class "pl1" ] [ text num ] ]



---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
