--Locus OF care - denominator populaton

-

CALL FNC.DROP_IF_EXISTS('SAILW1384V.WLGP_APM_RECORDS');

CREATE TABLE SAILW1384V.WLGP_APM_RECORDS AS (
SELECT * 
, CASE  
, CASE  
WHEN LOCALHEALTHBOARDNAME = 'HB1'               		THEN 'LHB1'
WHEN LOCALHEALTHBOARDNAME = 'HB2a'       		 		THEN 'LHB2'
WHEN LOCALHEALTHBOARDNAME = 'HB2b'      				THEN 'LHB2'
WHEN LOCALHEALTHBOARDNAME = 'HB3'    					THEN 'LHB3'
WHEN LOCALHEALTHBOARDNAME = 'HB4'     					THEN 'LHB4'
WHEN LOCALHEALTHBOARDNAME = 'HB5a'			            THEN 'LHB5'
WHEN LOCALHEALTHBOARDNAME = 'HB5b'					    THEN 'LHB5'
WHEN LOCALHEALTHBOARDNAME = 'HB5c'			            THEN 'LHB5'
WHEN LOCALHEALTHBOARDNAME = 'HB6a'			            THEN 'LHB6'
WHEN LOCALHEALTHBOARDNAME = 'HB6b'				        THEN 'LHB6'
WHEN LOCALHEALTHBOARDNAME = 'HB7'       				THEN 'LHB7'
ELSE '' END AS GROUP_NAME
FROM (
SELECT 
  a.ALF_PE
, b.WOB
, a.EVENT_CD
, a.EVENT_DT
, a.EVENT_YR
, c.LOCALHEALTHBOARDNAME 
, TO_DATE(TRIM(CHAR(EVENT_YR||'0101')), 'YYYY-mm-dd') START_YEAR
, ROUND((DAYS(TO_DATE(TRIM(CHAR(EVENT_YR||'0101')), 'YYYY-mm-dd')) - DAYS(b.WOB))/365.25,0) AS AGE
FROM sail1384v.WLGP_GP_EVENT_CLEANSED_20220301 a 
JOIN SAIL1384v.WDSD_AR_PERS_20220801 b 
ON a.ALF_PE = b.ALF_PE 
JOIN 
SAIL1384V.REFR_WELSH_GP_CLUSTER_PRACTICES_20220629 c 
ON a.PRAC_CD_PE  = c.WCODE_PE 
WHERE event_cd LIKE 'd4%'
AND EVENT_CD NOT LIKE 'd48%'
AND event_yr BETWEEN 2011 AND 2021 
OR EVENT_CD LIKE 'd5%'
AND event_yr BETWEEN 2011 AND 2021 
)
) WITH NO DATA;

==============================================
--parttwo ..input records 
==============================================

INSERT INTO  SAILW1384V.WLGP_APM_RECORDS
SELECT * 
, CASE  
WHEN LOCALHEALTHBOARDNAME = 'HB1'               		THEN 'LHB1'
WHEN LOCALHEALTHBOARDNAME = 'HB2a'       		 		THEN 'LHB2'
WHEN LOCALHEALTHBOARDNAME = 'HB2b'      				THEN 'LHB2'
WHEN LOCALHEALTHBOARDNAME = 'HB3'    					THEN 'LHB3'
WHEN LOCALHEALTHBOARDNAME = 'HB4'     					THEN 'LHB4'
WHEN LOCALHEALTHBOARDNAME = 'HB5a'			            THEN 'LHB5'
WHEN LOCALHEALTHBOARDNAME = 'HB5b'					    THEN 'LHB5'
WHEN LOCALHEALTHBOARDNAME = 'HB5c'			            THEN 'LHB5'
WHEN LOCALHEALTHBOARDNAME = 'HB6a'			            THEN 'LHB6'
WHEN LOCALHEALTHBOARDNAME = 'HB6b'				        THEN 'LHB6'
WHEN LOCALHEALTHBOARDNAME = 'HB7'       				THEN 'LHB7'
ELSE '' END AS GROUP_NAME
FROM (
SELECT 
  a.ALF_PE
, b.WOB
, a.EVENT_CD
, a.EVENT_DT
, a.EVENT_YR
, c.LOCALHEALTHBOARDNAME 
, TO_DATE(TRIM(CHAR(EVENT_YR||'0101')), 'YYYY-mm-dd') START_YEAR
, ROUND((DAYS(TO_DATE(TRIM(CHAR(EVENT_YR||'0101')), 'YYYY-mm-dd')) - DAYS(b.WOB))/365.25,0) AS AGE
FROM sail1384v.WLGP_GP_EVENT_CLEANSED_20220301 a 
JOIN SAIL1384v.WDSD_AR_PERS_20220801 b 
ON a.ALF_PE = b.ALF_PE 
JOIN 
SAIL1384V.REFR_WELSH_GP_CLUSTER_PRACTICES_20220629 c 
ON a.PRAC_CD_PE  = c.WCODE_PE 
WHERE event_cd LIKE 'd4%'
AND EVENT_CD NOT LIKE 'd48%'
AND event_yr BETWEEN 2011 AND 2021 
OR EVENT_CD LIKE 'd5%'
AND event_yr BETWEEN 2011 AND 2021 
)
;	


==========================================================
--APM, 6 OR MORE BY HEALTHBOARD
==========================================================

SELECT * FROM 
(
	SELECT 'FULL_EVENT_ALF_COUNT' COMPARISON, EVENT_YR, LOCALHEALTHBOARDNAME, COUNT(ALF_PE)  ALF_COUNT
	FROM (
		SELECT ALF_PE, LOCALHEALTHBOARDNAME, EVENT_YR, AGE, SUM(EVENT_DAY) EVENT_DAY_PER_YEAR, SUM(LIMIT_ONE_DAY) LIMITED_EVENT_DAY_PER_YEAR
		FROM (
			SELECT ALF_PE , LOCALHEALTHBOARDNAME, EVENT_YR, AGE, EVENT_DT, COUNT(*) EVENT_DAY , '1' LIMIT_ONE_DAY
			FROM SAILW1384V.WLGP_APM_RECORDS
			GROUP BY ALF_PE, LOCALHEALTHBOARDNAME, EVENT_YR, AGE, EVENT_DT
		) GROUP BY ALF_PE, LOCALHEALTHBOARDNAME, EVENT_YR, AGE
	) WHERE EVENT_DAY_PER_YEAR >=6 --restricting cohort to those with 6 or APM per year
	  AND AGE BETWEEN 18 AND 64    --restricting cohort age band
	GROUP BY EVENT_YR, LOCALHEALTHBOARDNAME
	UNION
	SELECT 'LIMITED_EVENT_ALF_COUNT' COMPARISON, EVENT_YR, LOCALHEALTHBOARDNAME, COUNT(ALF_PE) ALF_COUNT
	FROM (
		SELECT ALF_PE, LOCALHEALTHBOARDNAME, EVENT_YR, AGE, SUM(EVENT_DAY) EVENT_DAY_PER_YEAR, SUM(LIMIT_ONE_DAY) LIMITED_EVENT_DAY_PER_YEAR
		FROM (
			SELECT ALF_PE , LOCALHEALTHBOARDNAME, EVENT_YR, AGE, EVENT_DT, COUNT(*) EVENT_DAY , '1' LIMIT_ONE_DAY
			FROM SAILW1384V.WLGP_APM_RECORDS
			GROUP BY ALF_PE, LOCALHEALTHBOARDNAME, EVENT_YR, AGE, EVENT_DT
		) GROUP BY ALF_PE, LOCALHEALTHBOARDNAME, EVENT_YR, AGE
	) WHERE LIMITED_EVENT_DAY_PER_YEAR >=6
	  AND AGE BETWEEN 18 AND 64
	GROUP BY EVENT_YR, LOCALHEALTHBOARDNAME
)
WHERE COMPARISON = 'LIMITED_EVENT_ALF_COUNT'
ORDER BY LOCALHEALTHBOARDNAME, EVENT_YR, COMPARISON
;


