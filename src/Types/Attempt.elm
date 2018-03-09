module Types.Attempt exposing (Attempt, AttemptId, fromString, toString, map, map2)

import Types.Vote exposing (Vote)


type alias Attempt =
    { id : AttemptId
    , title : String
    , upvotes : Vote
    }


type AttemptId
    = AttemptId String


fromString : String -> AttemptId
fromString x =
    AttemptId x


toString : AttemptId -> String
toString (AttemptId x) =
    x


map : (String -> String) -> AttemptId -> AttemptId
map f (AttemptId x) =
    AttemptId (f x)


map2 : (String -> String -> String) -> AttemptId -> AttemptId -> AttemptId
map2 f (AttemptId x) (AttemptId y) =
    AttemptId (f x y)
