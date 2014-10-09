> module IKnow.Project where

> import Data.Time
> import System.IO

> type People = [String]

> data Project = Project {
>       project_name  :: String,
>       pm            :: String,
>       fes           :: People,
>       bes           :: People,
>       estimate_days :: Int,
>       started_at    :: Day,
>       description   :: String                
> } deriving (Show)



> listAllProjects = do
>                   handle <- openFile "projects.txt" ReadMode
>                   contents <- hGetContents handle
>                   putStr contents
>                   hClose handle
