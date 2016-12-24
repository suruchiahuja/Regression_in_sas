%let SEED = 64337; *<-----Replace 64337 with your assigned SEED number; 
data scov(type=cov);
input _TYPE_ $ 1-4 _NAME_ $ 6-15 sat_score age los num_nurse num_visits;
cards;
COV  sat_score  161.3 -56.6 -14.1 21.3 27.5
COV  age        -56.6 154.3 20.7 4.7 11.3 
COV  los        -14.1 20.7 49 1.3 5.6 
COV  num_nurse  21.3 4.7 1.3 25 3.7 
COV  num_visits 27.5 11.3 5.6 3.7 9
MEAN            61.9 39.7 19.4 20.4 10.6
;
run;
proc simnorm data=scov outsim=ssim numreal=47 seed=&SEED;
var sat_score age los num_nurse num_visits;
run;
data satisfaction;
	set ssim;
	sat_score = round(sat_score);
	age = round(age);
	los = round(los);
	num_nurse=round(num_nurse);
	num_visits=round(num_visits,0.1);
	drop Rnum;
run;
proc print data=satisfaction;
run;
