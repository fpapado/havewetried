module Types exposing (..)


type alias Attemt =
    { id : AttemptId
    , title : String
    , upvotes : Vote
    }


type AttemptId
    = AttemptId String


type Vote
    = Vote Int


mapAttemptId : (String -> String) -> AttemptId -> AttemptId
mapAttemptId fn (AttemptId a) =
    AttemptId (fn a)


mapVote : (Int -> Int) -> Vote -> Vote
mapVote fn (Vote a) =
    Vote (fn a)
