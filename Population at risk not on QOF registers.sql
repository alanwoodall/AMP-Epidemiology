--Patients on any register
 SELECT
	'2020' EVENT_YR,
	count(*)
	--Total population for that year
	FROM SAIL1384v.WLGP_CLEAN_GP_REG_BY_PRAC_INCLNONSAIL_MEDIAN_20220301 a
JOIN SAIL1384V.WDSD_AR_PERS_20220801 b ON
	a.ALF_PE = b.ALF_PE
WHERE
	GP_DATA_FLAG = 1
	--Amend for each year
	AND '2020-01-01' BETWEEN START_DATE AND END_DATE
	--Amend for each year
	AND ROUND((DAYS(TO_DATE(TRIM(CHAR('2020' || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
	--Only those in CTE which are patients on the register
	AND a.ALF_PE NOT IN (
	SELECT
		*
	FROM
		(
		SELECT
			DISTINCT ALF_PE
		FROM
			(
			SELECT
				ALF_PE,
				EVENT_CD,
				EVENT_YR ,
				EVENT_DT,
				da.DIAGNOSIS_TYPE,
				da.read_cd
			FROM
				SAIL1384V.WLGP_GP_EVENT_CLEANSED_20220301 p
			LEFT JOIN SAILW1384V.DISEASEREGISTERREADCODES_AG2 da ON
				da.READ_CD = p.EVENT_CD
				--Restrict to individuals in the population denominator and enable age restriction
				WHERE ALF_PE IN (
				SELECT
					a.ALF_PE
				FROM
					SAIL1384v.WLGP_CLEAN_GP_REG_BY_PRAC_INCLNONSAIL_MEDIAN_20220301 a
				JOIN SAIL1384V.WDSD_AR_PERS_20220801 b ON
					a.ALF_PE = b.ALF_PE
				WHERE
					GP_DATA_FLAG = 1
					--Amend for each year
					AND '2020-01-01' BETWEEN START_DATE AND END_DATE
					--Amend for each year
					AND ROUND((DAYS(TO_DATE(TRIM(CHAR('2020' || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
					--Check for remaining alive
					--Amend for each year
					AND (DOD >= '2021-01-01'
					OR DOD IS NULL) )
				--Amend for each year
				AND P.EVENT_DT < '2021-01-01'
				AND DA.DIAGNOSIS_TYPE IN ('Depression',
				'Dementia',
				'Mental Health') ) ) )
UNION ALL
--Patients on any register
 SELECT
	'2019' EVENT_YR,
	count(*)
	--Total population for that year
	FROM SAIL1384v.WLGP_CLEAN_GP_REG_BY_PRAC_INCLNONSAIL_MEDIAN_20220301 a
JOIN SAIL1384V.WDSD_AR_PERS_20220801 b ON
	a.ALF_PE = b.ALF_PE
WHERE
	GP_DATA_FLAG = 1
	--Amend for each year
	AND '2019-01-01' BETWEEN START_DATE AND END_DATE
	--Amend for each year
	AND ROUND((DAYS(TO_DATE(TRIM(CHAR('2019' || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
	--Only those in CTE which are patients on the register
	AND a.ALF_PE NOT IN (
	SELECT
		*
	FROM
		(
		SELECT
			DISTINCT ALF_PE
		FROM
			(
			SELECT
				ALF_PE,
				EVENT_CD,
				EVENT_YR ,
				EVENT_DT,
				da.DIAGNOSIS_TYPE,
				da.read_cd
			FROM
				SAIL1384V.WLGP_GP_EVENT_CLEANSED_20220301 p
			LEFT JOIN SAILW1384V.DISEASEREGISTERREADCODES_AG2 da ON
				da.READ_CD = p.EVENT_CD
				--Restrict to individuals in the population denominator and enable age restriction
				WHERE ALF_PE IN (
				SELECT
					a.ALF_PE
				FROM
					SAIL1384v.WLGP_CLEAN_GP_REG_BY_PRAC_INCLNONSAIL_MEDIAN_20220301 a
				JOIN SAIL1384V.WDSD_AR_PERS_20220801 b ON
					a.ALF_PE = b.ALF_PE
				WHERE
					GP_DATA_FLAG = 1
					--Amend for each year
					AND '2019-01-01' BETWEEN START_DATE AND END_DATE
					--Amend for each year
					AND ROUND((DAYS(TO_DATE(TRIM(CHAR('2019' || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
					--Check for remaining alive
					--Amend for each year
					AND (DOD >= '2020-01-01'
					OR DOD IS NULL) )
				--Amend for each year
				AND P.EVENT_DT < '2020-01-01'
				AND DA.DIAGNOSIS_TYPE IN ('Depression',
				'Dementia',
				'Mental Health') ) ) )
UNION ALL
--Patients on any register
 SELECT
	'2018' EVENT_YR,
	count(*)
	--Total population for that year
	FROM SAIL1384v.WLGP_CLEAN_GP_REG_BY_PRAC_INCLNONSAIL_MEDIAN_20220301 a
JOIN SAIL1384V.WDSD_AR_PERS_20220801 b ON
	a.ALF_PE = b.ALF_PE
WHERE
	GP_DATA_FLAG = 1
	--Amend for each year
	AND '2018-01-01' BETWEEN START_DATE AND END_DATE
	--Amend for each year
	AND ROUND((DAYS(TO_DATE(TRIM(CHAR('2018' || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
	--Only those in CTE which are patients on the register
	AND a.ALF_PE NOT IN (
	SELECT
		*
	FROM
		(
		SELECT
			DISTINCT ALF_PE
		FROM
			(
			SELECT
				ALF_PE,
				EVENT_CD,
				EVENT_YR ,
				EVENT_DT,
				da.DIAGNOSIS_TYPE,
				da.read_cd
			FROM
				SAIL1384V.WLGP_GP_EVENT_CLEANSED_20220301 p
			LEFT JOIN SAILW1384V.DISEASEREGISTERREADCODES_AG2 da ON
				da.READ_CD = p.EVENT_CD
				--Restrict to individuals in the population denominator and enable age restriction
				WHERE ALF_PE IN (
				SELECT
					a.ALF_PE
				FROM
					SAIL1384v.WLGP_CLEAN_GP_REG_BY_PRAC_INCLNONSAIL_MEDIAN_20220301 a
				JOIN SAIL1384V.WDSD_AR_PERS_20220801 b ON
					a.ALF_PE = b.ALF_PE
				WHERE
					GP_DATA_FLAG = 1
					--Amend for each year
					AND '2018-01-01' BETWEEN START_DATE AND END_DATE
					--Amend for each year
					AND ROUND((DAYS(TO_DATE(TRIM(CHAR('2018' || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
					--Check for remaining alive
					--Amend for each year
					AND (DOD >= '2019-01-01'
					OR DOD IS NULL) )
				--Amend for each year
				AND P.EVENT_DT < '2019-01-01'
				AND DA.DIAGNOSIS_TYPE IN ('Depression',
				'Dementia',
				'Mental Health') ) ) )
UNION ALL
--Patients on any register
 SELECT
	'2017' EVENT_YR,
	count(*)
	--Total population for that year
	FROM SAIL1384v.WLGP_CLEAN_GP_REG_BY_PRAC_INCLNONSAIL_MEDIAN_20220301 a
JOIN SAIL1384V.WDSD_AR_PERS_20220801 b ON
	a.ALF_PE = b.ALF_PE
WHERE
	GP_DATA_FLAG = 1
	--Amend for each year
	AND '2017-01-01' BETWEEN START_DATE AND END_DATE
	--Amend for each year
	AND ROUND((DAYS(TO_DATE(TRIM(CHAR('2017' || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
	--Only those in CTE which are patients on the register
	AND a.ALF_PE NOT IN (
	SELECT
		*
	FROM
		(
		SELECT
			DISTINCT ALF_PE
		FROM
			(
			SELECT
				ALF_PE,
				EVENT_CD,
				EVENT_YR ,
				EVENT_DT,
				da.DIAGNOSIS_TYPE,
				da.read_cd
			FROM
				SAIL1384V.WLGP_GP_EVENT_CLEANSED_20220301 p
			LEFT JOIN SAILW1384V.DISEASEREGISTERREADCODES_AG2 da ON
				da.READ_CD = p.EVENT_CD
				--Restrict to individuals in the population denominator and enable age restriction
				WHERE ALF_PE IN (
				SELECT
					a.ALF_PE
				FROM
					SAIL1384v.WLGP_CLEAN_GP_REG_BY_PRAC_INCLNONSAIL_MEDIAN_20220301 a
				JOIN SAIL1384V.WDSD_AR_PERS_20220801 b ON
					a.ALF_PE = b.ALF_PE
				WHERE
					GP_DATA_FLAG = 1
					--Amend for each year
					AND '2017-01-01' BETWEEN START_DATE AND END_DATE
					--Amend for each year
					AND ROUND((DAYS(TO_DATE(TRIM(CHAR('2017' || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
					--Check for remaining alive
					--Amend for each year
					AND (DOD >= '2018-01-01'
					OR DOD IS NULL) )
				--Amend for each year
				AND P.EVENT_DT < '2018-01-01'
				AND DA.DIAGNOSIS_TYPE IN ('Depression',
				'Dementia',
				'Mental Health') ) ) )
UNION ALL
--Patients on any register
 SELECT
	'2016' EVENT_YR,
	count(*)
	--Total population for that year
	FROM SAIL1384v.WLGP_CLEAN_GP_REG_BY_PRAC_INCLNONSAIL_MEDIAN_20220301 a
JOIN SAIL1384V.WDSD_AR_PERS_20220801 b ON
	a.ALF_PE = b.ALF_PE
WHERE
	GP_DATA_FLAG = 1
	--Amend for each year
	AND '2016-01-01' BETWEEN START_DATE AND END_DATE
	--Amend for each year
	AND ROUND((DAYS(TO_DATE(TRIM(CHAR('2016' || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
	--Only those in CTE which are patients on the register
	AND a.ALF_PE NOT IN (
	SELECT
		*
	FROM
		(
		SELECT
			DISTINCT ALF_PE
		FROM
			(
			SELECT
				ALF_PE,
				EVENT_CD,
				EVENT_YR ,
				EVENT_DT,
				da.DIAGNOSIS_TYPE,
				da.read_cd
			FROM
				SAIL1384V.WLGP_GP_EVENT_CLEANSED_20220301 p
			LEFT JOIN SAILW1384V.DISEASEREGISTERREADCODES_AG2 da ON
				da.READ_CD = p.EVENT_CD
				--Restrict to individuals in the population denominator and enable age restriction
				WHERE ALF_PE IN (
				SELECT
					a.ALF_PE
				FROM
					SAIL1384v.WLGP_CLEAN_GP_REG_BY_PRAC_INCLNONSAIL_MEDIAN_20220301 a
				JOIN SAIL1384V.WDSD_AR_PERS_20220801 b ON
					a.ALF_PE = b.ALF_PE
				WHERE
					GP_DATA_FLAG = 1
					--Amend for each year
					AND '2016-01-01' BETWEEN START_DATE AND END_DATE
					--Amend for each year
					AND ROUND((DAYS(TO_DATE(TRIM(CHAR('2016' || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
					--Check for remaining alive
					--Amend for each year
					AND (DOD >= '2017-01-01'
					OR DOD IS NULL) )
				--Amend for each year
				AND P.EVENT_DT < '2017-01-01'
				AND DA.DIAGNOSIS_TYPE IN ('Depression',
				'Dementia',
				'Mental Health') ) ) )
UNION ALL
--Patients on any register
 SELECT
	'2015' EVENT_YR,
	count(*)
	--Total population for that year
	FROM SAIL1384v.WLGP_CLEAN_GP_REG_BY_PRAC_INCLNONSAIL_MEDIAN_20220301 a
JOIN SAIL1384V.WDSD_AR_PERS_20220801 b ON
	a.ALF_PE = b.ALF_PE
WHERE
	GP_DATA_FLAG = 1
	--Amend for each year
	AND '2015-01-01' BETWEEN START_DATE AND END_DATE
	--Amend for each year
	AND ROUND((DAYS(TO_DATE(TRIM(CHAR('2015' || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
	--Only those in CTE which are patients on the register
	AND a.ALF_PE NOT IN (
	SELECT
		*
	FROM
		(
		SELECT
			DISTINCT ALF_PE
		FROM
			(
			SELECT
				ALF_PE,
				EVENT_CD,
				EVENT_YR ,
				EVENT_DT,
				da.DIAGNOSIS_TYPE,
				da.read_cd
			FROM
				SAIL1384V.WLGP_GP_EVENT_CLEANSED_20220301 p
			LEFT JOIN SAILW1384V.DISEASEREGISTERREADCODES_AG2 da ON
				da.READ_CD = p.EVENT_CD
				--Restrict to individuals in the population denominator and enable age restriction
				WHERE ALF_PE IN (
				SELECT
					a.ALF_PE
				FROM
					SAIL1384v.WLGP_CLEAN_GP_REG_BY_PRAC_INCLNONSAIL_MEDIAN_20220301 a
				JOIN SAIL1384V.WDSD_AR_PERS_20220801 b ON
					a.ALF_PE = b.ALF_PE
				WHERE
					GP_DATA_FLAG = 1
					--Amend for each year
					AND '2015-01-01' BETWEEN START_DATE AND END_DATE
					--Amend for each year
					AND ROUND((DAYS(TO_DATE(TRIM(CHAR('2015' || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
					--Check for remaining alive
					--Amend for each year
					AND (DOD >= '2016-01-01'
					OR DOD IS NULL) )
				--Amend for each year
				AND P.EVENT_DT < '2016-01-01'
				AND DA.DIAGNOSIS_TYPE IN ('Depression',
				'Dementia',
				'Mental Health') ) ) )
UNION ALL
--Patients on any register
 SELECT
	'2014' EVENT_YR,
	count(*)
	--Total population for that year
	FROM SAIL1384v.WLGP_CLEAN_GP_REG_BY_PRAC_INCLNONSAIL_MEDIAN_20220301 a
JOIN SAIL1384V.WDSD_AR_PERS_20220801 b ON
	a.ALF_PE = b.ALF_PE
WHERE
	GP_DATA_FLAG = 1
	--Amend for each year
	AND '2014-01-01' BETWEEN START_DATE AND END_DATE
	--Amend for each year
	AND ROUND((DAYS(TO_DATE(TRIM(CHAR('2014' || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
	--Only those in CTE which are patients on the register
	AND a.ALF_PE NOT IN (
	SELECT
		*
	FROM
		(
		SELECT
			DISTINCT ALF_PE
		FROM
			(
			SELECT
				ALF_PE,
				EVENT_CD,
				EVENT_YR ,
				EVENT_DT,
				da.DIAGNOSIS_TYPE,
				da.read_cd
			FROM
				SAIL1384V.WLGP_GP_EVENT_CLEANSED_20220301 p
			LEFT JOIN SAILW1384V.DISEASEREGISTERREADCODES_AG2 da ON
				da.READ_CD = p.EVENT_CD
				--Restrict to individuals in the population denominator and enable age restriction
				WHERE ALF_PE IN (
				SELECT
					a.ALF_PE
				FROM
					SAIL1384v.WLGP_CLEAN_GP_REG_BY_PRAC_INCLNONSAIL_MEDIAN_20220301 a
				JOIN SAIL1384V.WDSD_AR_PERS_20220801 b ON
					a.ALF_PE = b.ALF_PE
				WHERE
					GP_DATA_FLAG = 1
					--Amend for each year
					AND '2014-01-01' BETWEEN START_DATE AND END_DATE
					--Amend for each year
					AND ROUND((DAYS(TO_DATE(TRIM(CHAR('2014' || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
					--Check for remaining alive
					--Amend for each year
					AND (DOD >= '2015-01-01'
					OR DOD IS NULL) )
				--Amend for each year
				AND P.EVENT_DT < '2015-01-01'
				AND DA.DIAGNOSIS_TYPE IN ('Depression',
				'Dementia',
				'Mental Health') ) ) )
UNION ALL
--Patients on any register
 SELECT
	'2013' EVENT_YR,
	count(*)
	--Total population for that year
	FROM SAIL1384v.WLGP_CLEAN_GP_REG_BY_PRAC_INCLNONSAIL_MEDIAN_20220301 a
JOIN SAIL1384V.WDSD_AR_PERS_20220801 b ON
	a.ALF_PE = b.ALF_PE
WHERE
	GP_DATA_FLAG = 1
	--Amend for each year
	AND '2013-01-01' BETWEEN START_DATE AND END_DATE
	--Amend for each year
	AND ROUND((DAYS(TO_DATE(TRIM(CHAR('2013' || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
	--Only those in CTE which are patients on the register
	AND a.ALF_PE NOT IN (
	SELECT
		*
	FROM
		(
		SELECT
			DISTINCT ALF_PE
		FROM
			(
			SELECT
				ALF_PE,
				EVENT_CD,
				EVENT_YR ,
				EVENT_DT,
				da.DIAGNOSIS_TYPE,
				da.read_cd
			FROM
				SAIL1384V.WLGP_GP_EVENT_CLEANSED_20220301 p
			LEFT JOIN SAILW1384V.DISEASEREGISTERREADCODES_AG2 da ON
				da.READ_CD = p.EVENT_CD
				--Restrict to individuals in the population denominator and enable age restriction
				WHERE ALF_PE IN (
				SELECT
					a.ALF_PE
				FROM
					SAIL1384v.WLGP_CLEAN_GP_REG_BY_PRAC_INCLNONSAIL_MEDIAN_20220301 a
				JOIN SAIL1384V.WDSD_AR_PERS_20220801 b ON
					a.ALF_PE = b.ALF_PE
				WHERE
					GP_DATA_FLAG = 1
					--Amend for each year
					AND '2013-01-01' BETWEEN START_DATE AND END_DATE
					--Amend for each year
					AND ROUND((DAYS(TO_DATE(TRIM(CHAR('2013' || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
					--Check for remaining alive
					--Amend for each year
					AND (DOD >= '2014-01-01'
					OR DOD IS NULL) )
				--Amend for each year
				AND P.EVENT_DT < '2014-01-01'
				AND DA.DIAGNOSIS_TYPE IN ('Depression',
				'Dementia',
				'Mental Health') ) ) )
UNION ALL
--Patients on any register
 SELECT
	'2012' EVENT_YR,
	count(*)
	--Total population for that year
	FROM SAIL1384v.WLGP_CLEAN_GP_REG_BY_PRAC_INCLNONSAIL_MEDIAN_20220301 a
JOIN SAIL1384V.WDSD_AR_PERS_20220801 b ON
	a.ALF_PE = b.ALF_PE
WHERE
	GP_DATA_FLAG = 1
	--Amend for each year
	AND '2012-01-01' BETWEEN START_DATE AND END_DATE
	--Amend for each year
	AND ROUND((DAYS(TO_DATE(TRIM(CHAR('2012' || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
	--Only those in CTE which are patients on the register
	AND a.ALF_PE NOT IN (
	SELECT
		*
	FROM
		(
		SELECT
			DISTINCT ALF_PE
		FROM
			(
			SELECT
				ALF_PE,
				EVENT_CD,
				EVENT_YR ,
				EVENT_DT,
				da.DIAGNOSIS_TYPE,
				da.read_cd
			FROM
				SAIL1384V.WLGP_GP_EVENT_CLEANSED_20220301 p
			LEFT JOIN SAILW1384V.DISEASEREGISTERREADCODES_AG2 da ON
				da.READ_CD = p.EVENT_CD
				--Restrict to individuals in the population denominator and enable age restriction
				WHERE ALF_PE IN (
				SELECT
					a.ALF_PE
				FROM
					SAIL1384v.WLGP_CLEAN_GP_REG_BY_PRAC_INCLNONSAIL_MEDIAN_20220301 a
				JOIN SAIL1384V.WDSD_AR_PERS_20220801 b ON
					a.ALF_PE = b.ALF_PE
				WHERE
					GP_DATA_FLAG = 1
					--Amend for each year
					AND '2012-01-01' BETWEEN START_DATE AND END_DATE
					--Amend for each year
					AND ROUND((DAYS(TO_DATE(TRIM(CHAR('2012' || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
					--Check for remaining alive
					--Amend for each year
					AND (DOD >= '2013-01-01'
					OR DOD IS NULL) )
				--Amend for each year
				AND P.EVENT_DT < '2013-01-01'
				AND DA.DIAGNOSIS_TYPE IN ('Depression',
				'Dementia',
				'Mental Health') ) ) )
UNION ALL
--Patients on any register
 SELECT
	'2011' EVENT_YR,
	count(*)
	--Total population for that year
	FROM SAIL1384v.WLGP_CLEAN_GP_REG_BY_PRAC_INCLNONSAIL_MEDIAN_20220301 a
JOIN SAIL1384V.WDSD_AR_PERS_20220801 b ON
	a.ALF_PE = b.ALF_PE
WHERE
	GP_DATA_FLAG = 1
	--Amend for each year
	AND '2011-01-01' BETWEEN START_DATE AND END_DATE
	--Amend for each year
	AND ROUND((DAYS(TO_DATE(TRIM(CHAR('2011' || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
	--Only those in CTE which are patients on the register
	AND a.ALF_PE NOT IN (
	SELECT
		*
	FROM
		(
		SELECT
			DISTINCT ALF_PE
		FROM
			(
			SELECT
				ALF_PE,
				EVENT_CD,
				EVENT_YR ,
				EVENT_DT,
				da.DIAGNOSIS_TYPE,
				da.read_cd
			FROM
				SAIL1384V.WLGP_GP_EVENT_CLEANSED_20220301 p
			LEFT JOIN SAILW1384V.DISEASEREGISTERREADCODES_AG2 da ON
				da.READ_CD = p.EVENT_CD
				--Restrict to individuals in the population denominator and enable age restriction
				WHERE ALF_PE IN (
				SELECT
					a.ALF_PE
				FROM
					SAIL1384v.WLGP_CLEAN_GP_REG_BY_PRAC_INCLNONSAIL_MEDIAN_20220301 a
				JOIN SAIL1384V.WDSD_AR_PERS_20220801 b ON
					a.ALF_PE = b.ALF_PE
				WHERE
					GP_DATA_FLAG = 1
					--Amend for each year
					AND '2011-01-01' BETWEEN START_DATE AND END_DATE
					--Amend for each year
					AND ROUND((DAYS(TO_DATE(TRIM(CHAR('2011' || '0101')), 'YYYY-mm-dd')) - DAYS(WOB))/ 365.25, 0) >= 18
					--Check for remaining alive
					--Amend for each year
					AND (DOD >= '2012-01-01'
					OR DOD IS NULL) )
				--Amend for each year
				AND P.EVENT_DT < '2012-01-01'
				AND DA.DIAGNOSIS_TYPE IN ('Depression',
				'Dementia',
				'Mental Health') ) ) )
