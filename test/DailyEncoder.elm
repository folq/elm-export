module DailyEncoder exposing (..)

import DailyType exposing (..)
import Date exposing (Date)
import Json.Encode


encodeDay : String -> Day
encodeDay = Date.Format.format "%Y-%m-%d"

encodeDaily : Daily -> Json.Encode.Value
encodeDaily x =
    Json.Encode.object
        [ ( "words", Json.Encode.string x.words )
        , ( "day", encodeDay x.day )
        , ( "days", (Json.Encode.list << List.map encodeDay) x.days )
        , ( "maybeDay", (Maybe.withDefault Json.Encode.null << Maybe.map encodeDay) x.maybeDay )
        , ( "nested", encodeDaily x.nested )
        ]
