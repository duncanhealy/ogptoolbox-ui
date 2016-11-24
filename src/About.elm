module About exposing (..)

import Authenticator.Model
import Html exposing (..)
import I18n


-- MODEL


type alias Model =
    {}


init : Model
init =
    {}



-- UPDATE


type ExternalMsg
    = Navigate String


type InternalMsg
    = Todo


type Msg
    = ForParent ExternalMsg
    | ForSelf InternalMsg


type alias MsgTranslation parentMsg =
    { onInternalMsg : InternalMsg -> parentMsg
    , onNavigate : String -> parentMsg
    }


type alias MsgTranslator parentMsg =
    Msg -> parentMsg


navigate : String -> Msg
navigate path =
    ForParent (Navigate path)


translateMsg : MsgTranslation parentMsg -> MsgTranslator parentMsg
translateMsg { onInternalMsg, onNavigate } msg =
    case msg of
        ForParent (Navigate path) ->
            onNavigate path

        ForSelf internalMsg ->
            onInternalMsg internalMsg


update : InternalMsg -> Maybe Authenticator.Model.Authentication -> Model -> ( Model, Cmd Msg )
update msg authenticationMaybe model =
    case msg of
        Todo ->
            ( model, Cmd.none )



-- VIEW


view : I18n.Language -> Model -> Html Msg
view language model =
    div []
        [ text "TODO About OGP Toolbox" ]
