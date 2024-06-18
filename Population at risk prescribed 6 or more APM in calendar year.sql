SELECT
	EVENT_YR,
	COUNT(*)
FROM
	(
	SELECT
		ALF_PE,
		EVENT_YR
	FROM
		(
		SELECT
			ALF_PE,
			EVENT_CD,
			CAST(EVENT_YR AS varchar) AS EVENT_YR ,
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
--Change below to extract figures for each year
			AND '2020-01-01' BETWEEN START_DATE AND END_DATE
--Change below to extract figures for each year
			AND	ROUND((DAYS(TO_DATE(TRIM(CHAR('2020' || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
)
	GROUP BY
		ALF_PE ,
		EVENT_YR
	HAVING
		COUNT(*) >= 6 )
GROUP BY
	EVENT_YR
UNION ALL
SELECT
	EVENT_YR,
	COUNT(*)
FROM
	(
	SELECT
		ALF_PE,
		EVENT_YR
	FROM
		(
		SELECT
			ALF_PE,
			EVENT_CD,
			CAST(EVENT_YR AS varchar) AS EVENT_YR ,
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
--Change below to extract figures for each year
			AND '2019-01-01' BETWEEN START_DATE AND END_DATE
--Change below to extract figures for each year
			AND	ROUND((DAYS(TO_DATE(TRIM(CHAR('2019' || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
)
	GROUP BY
		ALF_PE ,
		EVENT_YR
	HAVING
		COUNT(*) >= 6 )
GROUP BY
	EVENT_YR
UNION ALL
SELECT
	EVENT_YR,
	COUNT(*)
FROM
	(
	SELECT
		ALF_PE,
		EVENT_YR
	FROM
		(
		SELECT
			ALF_PE,
			EVENT_CD,
			CAST(EVENT_YR AS varchar) AS EVENT_YR ,
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
--Change below to extract figures for each year
			AND '2018-01-01' BETWEEN START_DATE AND END_DATE
--Change below to extract figures for each year
			AND	ROUND((DAYS(TO_DATE(TRIM(CHAR('2018' || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
)
	GROUP BY
		ALF_PE ,
		EVENT_YR
	HAVING
		COUNT(*) >= 6 )
GROUP BY
	EVENT_YR
UNION ALL
SELECT
	EVENT_YR,
	COUNT(*)
FROM
	(
	SELECT
		ALF_PE,
		EVENT_YR
	FROM
		(
		SELECT
			ALF_PE,
			EVENT_CD,
			CAST(EVENT_YR AS varchar) AS EVENT_YR ,
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
--Change below to extract figures for each year
			AND '2017-01-01' BETWEEN START_DATE AND END_DATE
--Change below to extract figures for each year
			AND	ROUND((DAYS(TO_DATE(TRIM(CHAR('2017' || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
)
	GROUP BY
		ALF_PE ,
		EVENT_YR
	HAVING
		COUNT(*) >= 6 )
GROUP BY
	EVENT_YR
UNION ALL
SELECT
	EVENT_YR,
	COUNT(*)
FROM
	(
	SELECT
		ALF_PE,
		EVENT_YR
	FROM
		(
		SELECT
			ALF_PE,
			EVENT_CD,
			CAST(EVENT_YR AS varchar) AS EVENT_YR ,
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
--Change below to extract figures for each year
			AND '2016-01-01' BETWEEN START_DATE AND END_DATE
--Change below to extract figures for each year
			AND	ROUND((DAYS(TO_DATE(TRIM(CHAR('2016' || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
)
	GROUP BY
		ALF_PE ,
		EVENT_YR
	HAVING
		COUNT(*) >= 6 )
GROUP BY
	EVENT_YR
UNION ALL
SELECT
	EVENT_YR,
	COUNT(*)
FROM
	(
	SELECT
		ALF_PE,
		EVENT_YR
	FROM
		(
		SELECT
			ALF_PE,
			EVENT_CD,
			CAST(EVENT_YR AS varchar) AS EVENT_YR ,
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
--Change below to extract figures for each year
			AND '2015-01-01' BETWEEN START_DATE AND END_DATE
--Change below to extract figures for each year
			AND	ROUND((DAYS(TO_DATE(TRIM(CHAR('2015' || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
)
	GROUP BY
		ALF_PE ,
		EVENT_YR
	HAVING
		COUNT(*) >= 6 )
GROUP BY
	EVENT_YR
UNION ALL
SELECT
	EVENT_YR,
	COUNT(*)
FROM
	(
	SELECT
		ALF_PE,
		EVENT_YR
	FROM
		(
		SELECT
			ALF_PE,
			EVENT_CD,
			CAST(EVENT_YR AS varchar) AS EVENT_YR ,
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
--Change below to extract figures for each year
			AND '2014-01-01' BETWEEN START_DATE AND END_DATE
--Change below to extract figures for each year
			AND	ROUND((DAYS(TO_DATE(TRIM(CHAR('2014' || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
)
	GROUP BY
		ALF_PE ,
		EVENT_YR
	HAVING
		COUNT(*) >= 6 )
GROUP BY
	EVENT_YR
UNION ALL
SELECT
	EVENT_YR,
	COUNT(*)
FROM
	(
	SELECT
		ALF_PE,
		EVENT_YR
	FROM
		(
		SELECT
			ALF_PE,
			EVENT_CD,
			CAST(EVENT_YR AS varchar) AS EVENT_YR ,
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
--Change below to extract figures for each year
			AND '2013-01-01' BETWEEN START_DATE AND END_DATE
--Change below to extract figures for each year
			AND	ROUND((DAYS(TO_DATE(TRIM(CHAR('2013' || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
)
	GROUP BY
		ALF_PE ,
		EVENT_YR
	HAVING
		COUNT(*) >= 6 )
GROUP BY
	EVENT_YR
UNION ALL
SELECT
	EVENT_YR,
	COUNT(*)
FROM
	(
	SELECT
		ALF_PE,
		EVENT_YR
	FROM
		(
		SELECT
			ALF_PE,
			EVENT_CD,
			CAST(EVENT_YR AS varchar) AS EVENT_YR ,
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
--Change below to extract figures for each year
			AND '2012-01-01' BETWEEN START_DATE AND END_DATE
--Change below to extract figures for each year
			AND	ROUND((DAYS(TO_DATE(TRIM(CHAR('2012' || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
)
	GROUP BY
		ALF_PE ,
		EVENT_YR
	HAVING
		COUNT(*) >= 6 )
GROUP BY
	EVENT_YR
UNION ALL
SELECT
	EVENT_YR,
	COUNT(*)
FROM
	(
	SELECT
		ALF_PE,
		EVENT_YR
	FROM
		(
		SELECT
			ALF_PE,
			EVENT_CD,
			CAST(EVENT_YR AS varchar) AS EVENT_YR ,
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
--Change below to extract figures for each year
			AND '2011-01-01' BETWEEN START_DATE AND END_DATE
--Change below to extract figures for each year
			AND	ROUND((DAYS(TO_DATE(TRIM(CHAR('2011' || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
)
	GROUP BY
		ALF_PE ,
		EVENT_YR
	HAVING
		COUNT(*) >= 6 )
GROUP BY
	EVENT_YR
