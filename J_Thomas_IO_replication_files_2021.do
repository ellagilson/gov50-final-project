**Replication do-file for Jakana L. Thomas. "Wolves in Sheep's Clothing: Assessing the Effect of Gender Norms on the Lethality of Female Suicide Terrorism" International Organization***

use "JThomas_IO.dta", clear

*Replication for Table 2*
*Table 1
ttest number_killed, by (female0_1)
ttest number_killed if civilian==1, by (female0_1)
ttest number_killed if political==1, by (female0_1)
ttest number_killed if security==1 , by (female0_1)
ttest number_killed if assassination0_1==1, by (female0_1)

*Replication for Models 1-4 in Table 2*

*Model 1
nbreg number_killed female0_1  numwoundmonth_lag lnbd number_terrorists_year numkillmonth_lag religion_imp  many_attackers_cat weapon0_1 assassination0_1  political security t1 t2 t3,  vce (cluster campaign_number)

*Model 2/Figure 2: Expected Change in Lethality of Terror Attack by Gender, Across Female Participation in Anti-State Protests
nbreg number_killed female0_1##c.nonvprotgovt_cat numwoundmonth_lag lnbd number_terrorists_year numkillmonth_lag religion_imp  many_attackers_cat weapon0_1 assassination0_1  political security t1 t2 t3,  vce (cluster campaign_number)
margins,  dydx(female0_1) at((asobserved) nonvprotgovt_cat =(0 (1) 4))  level(90) 
marginsplot,  ytitle(Expected Change in the Number of Fatalities) recastci(rarea)

*Model 3/ Figure 3: Expected Change in Lethality of Terror Attack by Gender, Across Female Civil Society Participation
nbreg number_killed female0_1##c.v2x_gencs numwoundmonth_lag lnbd number_terrorists_year numkillmonth_lag religion_imp  many_attackers_cat weapon0_1 assassination0_1  political security t1 t2 t3,  vce (cluster campaign_number)
margins,  dydx(female0_1) at((asobserved)  v2x_gencs  =(.206 (.01) .937))  level(90) 
marginsplot,  ytitle(Expected Change in the Number of Fatalities) 

*Model 4/Figure 1: Expected Change in Lethality of Terror Attack by Gender, Across Female Labor Force Participation 
nbreg number_killed female0_1##c.ratiooffemaletomalelaborforcepar numwoundmonth_lag lnbd number_terrorists_year numkillmonth_lag religion_imp  many_attackers_cat weapon0_1 assassination0_1  political security t1 t2 t3,  vce (cluster campaign_number)
margins,  dydx(female0_1) at((asobserved)  ratiooffemaletomalelaborforcepar  =(8.87 (1) 96.8))  level(90) 
marginsplot,  ytitle(Expected Change in the Number of Fatalities)   


**Replication for Figure 4: Expected Number of Fatalities Attributed to Female Terrorist Attacks Across Time)

nbreg number_killed female0_1 c.timesincefirstwoman##c.timesincefirstwoman numwoundmonth_lag lnbd number_terrorists_year numkillmonth_lag religion_imp  many_attackers_cat weapon0_1 assassination0_1  political security t1 t2 t3,  vce (cluster campaign_number)
margins,  predict () at((means) _all timesincefirstwoman=(0 (1) 30) female0_1=(1))  level(90) 
marginsplot



