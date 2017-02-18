module Update exposing (update)

import Model exposing (Model)
import UrlRouter.Update as UrlRouter
import Login.Update as Login
import Rides.Update as Rides
import Msg exposing (Msg(..))
import Testable.Cmd


update : Msg -> Model -> ( Model, Testable.Cmd.Cmd Msg )
update msg model =
    let
        urlRouter =
            UrlRouter.update msg model.urlRouter model.login

        login =
            Login.update msg model.login

        rides =
            Rides.update msg model.rides

        updatedModel =
            { urlRouter = Tuple.first urlRouter
            , login = Tuple.first login
            , rides = Tuple.first rides
            }

        cmds =
            Testable.Cmd.batch
                [ Testable.Cmd.map MsgForUrlRouter <| Tuple.second urlRouter
                , Testable.Cmd.map MsgForLogin <| Tuple.second login
                , Testable.Cmd.map MsgForRides <| Tuple.second rides
                ]
    in
        ( updatedModel, cmds )
