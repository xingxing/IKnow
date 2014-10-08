> module IKnow.Project where
> import Data.Time
> type People = [String]

> data Project = Project {
>       project_name  :: String,
>       fes           :: People,
>       bes           :: People,
>       estimate_days :: Int,
>       started_at    :: Day,
>       description   :: String                
> } deriving (Show)

