import Data.List
import Data.Time
import Data.Time.Calendar
import Data.Time.Calendar.WeekDate

type People = [String]

data Project = Project {
      project_name  :: String,
      fes           :: People,
      bes           :: People,
      estimate_days :: Int,
      started_at    :: Day,
      description   :: String                
    } deriving (Show)



-- 周末
isWeekEnd :: Day -> Bool
isWeekEnd day = or [(week_day == 6), (week_day == 7)]
    where (_, _, week_day) = toWeekDate day

-- 法定假期
isLawHoliday :: Day -> Bool
isLawHoliday day = [day] `isInfixOf` [(fromGregorian 2014 10 1)..(fromGregorian 2014 10 7)]
