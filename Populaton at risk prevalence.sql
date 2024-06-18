SELECT CAST(EVENT_YR AS varchar) AS EVENT_YR,
COUNT(*)
FROM (
SELECT
				a.ALF_PE,
--Change below to extract figures for each year
				'2020' EVENT_YR,
				a.START_DATE,
				a.END_DATE,
				b.WOB
			FROM 
				SAIL1384v.WLGP_CLEAN_GP_REG_BY_PRAC_INCLNONSAIL_MEDIAN_20220301 a
			JOIN SAIL1384V.WDSD_AR_PERS_20220801 b ON
				a.ALF_PE = b.ALF_PE
			WHERE
				GP_DATA_FLAG = 1
--Change below to extract figures for each year
				AND '2020-01-01' BETWEEN START_DATE AND END_DATE
		) 
--Remove for total population all ages
WHERE ROUND((DAYS(TO_DATE(TRIM(CHAR(EVENT_YR || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
GROUP BY
	EVENT_YR
UNION ALL
SELECT CAST(EVENT_YR AS varchar) AS EVENT_YR,
COUNT(*)
FROM (
SELECT
				a.ALF_PE,
--Change below to extract figures for each year
				'2019' EVENT_YR,
				a.START_DATE,
				a.END_DATE,
				b.WOB
			FROM 
				SAIL1384v.WLGP_CLEAN_GP_REG_BY_PRAC_INCLNONSAIL_MEDIAN_20220301 a
			JOIN SAIL1384V.WDSD_AR_PERS_20220801 b ON
				a.ALF_PE = b.ALF_PE
			WHERE
				GP_DATA_FLAG = 1
--Change below to extract figures for each year
				AND '2019-01-01' BETWEEN START_DATE AND END_DATE
		) 
--Remove for total population all ages
WHERE ROUND((DAYS(TO_DATE(TRIM(CHAR(EVENT_YR || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
GROUP BY
	EVENT_YR
UNION ALL
SELECT CAST(EVENT_YR AS varchar) AS EVENT_YR,
COUNT(*)
FROM (
SELECT
				a.ALF_PE,
--Change below to extract figures for each year
				'2018' EVENT_YR,
				a.START_DATE,
				a.END_DATE,
				b.WOB
			FROM 
				SAIL1384v.WLGP_CLEAN_GP_REG_BY_PRAC_INCLNONSAIL_MEDIAN_20220301 a
			JOIN SAIL1384V.WDSD_AR_PERS_20220801 b ON
				a.ALF_PE = b.ALF_PE
			WHERE
				GP_DATA_FLAG = 1
--Change below to extract figures for each year
				AND '2018-01-01' BETWEEN START_DATE AND END_DATE
		) 
--Remove for total population all ages
WHERE ROUND((DAYS(TO_DATE(TRIM(CHAR(EVENT_YR || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
GROUP BY
	EVENT_YR
UNION ALL
SELECT CAST(EVENT_YR AS varchar) AS EVENT_YR,
COUNT(*)
FROM (
SELECT
				a.ALF_PE,
--Change below to extract figures for each year
				'2017' EVENT_YR,
				a.START_DATE,
				a.END_DATE,
				b.WOB
			FROM 
				SAIL1384v.WLGP_CLEAN_GP_REG_BY_PRAC_INCLNONSAIL_MEDIAN_20220301 a
			JOIN SAIL1384V.WDSD_AR_PERS_20220801 b ON
				a.ALF_PE = b.ALF_PE
			WHERE
				GP_DATA_FLAG = 1
--Change below to extract figures for each year
				AND '2017-01-01' BETWEEN START_DATE AND END_DATE
		) 
--Remove for total population all ages
WHERE ROUND((DAYS(TO_DATE(TRIM(CHAR(EVENT_YR || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
GROUP BY
	EVENT_YR
UNION ALL
SELECT CAST(EVENT_YR AS varchar) AS EVENT_YR,
COUNT(*)
FROM (
SELECT
				a.ALF_PE,
--Change below to extract figures for each year
				'2016' EVENT_YR,
				a.START_DATE,
				a.END_DATE,
				b.WOB
			FROM 
				SAIL1384v.WLGP_CLEAN_GP_REG_BY_PRAC_INCLNONSAIL_MEDIAN_20220301 a
			JOIN SAIL1384V.WDSD_AR_PERS_20220801 b ON
				a.ALF_PE = b.ALF_PE
			WHERE
				GP_DATA_FLAG = 1
--Change below to extract figures for each year
				AND '2016-01-01' BETWEEN START_DATE AND END_DATE
		) 
--Remove for total population all ages
WHERE ROUND((DAYS(TO_DATE(TRIM(CHAR(EVENT_YR || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
GROUP BY
	EVENT_YR
UNION ALL
SELECT CAST(EVENT_YR AS varchar) AS EVENT_YR,
COUNT(*)
FROM (
SELECT
				a.ALF_PE,
--Change below to extract figures for each year
				'2015' EVENT_YR,
				a.START_DATE,
				a.END_DATE,
				b.WOB
			FROM 
				SAIL1384v.WLGP_CLEAN_GP_REG_BY_PRAC_INCLNONSAIL_MEDIAN_20220301 a
			JOIN SAIL1384V.WDSD_AR_PERS_20220801 b ON
				a.ALF_PE = b.ALF_PE
			WHERE
				GP_DATA_FLAG = 1
--Change below to extract figures for each year
				AND '2015-01-01' BETWEEN START_DATE AND END_DATE
		) 
--Remove for total population all ages
WHERE ROUND((DAYS(TO_DATE(TRIM(CHAR(EVENT_YR || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
GROUP BY
	EVENT_YR
UNION ALL
SELECT CAST(EVENT_YR AS varchar) AS EVENT_YR,
COUNT(*)
FROM (
SELECT
				a.ALF_PE,
--Change below to extract figures for each year
				'2014' EVENT_YR,
				a.START_DATE,
				a.END_DATE,
				b.WOB
			FROM 
				SAIL1384v.WLGP_CLEAN_GP_REG_BY_PRAC_INCLNONSAIL_MEDIAN_20220301 a
			JOIN SAIL1384V.WDSD_AR_PERS_20220801 b ON
				a.ALF_PE = b.ALF_PE
			WHERE
				GP_DATA_FLAG = 1
--Change below to extract figures for each year
				AND '2014-01-01' BETWEEN START_DATE AND END_DATE
		) 
--Remove for total population all ages
WHERE ROUND((DAYS(TO_DATE(TRIM(CHAR(EVENT_YR || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
GROUP BY
	EVENT_YR
UNION ALL
SELECT CAST(EVENT_YR AS varchar) AS EVENT_YR,
COUNT(*)
FROM (
SELECT
				a.ALF_PE,
--Change below to extract figures for each year
				'2013' EVENT_YR,
				a.START_DATE,
				a.END_DATE,
				b.WOB
			FROM 
				SAIL1384v.WLGP_CLEAN_GP_REG_BY_PRAC_INCLNONSAIL_MEDIAN_20220301 a
			JOIN SAIL1384V.WDSD_AR_PERS_20220801 b ON
				a.ALF_PE = b.ALF_PE
			WHERE
				GP_DATA_FLAG = 1
--Change below to extract figures for each year
				AND '2013-01-01' BETWEEN START_DATE AND END_DATE
		) 
--Remove for total population all ages
WHERE ROUND((DAYS(TO_DATE(TRIM(CHAR(EVENT_YR || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
GROUP BY
	EVENT_YR
UNION ALL
SELECT CAST(EVENT_YR AS varchar) AS EVENT_YR,
COUNT(*)
FROM (
SELECT
				a.ALF_PE,
--Change below to extract figures for each year
				'2012' EVENT_YR,
				a.START_DATE,
				a.END_DATE,
				b.WOB
			FROM 
				SAIL1384v.WLGP_CLEAN_GP_REG_BY_PRAC_INCLNONSAIL_MEDIAN_20220301 a
			JOIN SAIL1384V.WDSD_AR_PERS_20220801 b ON
				a.ALF_PE = b.ALF_PE
			WHERE
				GP_DATA_FLAG = 1
--Change below to extract figures for each year
				AND '2012-01-01' BETWEEN START_DATE AND END_DATE
		) 
--Remove for total population all ages
WHERE ROUND((DAYS(TO_DATE(TRIM(CHAR(EVENT_YR || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
GROUP BY
	EVENT_YR
UNION ALL
SELECT CAST(EVENT_YR AS varchar) AS EVENT_YR,
COUNT(*)
FROM (
SELECT
				a.ALF_PE,
--Change below to extract figures for each year
				'2011' EVENT_YR,
				a.START_DATE,
				a.END_DATE,
				b.WOB
			FROM 
				SAIL1384v.WLGP_CLEAN_GP_REG_BY_PRAC_INCLNONSAIL_MEDIAN_20220301 a
			JOIN SAIL1384V.WDSD_AR_PERS_20220801 b ON
				a.ALF_PE = b.ALF_PE
			WHERE
				GP_DATA_FLAG = 1
--Change below to extract figures for each year
				AND '2011-01-01' BETWEEN START_DATE AND END_DATE
		) 
--Remove for total population all ages
WHERE ROUND((DAYS(TO_DATE(TRIM(CHAR(EVENT_YR || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
GROUP BY
	EVENT_YR

 