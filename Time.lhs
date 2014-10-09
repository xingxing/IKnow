> module IKnow.Time where

> import Data.List
> import Data.Time
> import Data.Time.Calendar
> import Data.Time.Calendar.WeekDate


开发工作日

> dayOnDev :: Integer -> Day -> [Day]
> dayOnDev 0 stated_at = []
> dayOnDev estimate_days started_at  
>     | not $ needToWork started_at = dayOnDev estimate_days (succ started_at)
>     | otherwise = started_at : dayOnDev (pred estimate_days) (succ started_at)


需不需要工作

> needToWork :: Day -> Bool
> needToWork day
>     | isFuckingWorkDay day = True
>     | isLawHoliday     day = False
>     | isWeekEnd        day = False
>     | otherwise  = True


周末

> isWeekEnd :: Day -> Bool
> isWeekEnd day = or [(week_day == 6), (week_day == 7)]
>           where (_, _, week_day) = toWeekDate day

法定假期

> isLawHoliday :: Day -> Bool
> isLawHoliday day = day `elem` [(fromGregorian 2014 10 1)..(fromGregorian 2014 10 7)]

补充上班或加班

> isFuckingWorkDay :: Day -> Bool
> isFuckingWorkDay day 
>     | day  == (fromGregorian 2014 10 11) = True
>     | otherwise = False
