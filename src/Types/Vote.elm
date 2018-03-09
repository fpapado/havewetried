module Vote exposing (Vote, fromInt, toInt, map, map2)


type Vote
    = Vote Int


fromInt : Int -> Vote
fromInt x =
    Vote x


toInt : Vote -> Int
toInt (Vote x) =
    x


map : (Int -> Int) -> Vote -> Vote
map f (Vote x) =
    Vote (f x)


map2 : (Int -> Int -> Int) -> Vote -> Vote -> Vote
map2 f (Vote x) (Vote y) =
    Vote (f x y)
