/*******************************************************************************************************
  Impact of COVID-19 on cancer screening and treatment in older adults: The Multiethnic Cohort Study
  11/2023
********************************************************************************************************/

/*Table 1 descriptive statistics*/
proc freq data=ALL; 
 table MEC_Baseline_CORR_SEX*(MEC_Baseline_eth age_survey_group); 
run;
PROC MEANS DATA=ALL N NMISS MEAN P50 MIN MAX STD;
  CLASS MEC_Baseline_CORR_SEX;
  VAR age_survey MEC_Baseline_yrsschl_c MEC_Baseline_packyrs MEC_Baseline_ethanol 
	  cv19_b_q76 cv19_b_q77 MEC_Baseline_DP_HEI2010_totscore; 
RUN;
PROC freq DATA=ALL;
  table MEC_Baseline_CORR_SEX*(cv19_b_q32 cv19_b_q78 cv19_b_q19 cv19_b_q89 cv19_b_q90);
RUN;
proc means data=ALL n nmiss min p25 p50 p75 max  mean std maxdec=2;
  class MEC_Baseline_CORR_SEX;
  var cv19_b_q5_wt cv19_b_q4_ht cv19_b_bmi MEC_Baseline_newqi_corr2;
run;

/*Supplementary File 1 = distribution of COVID survey participants by educational level and ethnicity, 
 data for MEC cohort was provided in a report*/
proc freq data=ALL; 
 table MEC_Baseline_eth*(Education); 
run;

/*Supplementary File 2 = Distribution of Baseline COVID Survey Participants 
 by Health Status, Comorbidities, and Medication Use*/
proc freq data=ALL;
 table MEC_Baseline_CORR_SEX*(cv19_b_q10 cv19_b_q11 cv19_b_q13 cv19_b_q14
                    cv19_b_q15-cv19_b_q18 cv19_b_q21 cv19_b_q22 cv19_b_q25-cv19_b_q31);
run;

/*Table 2 = Distribution for Postponing Regular Health Care Visits Due to COVID-19 Pandemic by Sex*/
/*Table 3 and Supplementary Table 3 = Distribution for Postponing Cancer Screening Test/Procedure/Treatment Due to COVID-19 Pandemic by Sex*/
proc freq data=ALL;
 table MEC_Baseline_CORR_SEX*(cv19_b_q91 cv19_b_q92_ent cv19_b_q92_allerg cv19_b_q92_audio cv19_b_q92_gyn cv19_b_q92_derm cv19_b_q92_dent
		cv19_b_q92_eye cv19_b_q92_gastro cv19_b_q92_lab cv19_b_q92_therapy cv19_b_q92_ortho cv19_b_q92_podi cv19_b_q92_onco 
		cv19_b_q92_PCP cv19_b_q92_urol cv19_b_q92_neuro cv19_b_q92_rheuma cv19_b_q92_pulm cv19_b_q92_cardio
		cv19_b_q92_1-cv19_b_q92_5 cv19_b_q92_6 cv19_b_q95 cv19_b_q96: cv19_b_q96_imaging cv19_b_q96_cervical)/norow nocol nopercent;
run; 

/*Table 4 Odds Ratio* for Change in Lifestyle or Daily Activities 
 Since Onset of COVID-19 Pandemic by Demographics and Comorbidities*/ 
*****Only MALES;
proc logistic data=allM descending;
class MEC_Baseline_eth (ref="W") 
	  cv19_b_q15 (ref="N") cv19_b_q16 (ref="N") cv19_b_q17 (ref="N") cv19_b_q18 (ref="N") cv19_b_q21 (ref="N") cv19_b_q22 (ref="N")/ param=ref;  
model cv19_b_q32 = MEC_Baseline_eth cv19_b_q15-cv19_b_q18 cv19_b_q21 cv19_b_q22 age_survey MEC_Baseline_yrsschl_c;
run;
*****Only FEMALES;
proc logistic data=allF descending;
class MEC_Baseline_eth (ref="W") 
	  cv19_b_q15 (ref="N") cv19_b_q16 (ref="N") cv19_b_q17 (ref="N") cv19_b_q18 (ref="N") cv19_b_q21 (ref="N") cv19_b_q22 (ref="N")/ param=ref;  
model cv19_b_q32 = MEC_Baseline_eth cv19_b_q15-cv19_b_q18 cv19_b_q21 cv19_b_q22 age_survey MEC_Baseline_yrsschl_c;
run;

/*Table 5. Odds Ratio* for Postponing Regular Health Care Visits 
 Due to COVID-19 Pandemic by Demographics and Comorbidities*/
*****Only MALES;
proc logistic data=allM descending;
class MEC_Baseline_eth (ref="W") 
	  cv19_b_q15 (ref="N") cv19_b_q16 (ref="N") cv19_b_q17 (ref="N") cv19_b_q18 (ref="N") cv19_b_q21 (ref="N") cv19_b_q22 (ref="N")/ param=ref;  
model cv19_b_q91 = MEC_Baseline_eth  cv19_b_q15-cv19_b_q18 cv19_b_q21 cv19_b_q22 age_survey MEC_Baseline_yrsschl_c;
run;
*****Only FEMALES;
proc logistic data=allF descending;
class MEC_Baseline_eth (ref="W")
	  cv19_b_q15 (ref="N") cv19_b_q16 (ref="N") cv19_b_q17 (ref="N") cv19_b_q18 (ref="N") cv19_b_q21 (ref="N") cv19_b_q22 (ref="N")/ param=ref;  
model cv19_b_q91 = MEC_Baseline_eth cv19_b_q15-cv19_b_q18 cv19_b_q21 cv19_b_q22 age_survey MEC_Baseline_yrsschl_c;
run;

/*Table 6. Odds Ratio* for Postponing Cancer Screening Test/Procedure 
 Due to COVID-19 Pandemic by Demographics and Comorbidities*/
*****Only MALES;
proc logistic data=allM descending;
class MEC_Baseline_eth (ref="W") 
	  cv19_b_q15 (ref="N") cv19_b_q16 (ref="N") cv19_b_q17 (ref="N") cv19_b_q18 (ref="N") cv19_b_q21 (ref="N") cv19_b_q22 (ref="N")/ param=ref;  
model cv19_b_q95 = MEC_Baseline_eth cv19_b_q15-cv19_b_q18 cv19_b_q21 cv19_b_q22 age_survey MEC_Baseline_yrsschl_c;
run;
*****Only FEMALES;
proc logistic data=allF descending;
class MEC_Baseline_eth (ref="W") 
	  cv19_b_q15 (ref="N") cv19_b_q16 (ref="N") cv19_b_q17 (ref="N") cv19_b_q18 (ref="N") cv19_b_q21 (ref="N") cv19_b_q22 (ref="N")/ param=ref;  
model cv19_b_q95 = MEC_Baseline_eth cv19_b_q15-cv19_b_q18 cv19_b_q21 cv19_b_q22 age_survey MEC_Baseline_yrsschl_c;
run;

/*FREQ for only Males for Tables 4-6*/
proc freq data=allM;  
 table (MEC_Baseline_eth MEC_Baseline_CORR_SEX cv19_b_q15-cv19_b_q18 cv19_b_q21 cv19_b_q22)*cv19_b_q32;
run;
proc means data=allM;
 var age_survey MEC_Baseline_yrsschl_c;
 class cv19_b_q32;
run;
proc freq data=allM;  
 table (MEC_Baseline_eth MEC_Baseline_CORR_SEX cv19_b_q15-cv19_b_q18 cv19_b_q21 cv19_b_q22)*cv19_b_q91;
run;
proc means data=allM;
 var age_survey MEC_Baseline_yrsschl_c;
 class cv19_b_q91;
run;
proc freq data=allM;  
 table (MEC_Baseline_eth MEC_Baseline_CORR_SEX cv19_b_q15-cv19_b_q18 cv19_b_q21 cv19_b_q22)*cv19_b_q95;
run;
proc means data=allM;
 var age_survey MEC_Baseline_yrsschl_c;
 class cv19_b_q95;
run;

/*FREQ for only Females for Tables 4-6*/
proc freq data=allF;  
 table (MEC_Baseline_eth MEC_Baseline_CORR_SEX cv19_b_q15-cv19_b_q18 cv19_b_q21 cv19_b_q22)*cv19_b_q32;
run;
proc means data=allF;
 var age_survey MEC_Baseline_yrsschl_c;
 class cv19_b_q32;
run;
proc freq data=allF;  
 table (MEC_Baseline_eth MEC_Baseline_CORR_SEX cv19_b_q15-cv19_b_q18 cv19_b_q21 cv19_b_q22)*cv19_b_q91;
run;
proc means data=allF;
 var age_survey MEC_Baseline_yrsschl_c;
 class cv19_b_q91;
run;
proc freq data=allF;  
 table (MEC_Baseline_eth MEC_Baseline_CORR_SEX cv19_b_q15-cv19_b_q18 cv19_b_q21 cv19_b_q22)*cv19_b_q95;
run;
proc means data=allF;
 var age_survey MEC_Baseline_yrsschl_c;
 class cv19_b_q95;
run;

/*For Tables 4-6 = number of participants who have no comorbidities but answered Yes to one of the following questions analyzed for the odds ratio*/
proc freq data=ALL; table cv19_b_q32*(newvarNO)*MEC_Baseline_corr_sex; run;
proc freq data=ALL; table cv19_b_q91*(newvarNO)*MEC_Baseline_corr_sex; run;
proc freq data=ALL; table cv19_b_q95*(newvarNO)*MEC_Baseline_corr_sex; run;

/*For Discussion on effect on cancer screening = Stratify 75 yo and younger*/ 
PROC freq data=ALL;
 table MEC_Baseline_corr_sex*(cv19_b_q95);
 where age_survey<75;
run;
