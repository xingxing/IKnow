> module IKnow.Time where

> import Data.List
> import Data.Time
> import Data.Time.Calendar
> import Data.Time.Calendar.WeekDate

-- 周末

> isWeekEnd :: Day -> Bool
> isWeekEnd day = or [(week_day == 6), (week_day == 7)]
>           where (_, _, week_day) = toWeekDate day

-- 法定假期

> isLawHoliday :: Day -> Bool
> isLawHoliday day = [day] `isInfixOf` [(fromGregorian 2014 10 1)..(fromGregorian 2014 10 7)]

-- 补充上班或加班
