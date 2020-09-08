-- This query extracts dose+durations of epinephrine administration
with vasomv as
(
  select
    stay_id, linkorderid
    , rate as vaso_rate
    , amount as vaso_amount
    , starttime
    , endtime
  from `physionet-data.mimic_icu.inputevents`
  where itemid = 221289 -- epinephrine
  and statusdescription != 'Rewritten' -- only valid orders
)
SELECT stay_id
  , starttime, endtime
  , vaso_rate, vaso_amount
from vasomv;