> {-# LANGUAGE OverloadedStrings #-}

> module IKnow.Configur where

> import Data.Yaml
> import Control.Applicative -- <$>, <*>
> import qualified Data.ByteString.Char8 as BS

> data Configur = Configur { projects_file_path :: String } deriving (Show)


> instance FromJSON Configur where
>     parseJSON (Object v) = Configur <$>
>                            v .: "projects_file_path"
>     parseJSON _ = error "Can't parse configur from YAML/JSON"

> loadConfigur = do
>                ymlData <- BS.readFile "./config/iknow.yml"
>                let c = Data.Yaml.decode ymlData :: Maybe Configur
>                print c
