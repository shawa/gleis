module Main exposing (main)

import Browser
import Html
    exposing
        ( Html
        , div
        , table
        , tbody
        , td
        , text
        , th
        , thead
        , tr
        )
import Html.Attributes exposing (class, href)


main : Program () Model Msg
main =
    Browser.document
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }


type alias Msg =
    ()


type alias Model =
    ()


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


init : () -> ( Model, Cmd Msg )
init _ =
    ( ()
    , Cmd.none
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update _ model =
    ( model, Cmd.none )


view : Model -> Browser.Document Msg
view model =
    { title = "What are the trains"
    , body = body model
    }


type alias RowConfig =
    { line : Int
    , departureTime : ( Int, Int )
    , destinations : List String
    , platform : Int
    , comments : String
    }


exampleRows : List RowConfig
exampleRows =
    [ { line = 7
      , departureTime = ( 11, 5 )
      , destinations = [ "Kempthal", "Zürich HB", "Rapperswil" ]
      , platform = 3
      , comments = ""
      }
    , { line = 41
      , departureTime = ( 11, 6 )
      , destinations = [ "Töss", "Wüffingen", "Pfungen", "Bülach" ]
      , platform = 9
      , comments = ""
      }
    , { line = 33
      , departureTime = ( 11, 6 )
      , destinations = [ "Heetlingen", "Henggart", "Schaffhausen" ]
      , platform = 7
      , comments = ""
      }
    , { line = 8
      , departureTime = ( 11, 11 )
      , destinations = [ "Effretikon", "Zürich HB", "Pfäffikon SZ" ]
      , platform = 8
      , comments = ""
      }
    , { line = 12
      , departureTime = ( 11, 11 )
      , destinations = [ "Grüze", "Winterthur", "Seen" ]
      , platform = 5
      , comments = ""
      }
    , { line = 29
      , departureTime = ( 11, 12 )
      , destinations = [ "Effretikon", "Flughaven", "Zürich HB", "Zug" ]
      , platform = 4
      , comments = ""
      }
    , { line = 41
      , departureTime = ( 11, 6 )
      , destinations = [ "Töss", "Wüffingen", "Pfungen", "Bülach" ]
      , platform = 9
      , comments = ""
      }
    , { line = 33
      , departureTime = ( 11, 6 )
      , destinations = [ "Heetlingen", "Henggart", "Schaffhausen" ]
      , platform = 7
      , comments = ""
      }
    , { line = 8
      , departureTime = ( 11, 11 )
      , destinations = [ "Effretikon", "Zürich HB", "Pfäffikon SZ" ]
      , platform = 8
      , comments = ""
      }
    , { line = 12
      , departureTime = ( 11, 11 )
      , destinations = [ "Grüze", "Winterthur", "Seen" ]
      , platform = 5
      , comments = ""
      }
    , { line = 29
      , departureTime = ( 11, 12 )
      , destinations = [ "Effretikon", "Flughaven", "Zürich HB", "Zug" ]
      , platform = 4
      , comments = ""
      }
    ]


row : RowConfig -> Html Msg
row config =
    let
        ( hour, minute ) =
            config.departureTime
    in
    tr []
        [ td [ class "service" ]
            [ div []
                [ text <| "S" ++ String.fromInt config.line
                ]
            ]
        , td [] [ text <| String.fromInt hour ++ "." ++ String.fromInt minute ]
        , td [] [ text <| String.join " " config.destinations ]
        , td [ class "center" ] [ text <| String.fromInt config.platform ]
        , td [] [ text "" ]
        ]


rows : List (Html Msg)
rows =
    List.map row exampleRows


body : Model -> List (Html Msg)
body model =
    [ div []
        [ table []
            [ thead []
                [ tr []
                    [ th [] [ text "" ]
                    , th [] [ text "" ]
                    , th [] [ text "Nach" ]
                    , th [ class "center" ] [ text "Gleis" ]
                    , th [] [ text "Hinweis" ]
                    ]
                ]
            , tbody [] rows
            ]
        ]
    ]
