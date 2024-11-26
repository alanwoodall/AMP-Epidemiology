# AMP-Epidemiology
SQL coding spines for main data extraction for AMP epidemiology paper. 

PLease find attached a number of documents that support the research paper published here: https://doi.org/10.3399/BJGP.2024.0367
This is a longitudinal populaton study examining the prescribing of antipsychotic medicaitons to adults using the SAIL databank.

Documents attached:
1. The 5-digit Read codes used to extract antipsychotic prescriptions
2. The OQF disease regsiter codes for the SMI, depression and dementia QOF registers, and PDF copies of the business rules for each QOF register
3. The SQL codes that allow calculation of the data extracted for each table in the paper:

Table 1.: Prevalance of APM prescribing: This is calculated using data from two SQL codes
              'population at risk prevalence' - gives the denominator adult count
              'population at risk prescribed 6 or more APM' - gives the numerator adult count
   
Table 2: Proportions of patients undergoing psychiatric review This is calculated using data from two SQL codes
               'LOC APM denominator' - all patients in each LHB prescribed APM - gives the denominator count
               'LOC APM numerator;  - all patinets in each LHB presctibed APM who had a psychiatric review, either hosptial admisison or outpatent appt, in the previous 12 months (or varying time period)

Table 3:  Population prevalence on each QOF register, or not on any of the 3 psychiatric illness registers. THis is calcualated using the following three SQL codes
               ' population at risk prevalence' - gives the count of adult population (denominator)
               'population at risk on QOF registers' - gives the count of adults on each of QOF SMI, Depression, and Dementia     register (numerator)
               'population at risk not on QOF registers' - give the count of adults not on any of the 3 QOF registers above (numerator)

 Table 4:  Prevalencce of APM prescribing to patient on each QOF register. This is calculated using data from 3 SQL codes
               'Patients on QOF register with APM prescribing - counts of patients on each QOF reigster taking APM (numerator)
               'Patietns not on QOF regisster with APM prescribing' - counts of patients not on above registers taking APM (numerator)
               'Population at risk on QOF registers' - denominator population for QOF populations and those not on register

Table 5:  Overall APM use for patients on each QOF register/not on register. Uses data from 3 SQL files
               'popualtion at risk prescribed 6 or more APM' - gives the adulty denominator count
               'Patients on QOF register with APM prescribing - counts of patients on each QOF reigster taking APM (numerator)
               'Patietns not on QOF regisster with APM prescribing' - counts of patients not on above registers taking APM (numerator)
               
               
   
               
