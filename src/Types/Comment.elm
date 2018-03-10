module Types.Comment exposing (Comment, CommentViewModel, CommentId, toViewModel, idFromString, idToString, map, map2)

-- TODO: AuthorId


type alias Comment =
    { id : CommentId
    , content : String
    }


type alias CommentViewModel =
    { id : String
    , content : String
    }


toViewModel : Comment -> CommentViewModel
toViewModel { id, content } =
    { id = idToString id
    , content = content
    }


type CommentId
    = CommentId String


idFromString : String -> CommentId
idFromString x =
    CommentId x


idToString : CommentId -> String
idToString (CommentId x) =
    x


map : (String -> String) -> CommentId -> CommentId
map f (CommentId x) =
    CommentId (f x)


map2 : (String -> String -> String) -> CommentId -> CommentId -> CommentId
map2 f (CommentId x) (CommentId y) =
    CommentId (f x y)
