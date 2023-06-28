{-# LANGUAGE OverloadedStrings #-}
{-# language ScopedTypeVariables #-}

import Data.Aeson (Value)
import Data.String (fromString)
import Data.Text.Lazy (Text)
import qualified Web.Scotty as Scotty

main :: IO ()
main =
  Scotty.scotty 3000 routes

routes :: Scotty.ScottyM ()
routes = do
  Scotty.get "/" $
    Scotty.text "hi"

  Scotty.get "/id/:id" $ do
    (id' :: Int) <- Scotty.param "id"
    (name :: Text) <- Scotty.param "name"
    Scotty.setHeader "x-powered-by" "benchmark"
    Scotty.text (fromString (show id') <> " " <> name)

  Scotty.post "/json" $ do
    (value :: Value) <- Scotty.jsonData
    Scotty.json value
