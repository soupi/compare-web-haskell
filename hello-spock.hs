{-# LANGUAGE OverloadedStrings #-}
{-# language ScopedTypeVariables #-}

import Data.Aeson (Value)
import Data.String (fromString)
import Data.Text (Text)
import qualified Web.Spock as Spock
import qualified Web.Spock.Config as Spock

main :: IO ()
main = do
  config <- mkConfig
  Spock.runSpock 3000 $
    Spock.spock config routes

mkConfig :: IO (Spock.SpockCfg () () ())
mkConfig = Spock.defaultSpockCfg () Spock.PCNoDatabase ()

routes :: Spock.SpockM () () () ()
routes = do
  Spock.get "/" $
    Spock.text "hi"

  Spock.get ("/id/" Spock.<//> Spock.var) $ \(id' :: Int) -> do
    (name :: Text) <- Spock.param' "name"
    Spock.setHeader "x-powered-by" "benchmark"
    Spock.text (fromString (show id') <> " " <> name)

  Spock.post "/json" $ do
    (value :: Value) <- Spock.jsonBody'
    Spock.json value
