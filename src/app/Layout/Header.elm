module Layout.Header exposing (header)

import Testable.Html exposing (Html, img, h1, h2, a, b, text, button, nav, div, ul, li, i)
import Testable.Html.Attributes exposing (id, class, href, src, rel, alt)
import Testable.Html.Events exposing (onClick)
import Msg exposing (Msg(MsgForLogin, MsgForLayout))
import Login.Msg exposing (Msg(SignOut))
import Common.Icon exposing (icon)
import Layout.Model exposing (Model)
import Layout.Msg exposing (Msg(OpenDropdown, CloseDropdown))


header : Model -> Html Msg.Msg
header model =
    Testable.Html.header [ class "navbar-fixed" ] <|
        menu model
            ++ [ nav []
                    [ div [ class "nav-wrapper" ]
                        [ a [ class "brand-logo left", href "/" ]
                            [ b [] [ text "Carona" ]
                            , text "Board"
                            ]
                        , ul [ class "right" ]
                            [ li []
                                [ a [ href "http://goo.gl/forms/ohEbgkMa9i" ]
                                    [ icon "directions_car" ]
                                ]
                            , li []
                                [ a [ id "open-menu-button", onClick (MsgForLayout OpenDropdown) ]
                                    [ icon "more_vert"
                                    ]
                                ]
                            ]
                        ]
                    ]
               ]


menu : Model -> List (Html Msg.Msg)
menu model =
    if model.dropdownOpen then
        [ div [ id "menu", onClick (MsgForLayout CloseDropdown) ]
            [ ul [ class "dropdown-content" ]
                [ li []
                    [ a [ href "http://goo.gl/forms/GYVDfZuhWg" ] [ text "Dar Feedback" ]
                    ]
                , li []
                    [ a [ onClick (MsgForLogin SignOut), id "signout-button" ] [ text "Sair" ]
                    ]
                ]
            ]
        ]
    else
        []
