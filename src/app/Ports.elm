port module Ports exposing (subscriptions)

import Model exposing (Model)
import Msg as Root exposing (Msg(..))
import Login.Ports as Login
import Rides.Ports as Rides


subscriptions : Model -> Sub Root.Msg
subscriptions _ =
    Sub.batch
        [ Sub.map MsgForRides Rides.subscriptions
        , Sub.map MsgForLogin Login.subscriptions
        ]
