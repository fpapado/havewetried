module Types.AttemptTitle exposing (AttemptTitle, fromString, toString, map, map2)


type AttemptTitle
    = AttemptTitle String


fromString : String -> AttemptTitle
fromString x =
    AttemptTitle x


toString : AttemptTitle -> String
toString (AttemptTitle x) =
    x


map : (String -> String) -> AttemptTitle -> AttemptTitle
map f (AttemptTitle x) =
    AttemptTitle (f x)


map2 : (String -> String -> String) -> AttemptTitle -> AttemptTitle -> AttemptTitle
map2 f (AttemptTitle x) (AttemptTitle y) =
    AttemptTitle (f x y)
