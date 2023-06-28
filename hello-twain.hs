{-# language OverloadedStrings #-}
{-# language ScopedTypeVariables #-}

module Main where

import Data.Aeson (Value)
import Data.String (fromString)
import Data.Text (Text)
import qualified Web.Twain as Twain
import Network.Wai.Handler.Warp (run, Port)

main :: IO ()
main = runServer 3000

runServer :: Port -> IO ()
runServer port = do
  putStrLn $ unwords
    [ "Running twain app at"
    , "http://localhost:" <> show port
    , "(ctrl-c to quit)"
    ]
  run port mkApp

mkApp :: Twain.Application
mkApp =
  foldr ($)
    (Twain.notFound $ Twain.send $ Twain.text "Error: not found.")
    routes

routes :: [Twain.Middleware]
routes =
  [ Twain.get "/" $
    Twain.send $ Twain.text "hi"

  , Twain.get "/id/:id" $ do
    (id' :: Int) <- Twain.param "id"
    (name :: Text) <- Twain.queryParam "name"
    Twain.send
      $ Twain.withHeader ("x-powered-by", "benchmark")
      $ Twain.text
      $ fromString (show id') <> " " <> name

  , Twain.post "/json" $ do
    (value :: Value) <- Twain.fromBody
    Twain.send
      $ Twain.json
      $ value
  ]
