port module Main exposing (..)

import Test.Runner.Node exposing (run)
import Json.Encode exposing (Value)
import Test exposing (..)
import Fuzz.UrlRouter.UpdateSpec
import Integration.RidesSpec
import Integration.LoginSpec
import Integration.UrlRouterSpec
import Integration.LayoutSpec


tests : Test
tests =
    Test.concat
        [ Fuzz.UrlRouter.UpdateSpec.tests
        , Integration.RidesSpec.tests
        , Integration.LoginSpec.tests
        , Integration.UrlRouterSpec.tests
        , Integration.LayoutSpec.tests
        ]


main : Test.Runner.Node.TestProgram
main =
    run emit tests


port emit : ( String, Value ) -> Cmd msg
