SELECT EVENT_YR,
	COUNT(*)
FROM (--Patients on Disease Register
SELECT DISTINCT ALF_PE , DIAGNOSIS_TYPE, EVENT_YR 
FROM 
		(SELECT
			ALF_PE,
			EVENT_CD,
			'2020' EVENT_YR ,
			EVENT_DT,
			da.DIAGNOSIS_TYPE,
			da.read_cd
		FROM
			SAIL1384V.WLGP_GP_EVENT_CLEANSED_20220301 p
			LEFT JOIN SAILW1384V.DISEASEREGISTERREADCODES_AG2 da --amended on 24022024 to look at AG2 instead of AG - same for all years
			ON da.READ_CD = p.EVENT_CD 
	--Restrict to individuals in the population denominator and enable age restriction
	WHERE ALF_PE IN (
		SELECT
			a.ALF_PE
			FROM SAIL1384v.WLGP_CLEAN_GP_REG_BY_PRAC_INCLNONSAIL_MEDIAN_20220301 a
		JOIN SAIL1384V.WDSD_AR_PERS_20220801 b ON
			a.ALF_PE = b.ALF_PE
		WHERE
			GP_DATA_FLAG = 1
			AND '2020-01-01' BETWEEN START_DATE AND END_DATE
			AND	ROUND((DAYS(TO_DATE(TRIM(CHAR('2020' || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
			--Check for remaining alive
			AND (DOD >= '2021-01-01' OR DOD IS NULL)
			)
AND P.EVENT_DT < '2021-01-01'
AND DA.DIAGNOSIS_TYPE = 'Depression'
) 
)
--Patients prescibed an antipsychotic
WHERE ALF_PE IN 
(
	SELECT
		ALF_PE
	FROM
		(
		SELECT
			ALF_PE,
			EVENT_CD,
			EVENT_YR ,
			EVENT_DT ,
			--Counts the number of events per individual per day
			ROW_NUMBER () OVER (PARTITION BY ALF_PE ,EVENT_DT
									ORDER BY EVENT_DT ) 
				AS PRESCRIPTION_NUMBER
		FROM
			SAIL1384V.WLGP_GP_EVENT_CLEANSED_20220301
		WHERE
			(EVENT_CD LIKE 'd4%'
			OR EVENT_CD LIKE 'd5%')
			AND EVENT_CD NOT LIKE 'd48%'
			AND EVENT_YR = '2020' ) AS PRESCRIPTIONCOUNTS
	WHERE
		--restricts to 1 prescription date		
	PRESCRIPTION_NUMBER = 1
		--Restrict to individuals in the population denominator and enable age restriction
		AND ALF_PE IN (
		SELECT
			a.ALF_PE
			FROM SAIL1384v.WLGP_CLEAN_GP_REG_BY_PRAC_INCLNONSAIL_MEDIAN_20220301 a
		JOIN SAIL1384V.WDSD_AR_PERS_20220801 b ON
			a.ALF_PE = b.ALF_PE
		WHERE
			GP_DATA_FLAG = 1
			AND '2020-01-01' BETWEEN START_DATE AND END_DATE
			AND	ROUND((DAYS(TO_DATE(TRIM(CHAR('2020' || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
			--revised script 24022024 to remove requirement that they are alive
)
GROUP BY ALF_PE	
HAVING
		COUNT(*) >= 6 )
GROUP BY EVENT_YR
UNION ALL
SELECT EVENT_YR,
	COUNT(*)
FROM (--Patients on Disease Register
SELECT DISTINCT ALF_PE , DIAGNOSIS_TYPE, EVENT_YR 
FROM 
		(SELECT
			ALF_PE,
			EVENT_CD,
			'2019' EVENT_YR ,
			EVENT_DT,
			da.DIAGNOSIS_TYPE,
			da.read_cd
		FROM
			SAIL1384V.WLGP_GP_EVENT_CLEANSED_20220301 p
			LEFT JOIN SAILW1384V.DISEASEREGISTERREADCODES_AG2 da
			ON da.READ_CD = p.EVENT_CD 
	--Restrict to individuals in the population denominator and enable age restriction
	WHERE ALF_PE IN (
		SELECT
			a.ALF_PE
			FROM SAIL1384v.WLGP_CLEAN_GP_REG_BY_PRAC_INCLNONSAIL_MEDIAN_20220301 a
		JOIN SAIL1384V.WDSD_AR_PERS_20220801 b ON
			a.ALF_PE = b.ALF_PE
		WHERE
			GP_DATA_FLAG = 1
			AND '2019-01-01' BETWEEN START_DATE AND END_DATE
			AND	ROUND((DAYS(TO_DATE(TRIM(CHAR('2019' || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
			--Check for remaining alive
			AND (DOD >= '2020-01-01' OR DOD IS NULL)
			)
AND P.EVENT_DT < '2020-01-01'
AND DA.DIAGNOSIS_TYPE = 'Depression'
) 
)
--Patients prescibed an antipsychotic
WHERE ALF_PE IN 
(
	SELECT
		ALF_PE
	FROM
		(
		SELECT
			ALF_PE,
			EVENT_CD,
			EVENT_YR ,
			EVENT_DT ,
			--Counts the number of events per individual per day
			ROW_NUMBER () OVER (PARTITION BY ALF_PE ,EVENT_DT
									ORDER BY EVENT_DT ) 
				AS PRESCRIPTION_NUMBER
		FROM
			SAIL1384V.WLGP_GP_EVENT_CLEANSED_20220301
		WHERE
			(EVENT_CD LIKE 'd4%'
			OR EVENT_CD LIKE 'd5%')
			AND EVENT_CD NOT LIKE 'd48%'
			AND EVENT_YR = '2019' ) AS PRESCRIPTIONCOUNTS
	WHERE
		--restricts to 1 prescription date		
	PRESCRIPTION_NUMBER = 1
		--Restrict to individuals in the population denominator and enable age restriction
		AND ALF_PE IN (
		SELECT
			a.ALF_PE
			FROM SAIL1384v.WLGP_CLEAN_GP_REG_BY_PRAC_INCLNONSAIL_MEDIAN_20220301 a
		JOIN SAIL1384V.WDSD_AR_PERS_20220801 b ON
			a.ALF_PE = b.ALF_PE
		WHERE
			GP_DATA_FLAG = 1
			AND '2019-01-01' BETWEEN START_DATE AND END_DATE
			AND	ROUND((DAYS(TO_DATE(TRIM(CHAR('2019' || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
			--revised script 24022024 to remove requirement that they are alive
)
GROUP BY ALF_PE	
HAVING
		COUNT(*) >= 6 )
GROUP BY EVENT_YR
UNION ALL
SELECT EVENT_YR,
	COUNT(*)
FROM (--Patients on Disease Register
SELECT DISTINCT ALF_PE , DIAGNOSIS_TYPE, EVENT_YR 
FROM 
		(SELECT
			ALF_PE,
			EVENT_CD,
			'2018' EVENT_YR ,
			EVENT_DT,
			da.DIAGNOSIS_TYPE,
			da.read_cd
		FROM
			SAIL1384V.WLGP_GP_EVENT_CLEANSED_20220301 p
			LEFT JOIN SAILW1384V.DISEASEREGISTERREADCODES_AG2 da
			ON da.READ_CD = p.EVENT_CD 
	--Restrict to individuals in the population denominator and enable age restriction
	WHERE ALF_PE IN (
		SELECT
			a.ALF_PE
			FROM SAIL1384v.WLGP_CLEAN_GP_REG_BY_PRAC_INCLNONSAIL_MEDIAN_20220301 a
		JOIN SAIL1384V.WDSD_AR_PERS_20220801 b ON
			a.ALF_PE = b.ALF_PE
		WHERE
			GP_DATA_FLAG = 1
			AND '2018-01-01' BETWEEN START_DATE AND END_DATE
			AND	ROUND((DAYS(TO_DATE(TRIM(CHAR('2018' || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
			--Check for remaining alive
			AND (DOD >= '2019-01-01' OR DOD IS NULL)
			)
AND P.EVENT_DT < '2019-01-01'
AND DA.DIAGNOSIS_TYPE = 'Depression'
) 
)
--Patients prescibed an antipsychotic
WHERE ALF_PE IN 
(
	SELECT
		ALF_PE
	FROM
		(
		SELECT
			ALF_PE,
			EVENT_CD,
			EVENT_YR ,
			EVENT_DT ,
			--Counts the number of events per individual per day
			ROW_NUMBER () OVER (PARTITION BY ALF_PE ,EVENT_DT
									ORDER BY EVENT_DT ) 
				AS PRESCRIPTION_NUMBER
		FROM
			SAIL1384V.WLGP_GP_EVENT_CLEANSED_20220301
		WHERE
			(EVENT_CD LIKE 'd4%'
			OR EVENT_CD LIKE 'd5%')
			AND EVENT_CD NOT LIKE 'd48%'
			AND EVENT_YR = '2018' ) AS PRESCRIPTIONCOUNTS
	WHERE
		--restricts to 1 prescription date		
	PRESCRIPTION_NUMBER = 1
		--Restrict to individuals in the population denominator and enable age restriction
		AND ALF_PE IN (
		SELECT
			a.ALF_PE
			FROM SAIL1384v.WLGP_CLEAN_GP_REG_BY_PRAC_INCLNONSAIL_MEDIAN_20220301 a
		JOIN SAIL1384V.WDSD_AR_PERS_20220801 b ON
			a.ALF_PE = b.ALF_PE
		WHERE
			GP_DATA_FLAG = 1
			AND '2018-01-01' BETWEEN START_DATE AND END_DATE
			AND	ROUND((DAYS(TO_DATE(TRIM(CHAR('2018' || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
			--revised script 24022024 to remove requirement that they are alive
)
GROUP BY ALF_PE	
HAVING
		COUNT(*) >= 6 )
GROUP BY EVENT_YR
UNION ALL
SELECT EVENT_YR,
	COUNT(*)
FROM (--Patients on Disease Register
SELECT DISTINCT ALF_PE , DIAGNOSIS_TYPE, EVENT_YR 
FROM 
		(SELECT
			ALF_PE,
			EVENT_CD,
			'2017' EVENT_YR ,
			EVENT_DT,
			da.DIAGNOSIS_TYPE,
			da.read_cd
		FROM
			SAIL1384V.WLGP_GP_EVENT_CLEANSED_20220301 p
			LEFT JOIN SAILW1384V.DISEASEREGISTERREADCODES_AG2 da
			ON da.READ_CD = p.EVENT_CD 
	--Restrict to individuals in the population denominator and enable age restriction
	WHERE ALF_PE IN (
		SELECT
			a.ALF_PE
			FROM SAIL1384v.WLGP_CLEAN_GP_REG_BY_PRAC_INCLNONSAIL_MEDIAN_20220301 a
		JOIN SAIL1384V.WDSD_AR_PERS_20220801 b ON
			a.ALF_PE = b.ALF_PE
		WHERE
			GP_DATA_FLAG = 1
			AND '2017-01-01' BETWEEN START_DATE AND END_DATE
			AND	ROUND((DAYS(TO_DATE(TRIM(CHAR('2017' || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
			--Check for remaining alive
			AND (DOD >= '2018-01-01' OR DOD IS NULL)
			)
AND P.EVENT_DT < '2018-01-01'
AND DA.DIAGNOSIS_TYPE = 'Depression'
) 
)
--Patients prescibed an antipsychotic
WHERE ALF_PE IN 
(
	SELECT
		ALF_PE
	FROM
		(
		SELECT
			ALF_PE,
			EVENT_CD,
			EVENT_YR ,
			EVENT_DT ,
			--Counts the number of events per individual per day
			ROW_NUMBER () OVER (PARTITION BY ALF_PE ,EVENT_DT
									ORDER BY EVENT_DT ) 
				AS PRESCRIPTION_NUMBER
		FROM
			SAIL1384V.WLGP_GP_EVENT_CLEANSED_20220301
		WHERE
			(EVENT_CD LIKE 'd4%'
			OR EVENT_CD LIKE 'd5%')
			AND EVENT_CD NOT LIKE 'd48%'
			AND EVENT_YR = '2017' ) AS PRESCRIPTIONCOUNTS
	WHERE
		--restricts to 1 prescription date		
	PRESCRIPTION_NUMBER = 1
		--Restrict to individuals in the population denominator and enable age restriction
		AND ALF_PE IN (
		SELECT
			a.ALF_PE
			FROM SAIL1384v.WLGP_CLEAN_GP_REG_BY_PRAC_INCLNONSAIL_MEDIAN_20220301 a
		JOIN SAIL1384V.WDSD_AR_PERS_20220801 b ON
			a.ALF_PE = b.ALF_PE
		WHERE
			GP_DATA_FLAG = 1
			AND '2017-01-01' BETWEEN START_DATE AND END_DATE
			AND	ROUND((DAYS(TO_DATE(TRIM(CHAR('2017' || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
			--revised script 24022024 to remove requirement that they are alive
)
GROUP BY ALF_PE	
HAVING
		COUNT(*) >= 6 )
GROUP BY EVENT_YR
UNION ALL
SELECT EVENT_YR,
	COUNT(*)
FROM (--Patients on Disease Register
SELECT DISTINCT ALF_PE , DIAGNOSIS_TYPE, EVENT_YR 
FROM 
		(SELECT
			ALF_PE,
			EVENT_CD,
			'2016' EVENT_YR ,
			EVENT_DT,
			da.DIAGNOSIS_TYPE,
			da.read_cd
		FROM
			SAIL1384V.WLGP_GP_EVENT_CLEANSED_20220301 p
			LEFT JOIN SAILW1384V.DISEASEREGISTERREADCODES_AG2 da
			ON da.READ_CD = p.EVENT_CD 
	--Restrict to individuals in the population denominator and enable age restriction
	WHERE ALF_PE IN (
		SELECT
			a.ALF_PE
			FROM SAIL1384v.WLGP_CLEAN_GP_REG_BY_PRAC_INCLNONSAIL_MEDIAN_20220301 a
		JOIN SAIL1384V.WDSD_AR_PERS_20220801 b ON
			a.ALF_PE = b.ALF_PE
		WHERE
			GP_DATA_FLAG = 1
			AND '2016-01-01' BETWEEN START_DATE AND END_DATE
			AND	ROUND((DAYS(TO_DATE(TRIM(CHAR('2016' || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
			--Check for remaining alive
			AND (DOD >= '2017-01-01' OR DOD IS NULL)
			)
AND P.EVENT_DT < '2017-01-01'
AND DA.DIAGNOSIS_TYPE = 'Depression'
) 
)
--Patients prescibed an antipsychotic
WHERE ALF_PE IN 
(
	SELECT
		ALF_PE
	FROM
		(
		SELECT
			ALF_PE,
			EVENT_CD,
			EVENT_YR ,
			EVENT_DT ,
			--Counts the number of events per individual per day
			ROW_NUMBER () OVER (PARTITION BY ALF_PE ,EVENT_DT
									ORDER BY EVENT_DT ) 
				AS PRESCRIPTION_NUMBER
		FROM
			SAIL1384V.WLGP_GP_EVENT_CLEANSED_20220301
		WHERE
			(EVENT_CD LIKE 'd4%'
			OR EVENT_CD LIKE 'd5%')
			AND EVENT_CD NOT LIKE 'd48%'
			AND EVENT_YR = '2016' ) AS PRESCRIPTIONCOUNTS
	WHERE
		--restricts to 1 prescription date		
	PRESCRIPTION_NUMBER = 1
		--Restrict to individuals in the population denominator and enable age restriction
		AND ALF_PE IN (
		SELECT
			a.ALF_PE
			FROM SAIL1384v.WLGP_CLEAN_GP_REG_BY_PRAC_INCLNONSAIL_MEDIAN_20220301 a
		JOIN SAIL1384V.WDSD_AR_PERS_20220801 b ON
			a.ALF_PE = b.ALF_PE
		WHERE
			GP_DATA_FLAG = 1
			AND '2016-01-01' BETWEEN START_DATE AND END_DATE
			AND	ROUND((DAYS(TO_DATE(TRIM(CHAR('2016' || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
			--revised script 24022024 to remove requirement that they are alive
)
GROUP BY ALF_PE	
HAVING
		COUNT(*) >= 6 )
GROUP BY EVENT_YR
UNION ALL
SELECT EVENT_YR,
	COUNT(*)
FROM (--Patients on Disease Register
SELECT DISTINCT ALF_PE , DIAGNOSIS_TYPE, EVENT_YR 
FROM 
		(SELECT
			ALF_PE,
			EVENT_CD,
			'2015' EVENT_YR ,
			EVENT_DT,
			da.DIAGNOSIS_TYPE,
			da.read_cd
		FROM
			SAIL1384V.WLGP_GP_EVENT_CLEANSED_20220301 p
			LEFT JOIN SAILW1384V.DISEASEREGISTERREADCODES_AG2 da
			ON da.READ_CD = p.EVENT_CD 
	--Restrict to individuals in the population denominator and enable age restriction
	WHERE ALF_PE IN (
		SELECT
			a.ALF_PE
			FROM SAIL1384v.WLGP_CLEAN_GP_REG_BY_PRAC_INCLNONSAIL_MEDIAN_20220301 a
		JOIN SAIL1384V.WDSD_AR_PERS_20220801 b ON
			a.ALF_PE = b.ALF_PE
		WHERE
			GP_DATA_FLAG = 1
			AND '2015-01-01' BETWEEN START_DATE AND END_DATE
			AND	ROUND((DAYS(TO_DATE(TRIM(CHAR('2015' || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
			--Check for remaining alive
			AND (DOD >= '2016-01-01' OR DOD IS NULL)
			)
AND P.EVENT_DT < '2016-01-01'
AND DA.DIAGNOSIS_TYPE = 'Depression'
) 
)
--Patients prescibed an antipsychotic
WHERE ALF_PE IN 
(
	SELECT
		ALF_PE
	FROM
		(
		SELECT
			ALF_PE,
			EVENT_CD,
			EVENT_YR ,
			EVENT_DT ,
			--Counts the number of events per individual per day
			ROW_NUMBER () OVER (PARTITION BY ALF_PE ,EVENT_DT
									ORDER BY EVENT_DT ) 
				AS PRESCRIPTION_NUMBER
		FROM
			SAIL1384V.WLGP_GP_EVENT_CLEANSED_20220301
		WHERE
			(EVENT_CD LIKE 'd4%'
			OR EVENT_CD LIKE 'd5%')
			AND EVENT_CD NOT LIKE 'd48%'
			AND EVENT_YR = '2015' ) AS PRESCRIPTIONCOUNTS
	WHERE
		--restricts to 1 prescription date		
	PRESCRIPTION_NUMBER = 1
		--Restrict to individuals in the population denominator and enable age restriction
		AND ALF_PE IN (
		SELECT
			a.ALF_PE
			FROM SAIL1384v.WLGP_CLEAN_GP_REG_BY_PRAC_INCLNONSAIL_MEDIAN_20220301 a
		JOIN SAIL1384V.WDSD_AR_PERS_20220801 b ON
			a.ALF_PE = b.ALF_PE
		WHERE
			GP_DATA_FLAG = 1
			AND '2015-01-01' BETWEEN START_DATE AND END_DATE
			AND	ROUND((DAYS(TO_DATE(TRIM(CHAR('2015' || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
			--revised script 24022024 to remove requirement that they are alive
)
GROUP BY ALF_PE	
HAVING
		COUNT(*) >= 6 )
GROUP BY EVENT_YR
UNION ALL
SELECT EVENT_YR,
	COUNT(*)
FROM (--Patients on Disease Register
SELECT DISTINCT ALF_PE , DIAGNOSIS_TYPE, EVENT_YR 
FROM 
		(SELECT
			ALF_PE,
			EVENT_CD,
			'2014' EVENT_YR ,
			EVENT_DT,
			da.DIAGNOSIS_TYPE,
			da.read_cd
		FROM
			SAIL1384V.WLGP_GP_EVENT_CLEANSED_20220301 p
			LEFT JOIN SAILW1384V.DISEASEREGISTERREADCODES_AG2 da
			ON da.READ_CD = p.EVENT_CD 
	--Restrict to individuals in the population denominator and enable age restriction
	WHERE ALF_PE IN (
		SELECT
			a.ALF_PE
			FROM SAIL1384v.WLGP_CLEAN_GP_REG_BY_PRAC_INCLNONSAIL_MEDIAN_20220301 a
		JOIN SAIL1384V.WDSD_AR_PERS_20220801 b ON
			a.ALF_PE = b.ALF_PE
		WHERE
			GP_DATA_FLAG = 1
			AND '2014-01-01' BETWEEN START_DATE AND END_DATE
			AND	ROUND((DAYS(TO_DATE(TRIM(CHAR('2014' || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
			--Check for remaining alive
			AND (DOD >= '2015-01-01' OR DOD IS NULL)
			)
AND P.EVENT_DT < '2015-01-01'
AND DA.DIAGNOSIS_TYPE = 'Depression'
) 
)
--Patients prescibed an antipsychotic
WHERE ALF_PE IN 
(
	SELECT
		ALF_PE
	FROM
		(
		SELECT
			ALF_PE,
			EVENT_CD,
			EVENT_YR ,
			EVENT_DT ,
			--Counts the number of events per individual per day
			ROW_NUMBER () OVER (PARTITION BY ALF_PE ,EVENT_DT
									ORDER BY EVENT_DT ) 
				AS PRESCRIPTION_NUMBER
		FROM
			SAIL1384V.WLGP_GP_EVENT_CLEANSED_20220301
		WHERE
			(EVENT_CD LIKE 'd4%'
			OR EVENT_CD LIKE 'd5%')
			AND EVENT_CD NOT LIKE 'd48%'
			AND EVENT_YR = '2014' ) AS PRESCRIPTIONCOUNTS
	WHERE
		--restricts to 1 prescription date		
	PRESCRIPTION_NUMBER = 1
		--Restrict to individuals in the population denominator and enable age restriction
		AND ALF_PE IN (
		SELECT
			a.ALF_PE
			FROM SAIL1384v.WLGP_CLEAN_GP_REG_BY_PRAC_INCLNONSAIL_MEDIAN_20220301 a
		JOIN SAIL1384V.WDSD_AR_PERS_20220801 b ON
			a.ALF_PE = b.ALF_PE
		WHERE
			GP_DATA_FLAG = 1
			AND '2014-01-01' BETWEEN START_DATE AND END_DATE
			AND	ROUND((DAYS(TO_DATE(TRIM(CHAR('2014' || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
			--revised script 24022024 to remove requirement that they are alive
)
GROUP BY ALF_PE	
HAVING
		COUNT(*) >= 6 )
GROUP BY EVENT_YR
UNION ALL
SELECT EVENT_YR,
	COUNT(*)
FROM (--Patients on Disease Register
SELECT DISTINCT ALF_PE , DIAGNOSIS_TYPE, EVENT_YR 
FROM 
		(SELECT
			ALF_PE,
			EVENT_CD,
			'2013' EVENT_YR ,
			EVENT_DT,
			da.DIAGNOSIS_TYPE,
			da.read_cd
		FROM
			SAIL1384V.WLGP_GP_EVENT_CLEANSED_20220301 p
			LEFT JOIN SAILW1384V.DISEASEREGISTERREADCODES_AG2 da
			ON da.READ_CD = p.EVENT_CD 
	--Restrict to individuals in the population denominator and enable age restriction
	WHERE ALF_PE IN (
		SELECT
			a.ALF_PE
			FROM SAIL1384v.WLGP_CLEAN_GP_REG_BY_PRAC_INCLNONSAIL_MEDIAN_20220301 a
		JOIN SAIL1384V.WDSD_AR_PERS_20220801 b ON
			a.ALF_PE = b.ALF_PE
		WHERE
			GP_DATA_FLAG = 1
			AND '2013-01-01' BETWEEN START_DATE AND END_DATE
			AND	ROUND((DAYS(TO_DATE(TRIM(CHAR('2013' || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
			--Check for remaining alive
			AND (DOD >= '2014-01-01' OR DOD IS NULL)
			)
AND P.EVENT_DT < '2014-01-01'
AND DA.DIAGNOSIS_TYPE = 'Depression'
) 
)
--Patients prescibed an antipsychotic
WHERE ALF_PE IN 
(
	SELECT
		ALF_PE
	FROM
		(
		SELECT
			ALF_PE,
			EVENT_CD,
			EVENT_YR ,
			EVENT_DT ,
			--Counts the number of events per individual per day
			ROW_NUMBER () OVER (PARTITION BY ALF_PE ,EVENT_DT
									ORDER BY EVENT_DT ) 
				AS PRESCRIPTION_NUMBER
		FROM
			SAIL1384V.WLGP_GP_EVENT_CLEANSED_20220301
		WHERE
			(EVENT_CD LIKE 'd4%'
			OR EVENT_CD LIKE 'd5%')
			AND EVENT_CD NOT LIKE 'd48%'
			AND EVENT_YR = '2013' ) AS PRESCRIPTIONCOUNTS
	WHERE
		--restricts to 1 prescription date		
	PRESCRIPTION_NUMBER = 1
		--Restrict to individuals in the population denominator and enable age restriction
		AND ALF_PE IN (
		SELECT
			a.ALF_PE
			FROM SAIL1384v.WLGP_CLEAN_GP_REG_BY_PRAC_INCLNONSAIL_MEDIAN_20220301 a
		JOIN SAIL1384V.WDSD_AR_PERS_20220801 b ON
			a.ALF_PE = b.ALF_PE
		WHERE
			GP_DATA_FLAG = 1
			AND '2013-01-01' BETWEEN START_DATE AND END_DATE
			AND	ROUND((DAYS(TO_DATE(TRIM(CHAR('2013' || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
			--revised script 24022024 to remove requirement that they are alive
)
GROUP BY ALF_PE	
HAVING
		COUNT(*) >= 6 )
GROUP BY EVENT_YR
UNION ALL
SELECT EVENT_YR,
	COUNT(*)
FROM (--Patients on Disease Register
SELECT DISTINCT ALF_PE , DIAGNOSIS_TYPE, EVENT_YR 
FROM 
		(SELECT
			ALF_PE,
			EVENT_CD,
			'2012' EVENT_YR ,
			EVENT_DT,
			da.DIAGNOSIS_TYPE,
			da.read_cd
		FROM
			SAIL1384V.WLGP_GP_EVENT_CLEANSED_20220301 p
			LEFT JOIN SAILW1384V.DISEASEREGISTERREADCODES_AG2 da
			ON da.READ_CD = p.EVENT_CD 
	--Restrict to individuals in the population denominator and enable age restriction
	WHERE ALF_PE IN (
		SELECT
			a.ALF_PE
			FROM SAIL1384v.WLGP_CLEAN_GP_REG_BY_PRAC_INCLNONSAIL_MEDIAN_20220301 a
		JOIN SAIL1384V.WDSD_AR_PERS_20220801 b ON
			a.ALF_PE = b.ALF_PE
		WHERE
			GP_DATA_FLAG = 1
			AND '2012-01-01' BETWEEN START_DATE AND END_DATE
			AND	ROUND((DAYS(TO_DATE(TRIM(CHAR('2012' || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
			--Check for remaining alive
			AND (DOD >= '2013-01-01' OR DOD IS NULL)
			)
AND P.EVENT_DT < '2013-01-01'
AND DA.DIAGNOSIS_TYPE = 'Depression'
) 
)
--Patients prescibed an antipsychotic
WHERE ALF_PE IN 
(
	SELECT
		ALF_PE
	FROM
		(
		SELECT
			ALF_PE,
			EVENT_CD,
			EVENT_YR ,
			EVENT_DT ,
			--Counts the number of events per individual per day
			ROW_NUMBER () OVER (PARTITION BY ALF_PE ,EVENT_DT
									ORDER BY EVENT_DT ) 
				AS PRESCRIPTION_NUMBER
		FROM
			SAIL1384V.WLGP_GP_EVENT_CLEANSED_20220301
		WHERE
			(EVENT_CD LIKE 'd4%'
			OR EVENT_CD LIKE 'd5%')
			AND EVENT_CD NOT LIKE 'd48%'
			AND EVENT_YR = '2012' ) AS PRESCRIPTIONCOUNTS
	WHERE
		--restricts to 1 prescription date		
	PRESCRIPTION_NUMBER = 1
		--Restrict to individuals in the population denominator and enable age restriction
		AND ALF_PE IN (
		SELECT
			a.ALF_PE
			FROM SAIL1384v.WLGP_CLEAN_GP_REG_BY_PRAC_INCLNONSAIL_MEDIAN_20220301 a
		JOIN SAIL1384V.WDSD_AR_PERS_20220801 b ON
			a.ALF_PE = b.ALF_PE
		WHERE
			GP_DATA_FLAG = 1
			AND '2012-01-01' BETWEEN START_DATE AND END_DATE
			AND	ROUND((DAYS(TO_DATE(TRIM(CHAR('2012' || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
			--revised script 24022024 to remove requirement that they are alive
)
GROUP BY ALF_PE	
HAVING
		COUNT(*) >= 6 )
GROUP BY EVENT_YR
UNION ALL
SELECT EVENT_YR,
	COUNT(*)
FROM (--Patients on Disease Register
SELECT DISTINCT ALF_PE , DIAGNOSIS_TYPE, EVENT_YR 
FROM 
		(SELECT
			ALF_PE,
			EVENT_CD,
			'2011' EVENT_YR ,
			EVENT_DT,
			da.DIAGNOSIS_TYPE,
			da.read_cd
		FROM
			SAIL1384V.WLGP_GP_EVENT_CLEANSED_20220301 p
			LEFT JOIN SAILW1384V.DISEASEREGISTERREADCODES_AG2 da
			ON da.READ_CD = p.EVENT_CD 
	--Restrict to individuals in the population denominator and enable age restriction
	WHERE ALF_PE IN (
		SELECT
			a.ALF_PE
			FROM SAIL1384v.WLGP_CLEAN_GP_REG_BY_PRAC_INCLNONSAIL_MEDIAN_20220301 a
		JOIN SAIL1384V.WDSD_AR_PERS_20220801 b ON
			a.ALF_PE = b.ALF_PE
		WHERE
			GP_DATA_FLAG = 1
			AND '2011-01-01' BETWEEN START_DATE AND END_DATE
			AND	ROUND((DAYS(TO_DATE(TRIM(CHAR('2011' || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
			--Check for remaining alive
			AND (DOD >= '2012-01-01' OR DOD IS NULL)
			)
AND P.EVENT_DT < '2012-01-01'
AND DA.DIAGNOSIS_TYPE = 'Depression'
) 
)
--Patients prescibed an antipsychotic
WHERE ALF_PE IN 
(
	SELECT
		ALF_PE
	FROM
		(
		SELECT
			ALF_PE,
			EVENT_CD,
			EVENT_YR ,
			EVENT_DT ,
			--Counts the number of events per individual per day
			ROW_NUMBER () OVER (PARTITION BY ALF_PE ,EVENT_DT
									ORDER BY EVENT_DT ) 
				AS PRESCRIPTION_NUMBER
		FROM
			SAIL1384V.WLGP_GP_EVENT_CLEANSED_20220301
		WHERE
			(EVENT_CD LIKE 'd4%'
			OR EVENT_CD LIKE 'd5%')
			AND EVENT_CD NOT LIKE 'd48%'
			AND EVENT_YR = '2011' ) AS PRESCRIPTIONCOUNTS
	WHERE
		--restricts to 1 prescription date		
	PRESCRIPTION_NUMBER = 1
		--Restrict to individuals in the population denominator and enable age restriction
		AND ALF_PE IN (
		SELECT
			a.ALF_PE
			FROM SAIL1384v.WLGP_CLEAN_GP_REG_BY_PRAC_INCLNONSAIL_MEDIAN_20220301 a
		JOIN SAIL1384V.WDSD_AR_PERS_20220801 b ON
			a.ALF_PE = b.ALF_PE
		WHERE
			GP_DATA_FLAG = 1
			AND '2011-01-01' BETWEEN START_DATE AND END_DATE
			AND	ROUND((DAYS(TO_DATE(TRIM(CHAR('2011' || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
			--revised script 24022024 to remove requirement that they are alive
)
GROUP BY ALF_PE	
HAVING
		COUNT(*) >= 6 )
GROUP BY EVENT_YR