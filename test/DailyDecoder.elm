module DailyDecoder exposing (..)

import DailyType exposing (..)
import Json.Decode exposing (..)
import Exts.Json.Decode exposing (..)


decodeDay : Decoder Day
decodeDay = decodeDate

decodeDaily : Decoder Daily
decodeDaily =
    decode Daily
        |> required "words" string
        |> required "day" decodeDay
        |> required "days" (list decodeDay)
        |> required "maybeDay" (nullable decodeDay)
        |> required "nested" decodeDaily
