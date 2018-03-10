module Types.Attempt exposing (Attempt, AttemptViewModel, toViewModel)

import Types.AttemptId as AttemptId exposing (AttemptId)
import Types.AttemptTitle as AttemptTitle exposing (AttemptTitle)
import Types.Vote as Vote exposing (Vote)
import Types.Comment as Comment exposing (Comment)


type alias Attempt =
    { id : AttemptId
    , title : AttemptTitle
    , upvotes : Vote
    , comments : List Comment
    }


type alias AttemptViewModel =
    { id : String
    , title : String
    , upvotes : Int
    , comments : List Comment
    }


toViewModel : Attempt -> AttemptViewModel
toViewModel { id, title, upvotes, comments } =
    { id = AttemptId.toString id
    , title = AttemptTitle.toString title
    , upvotes = Vote.toInt upvotes
    , comments = comments
    }
