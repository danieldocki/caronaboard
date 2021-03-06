module Login.View.Login exposing (login)

import Testable.Html exposing (Html, div, h2, input, text, form)
import Testable.Html.Events exposing (onInput, onSubmit)
import Login.Msg exposing (Msg(..))
import Login.Model exposing (Model, Step(..), step)
import Login.View.EmailStep exposing (emailStep)
import Login.View.PasswordStep exposing (passwordStep)


login : Model -> Html Msg
login model =
    case step model of
        EmailStep ->
            formStep (emailStep model)

        PasswordStep ->
            formStep (passwordStep model)

        NotRegisteredStep ->
            div []
                [ text "O CaronaBoard está em fase de testes, seja o primeiro a saber quando for lançado" ]


formStep : Html Msg -> Html Msg
formStep step =
    div []
        [ h2 [] [ text "Login" ]
        , form [ onSubmit Submit ] [ step ]
        ]
