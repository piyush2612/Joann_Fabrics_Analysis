libname as "C:\Users\pak16\Desktop\Project";


***segment size***;
proc freq data = as.jasdata_cluster6_Final;
table cluster;
run;

***revenue by segment*****;
proc sort data = as.jasdata_cluster6_Final;
by cluster;
run;

proc means sum mean data = as.jasdata_cluster6_Final;
var t_ns t_qty;
by cluster;
run;

Proc means data = as.jasdata_cluster6_Final;
var t_ns t_qty;
run;

**clus_3***;


data clus_3;
set as.jasdata_cluster6_Final;
where cluster = 3;
run;

**1.elasticity for special**;

**look for beta**;
proc reg data = clus_3;
model special_qty = special_ns_qty  mail_cnt email_cnt sms_cnt;
run;

proc means data = clus_3;
var special_qty special_ns_qty;
run;

**2.elasticity for warm**;

proc reg data = clus_3;
model warm_qty = warm_ns_qty  mail_cnt email_cnt sms_cnt;
run;
 
proc means data = clus_3;
var warm_qty warm_ns_qty;
run;

**3.elasticity for fabric**;

proc reg data = clus_3;
model fabric_qty = fabric_ns_qty  mail_cnt email_cnt sms_cnt;
run;
 
proc means data = clus_3;
var fabric_qty fabric_ns_qty;
run;

**4.elasticity for seasfloral**;

proc reg data = clus_3;
model seasfloral_qty = seasfloral_ns_qty  mail_cnt email_cnt sms_cnt;
run;
 
proc means data = clus_3;
var seasfloral_qty seasfloral_ns_qty;
run;

**5.elasticity for quilt**;

proc reg data = clus_3;
model quilt_qty = quilt_ns_qty  mail_cnt email_cnt sms_cnt;
run;
 
proc means data = clus_3;
var quilt_qty quilt_ns_qty;
run;

**6.elasticity for public**;

proc reg data = clus_3;
model public_qty = public_ns_qty  mail_cnt email_cnt sms_cnt;
run;
 
proc means data = clus_3;
var public_qty public_ns_qty;
run;

**7.elasticity for sew**;

proc reg data = clus_3;
model sew_qty = sew_ns_qty  mail_cnt email_cnt sms_cnt;
run;
 
proc means data = clus_3;
var sew_qty sew_ns_qty;
run;

**8.elasticity for ribbon**;

proc reg data = clus_3;
model ribbon_qty = ribbon_ns_qty  mail_cnt email_cnt sms_cnt;
run;
 
proc means data = clus_3;
var ribbon_qty ribbon_ns_qty;
run;

**9.elasticity for needle**;

proc reg data = clus_3;
model needle_qty = needle_ns_qty  mail_cnt email_cnt sms_cnt;
run;
 
proc means data = clus_3;
var needle_qty needle_ns_qty;
run;


**10.elasticity for foam**;

proc reg data = clus_3;
model foam_qty = foam_ns_qty  mail_cnt email_cnt sms_cnt;
run;
 
proc means data = clus_3;
var foam_qty foam_ns_qty;
run;



**clus_4***;


data clus_4;
set as.jasdata_cluster6_Final;
where cluster = 4;
run;

**1.elasticity for seasfloral**;

proc reg data = clus_3;
model seasfloral_qty = seasfloral_ns_qty  mail_cnt email_cnt sms_cnt;
run;
 
proc means data = clus_3;
var seasfloral_qty seasfloral_ns_qty;
run;
**2.elasticity for paint**;

proc reg data = clus_3;
model paint_qty = paint_ns_qty  mail_cnt email_cnt sms_cnt;
run;
 
proc means data = clus_3;
var paint_qty paint_ns_qty;
run;
**3.elasticity for kids**;

proc reg data = clus_3;
model kids_qty = kids_ns_qty  mail_cnt email_cnt sms_cnt;
run;
 
proc means data = clus_3;
var kids_qty kids_ns_qty;
run;
**4.elasticity for paper**;

proc reg data = clus_3;
model paper_qty = paper_ns_qty  mail_cnt email_cnt sms_cnt;
run;
 
proc means data = clus_3;
var paper_qty paper_ns_qty;
run;
**5.elasticity for jewelry**;

proc reg data = clus_3;
model jewelry_qty = jewelry_ns_qty  mail_cnt email_cnt sms_cnt;
run;
 
proc means data = clus_3;
var jewelry_qty jewelry_ns_qty;
run;
**6.elasticity for bccomp**;

proc reg data = clus_3;
model bccomp_qty = bccomp_ns_qty  mail_cnt email_cnt sms_cnt;
run;
 
proc means data = clus_3;
var bccomp_qty bccomp_ns_qty;
run;
**7.elasticity for celeb**;

proc reg data = clus_3;
model celeb_qty = celeb_ns_qty  mail_cnt email_cnt sms_cnt;
run;
 
proc means data = clus_3;
var celeb_qty celeb_ns_qty;
run;
**8.elasticity for needle**;

proc reg data = clus_3;
model needle_qty = needle_ns_qty  mail_cnt email_cnt sms_cnt;
run;
 
proc means data = clus_3;
var needle_qty needle_ns_qty;
run;
**9.elasticity for ribbon**;

proc reg data = clus_3;
model ribbon_qty = ribbon_ns_qty  mail_cnt email_cnt sms_cnt;
run;
 
proc means data = clus_3;
var ribbon_qty ribbon_ns_qty;
run;
**10.elasticity for impulse**;

proc reg data = clus_3;
model impulse_qty = impulse_ns_qty  mail_cnt email_cnt sms_cnt;
run;
 
proc means data = clus_3;
var impulse_qty impulse_ns_qty;
run;



**Market Basket Analysis**;
data clus_3_mba;
set clus_3;
logit_special=0; logit_warm=0;	logit_fabric = 0;	logit_seasfloral=0;	logit_quilt = 0;	
logit_public=0; logit_sew = 0; 	logit_ribbon=0;	logit_needle=0;	logit_foam = 0;  
if special_qty > 0 then logit_special = 1;
if warm_qty > 0 then logit_warm = 1;
if fabric_qty > 0 then logit_fabric = 1;
if seasfloral_qty > 0 then logit_seasfloral = 1;
if quilt_qty > 0 then logit_quilt = 1;
if public_qty > 0 then logit_public = 1;
if sew_qty > 0 then logit_sew = 1;
if ribbon_qty > 0 then logit_ribbon = 1;
if needle_qty > 0 then logit_needle = 1;
if foam_qty > 0 then logit_foam = 1;
run;


proc means data = clus_3_mba;
var logit_special logit_warm logit_fabric logit_seasfloral logit_quilt logit_public logit_sew logit_ribbon logit_needle logit_foam; 
run;

proc logistic descending data = clus_3_mba;
model logit_special= logit_warm logit_fabric logit_seasfloral logit_quilt logit_public logit_sew logit_ribbon logit_needle logit_foam; 
run;

proc logistic descending data = clus_3_mba;
model logit_warm= logit_special logit_fabric logit_seasfloral logit_quilt logit_public logit_sew logit_ribbon logit_needle logit_foam; 
run;

proc logistic descending data = clus_3_mba;
model logit_fabric= logit_warm logit_special logit_seasfloral logit_quilt logit_public logit_sew logit_ribbon logit_needle logit_foam; 
run;

proc logistic descending data = clus_3_mba;
model logit_seasfloral= logit_special logit_warm logit_fabric  logit_quilt logit_public logit_sew logit_ribbon logit_needle logit_foam; 
run;

proc logistic descending data = clus_3_mba;
model logit_quilt = logit_special logit_warm logit_fabric logit_seasfloral  logit_public logit_sew logit_ribbon logit_needle logit_foam; 
run;


proc logistic descending data = clus_3_mba;
model logit_public= logit_special logit_warm logit_fabric logit_seasfloral logit_quilt  logit_sew logit_ribbon logit_needle logit_foam; 
run;


proc logistic descending data = clus_3_mba;
model logit_sew = logit_special logit_warm logit_fabric logit_seasfloral logit_quilt logit_public  logit_ribbon logit_needle logit_foam; 
run;


proc logistic descending data = clus_3_mba;
model logit_ribbon  = logit_special logit_warm logit_fabric logit_seasfloral logit_quilt logit_public logit_sew  logit_needle logit_foam; 
run;


proc logistic descending data = clus_3_mba;
model logit_needle = logit_special logit_warm logit_fabric logit_seasfloral logit_quilt logit_public logit_sew logit_ribbon  logit_foam; 
run;


proc logistic descending data = clus_3_mba;
model logit_foam=  logit_special logit_warm logit_fabric logit_seasfloral logit_quilt logit_public logit_sew logit_ribbon logit_needle; 
run;


