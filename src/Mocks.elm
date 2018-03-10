module Mocks exposing (fakeAttempts)

import Types.Attempt as Attempt
import Types.AttemptId as AttemptId
import Types.AttemptTitle as AttemptTitle
import Types.Comment as Comment
import Types.Vote as Vote


fakeAttempts : List Attempt.Attempt
fakeAttempts =
    [ { id = AttemptId.fromString "1"
      , title = AttemptTitle.fromString "Getting Webpack to do my bidding"
      , upvotes = Vote.fromInt 10
      , comments =
            [ { id = Comment.idFromString "1"
              , content = "The tech giant says it is ready to begin planning a quantum computer, a powerful cpu machine that relies on subatomic particles instead of transistors."
              }
            , { id = Comment.idFromString "2"
              , content = "The tech giant says it is ready to begin planning a quantum computer, a powerful cpu machine that relies on subatomic particles instead of transistors."
              }
            ]
      }
    , { id = AttemptId.fromString "1"
      , title = AttemptTitle.fromString "Using css-in-js"
      , upvotes = Vote.fromInt 4
      , comments =
            [ { id = Comment.idFromString "1"
              , content = "And what about js in css?"
              }
            ]
      }
    , { id = AttemptId.fromString "2"
      , title = AttemptTitle.fromString "Rewriting in Elm"
      , upvotes = Vote.fromInt 1
      , comments =
            [ { id = Comment.idFromString "1"
              , content = "Elm Elm Elm"
              }
            ]
      }
    ]
