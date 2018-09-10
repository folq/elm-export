module DailyType exposing (..)

import Date exposing (Date)


type alias Day = Date

type alias Daily =
    { words : String
    , day : Day
    , days : List (Day)
    , maybeDay : Maybe (Day)
    , nested : Daily
    }
