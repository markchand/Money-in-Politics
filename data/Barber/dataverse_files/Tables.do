use "/Users/mbarber/Desktop/JOP Replication Code/Table_2.dta", clear

*TABLE 3 - Main Results
* Column 1 - All Data
areg npscore_all i.year ind_unlimited limited_int_ind_log_limit pac_unlimited limited_int_pac_log_limit pres_vote contested dist_income2 republican compete majority_party term_limit chamber_pct_dem professionalism if hold == 1, absorb(st) vce(cluster district_fe)

* Column 2 - Low Limit States
areg npscore_all i.year limited_int_ind_log_limit limited_int_pac_log_limit pres_vote contested dist_income2 republican compete majority_party term_limit chamber_pct_dem professionalism if (hold == 1 & low_median_ind == 1 & low_median_pac == 1), absorb(st) vce(cluster district_fe)

* Column 3 - High Limit States
areg npscore_all i.year ind_unlimited limited_int_ind_log_limit pac_unlimited limited_int_pac_log_limit pres_vote contested dist_income2 republican compete majority_party term_limit chamber_pct_dem professionalism if (hold == 1 & low_median_ind == 0 & low_median_pac == 0) | (hold == 1 & ind_unlimited == 1 & pac_unlimited == 1) , absorb(st) vce(cluster district_fe)

* Column 4 - Professionalized
areg npscore_all i.year ind_unlimited limited_int_ind_log_limit pac_unlimited limited_int_pac_log_limit pres_vote contested dist_income2 republican compete majority_party term_limit chamber_pct_dem professionalism if (hold == 1 & high_median_prof == 1), absorb(st) vce(cluster district_fe)

* Column 5 - Non-Professionalized
areg npscore_all i.year ind_unlimited limited_int_ind_log_limit pac_unlimited limited_int_pac_log_limit pres_vote contested dist_income2 republican compete majority_party term_limit chamber_pct_dem professionalism if (hold == 1 & high_median_prof == 0), absorb(st) vce(cluster district_fe)


***************************************


*Table A1 - Summary Statistics
sum npscore_all, det
sum ind_unlimited, det
sum ind_limits if ind_unlimited == 0, det
sum pac_unlimited, det
sum pac_limits if pac_unlimited == 0, det
sum pres_vote, det
sum contested, det
sum dist_income2, det
sum republican, det
sum compete, det
sum majority_party, det
sum term_limit, det
sum chamber_pct_dem, det
sum professionalism, det
sum year, det


***************************************


*Table A3 - Limits as ratio

gen ratio = ind_limits / pac_limits

* Column 1 - All Data
areg npscore_all i.year ratio pres_vote contested dist_income2 republican compete majority_party term_limit chamber_pct_dem professionalism if hold == 1 & ind_unlimited == 0 & pac_unlimited == 0, absorb(st) vce(cluster district_fe)

* Column 2 - Low Limit States
areg npscore_all i.year ratio pres_vote contested dist_income2 republican compete majority_party term_limit chamber_pct_dem professionalism if hold == 1 & ind_unlimited == 0 & pac_unlimited == 0 & low_median_ind == 1 & low_median_pac == 1, absorb(st) vce(cluster district_fe)

* Column 3 - Professionalized
areg npscore_all i.year ratio pres_vote contested dist_income2 republican compete majority_party term_limit chamber_pct_dem professionalism if hold == 1 & high_median_prof == 1 & ind_unlimited == 0 & pac_unlimited == 0, absorb(st) vce(cluster district_fe)


***************************************


*Table A4 - Post 2000 Only, Complete Panel

*Column 1 - All Data
areg npscore_all i.year ind_unlimited limited_int_ind_log_limit pac_unlimited limited_int_pac_log_limit pres_vote contested dist_income2 republican compete majority_party term_limit chamber_pct_dem if (hold == 1 & year >= 2000), absorb(st) vce(cluster district_fe)

*Column 2 - Low Limit States
areg npscore_all i.year limited_int_ind_log_limit limited_int_pac_log_limit pres_vote contested dist_income2 republican compete majority_party chamber_pct_dem if (hold == 1 & low_median_ind == 1 & low_median_pac == 1 & year >= 2000), absorb(st) vce(cluster district_fe)

*Column 3 - High Limit States
areg npscore_all i.year ind_unlimited limited_int_ind_log_limit pac_unlimited limited_int_pac_log_limit pres_vote contested dist_income2 republican compete majority_party term_limit chamber_pct_dem if (hold == 1 & low_median_ind == 0 & low_median_pac == 0 & year >= 2000) | (hold == 1 & pac_unlimited == 1 & ind_unlimited == 1 & yea >= 2000), absorb(st) vce(cluster district_fe)

*Column 4 - Professionalized
areg npscore_all i.year ind_unlimited limited_int_ind_log_limit pac_unlimited limited_int_pac_log_limit pres_vote contested dist_income2 republican compete majority_party term_limit chamber_pct_dem if (hold == 1 & high_median_prof == 1 & year >= 2000), absorb(st) vce(cluster district_fe)


***************************************


*Table A6 - Split by party

*Column 1 - Democrats
areg npscore_all i.year ind_unlimited limited_int_ind_log_limit pac_unlimited limited_int_pac_log_limit pres_vote contested dist_income2 compete majority_party term_limit chamber_pct_dem if (democrat == 1 & high_median_prof == 1), absorb(st) vce(cluster district_fe)

*Column 2 - Republicans
areg npscore_all i.year ind_unlimited limited_int_ind_log_limit pac_unlimited limited_int_pac_log_limit pres_vote contested dist_income2 compete majority_party term_limit chamber_pct_dem if (republican == 1 & high_median_prof == 1), absorb(st) vce(cluster district_fe)


***************************************


*TABLE A7 - One observation = legislator-year

* Column 1 - All Data
areg npscore_all i.year ind_unlimited limited_int_ind_log_limit pac_unlimited limited_int_pac_log_limit pres_vote contested dist_income2 republican compete majority_party term_limit chamber_pct_dem professionalism, absorb(st) vce(cluster district_fe)

* Column 2 - Low Limit States
areg npscore_all i.year limited_int_ind_log_limit limited_int_pac_log_limit pres_vote contested dist_income2 republican compete majority_party term_limit chamber_pct_dem professionalism if (low_median_ind == 1 & low_median_pac == 1), absorb(st) vce(cluster district_fe)

* Column 3 - High Limit States
areg npscore_all i.year ind_unlimited limited_int_ind_log_limit pac_unlimited limited_int_pac_log_limit pres_vote contested dist_income2 republican compete majority_party term_limit chamber_pct_dem professionalism if (low_median_ind == 0 & low_median_pac == 0) | (ind_unlimited == 1 & pac_unlimited == 1) , absorb(st) vce(cluster district_fe)

* Column 4 - Professionalized
areg npscore_all i.year ind_unlimited limited_int_ind_log_limit pac_unlimited limited_int_pac_log_limit pres_vote contested dist_income2 republican compete majority_party term_limit chamber_pct_dem professionalism if (high_median_prof == 1), absorb(st) vce(cluster district_fe)

* Column 5 - Non-Professionalized
areg npscore_all i.year ind_unlimited limited_int_ind_log_limit pac_unlimited limited_int_pac_log_limit pres_vote contested dist_income2 republican compete majority_party term_limit chamber_pct_dem professionalism if (high_median_prof == 0), absorb(st) vce(cluster district_fe)


***************************************


*TABLE A8 - Different Specification

* Column 1 - quadratic model - All Data
areg npscore_all i.year ind_unlimited limited_int_ind_limit limited_int_ind_limit2 pac_unlimited limited_int_pac_limit limited_int_pac_limit2 pres_vote contested dist_income2 republican compete majority_party term_limit chamber_pct_dem professionalism if (hold == 1), absorb(st) vce(cluster district_fe)

* Column 2 - quadratic model - Professionalized States
areg npscore_all i.year ind_unlimited limited_int_ind_limit limited_int_ind_limit2 pac_unlimited limited_int_pac_limit limited_int_pac_limit2 pres_vote contested dist_income2 republican compete majority_party term_limit chamber_pct_dem professionalism if (hold == 1 & high_median_prof == 1), absorb(st) vce(cluster district_fe)

* Column 3 - unlogged model - All Data
areg npscore_all i.year ind_unlimited limited_int_ind_limit pac_unlimited limited_int_pac_limit pres_vote contested dist_income2 republican compete majority_party term_limit chamber_pct_dem professionalism if (hold == 1), absorb(st) vce(cluster district_fe)

* Column 4 - unlogged model - Professionalized States
areg npscore_all i.year ind_unlimited limited_int_ind_limit pac_unlimited limited_int_pac_limit pres_vote contested dist_income2 republican compete majority_party term_limit chamber_pct_dem professionalism if (hold == 1 & high_median_prof == 1), absorb(st) vce(cluster district_fe)


***************************************


*TABLE A9 - Difference in Party Means
use "/Users/mbarber/Desktop/JOP Replication Code/Table_A9.dta", clear

*Column 1 - all data
areg diff_mean i.year ind_unlimited limited_int_ind_log_limit pac_unlimited limited_int_pac_log_limit term_limit chamber_pct_dem dem_majority median_income professionalism, absorb(state) vce(cluster state)

*Column 2 - Low Limit States
areg diff_mean i.year limited_int_ind_log_limit limited_int_pac_log_limit term_limit chamber_pct_dem dem_majority median_income professionalism if low_median_ind == 1 & low_median_pac == 1, absorb(state) vce(cluster state)

*Column 3 - High Limit States
areg diff_mean i.year ind_unlimited limited_int_ind_log_limit pac_unlimited limited_int_pac_log_limit term_limit chamber_pct_dem dem_majority median_income professionalism if (low_median_ind == 0 & low_median_pac == 0) | (ind_unlimited == 1 & pac_unlimited == 1), absorb(state) vce(cluster state)

*Column 4 - Professional States
areg diff_mean i.year ind_unlimited limited_int_ind_log_limit pac_unlimited limited_int_pac_log_limit term_limit chamber_pct_dem dem_majority median_income professionalism if high_median_prof == 1, absorb(state) vce(cluster state)

*Column 5 - Nonprofessional States
areg diff_mean i.year ind_unlimited limited_int_ind_log_limit pac_unlimited limited_int_pac_log_limit term_limit chamber_pct_dem dem_majority median_income professionalism if high_median_prof == 0, absorb(state) vce(cluster state)


***************************************


*TABLE A10 - Placebo Test
areg diff_mean i.year placebo1 placebo2 placebo3 placebo4 term_limit chamber_pct_dem dem_majority median_income professionalism, absorb(state) vce(cluster state)







