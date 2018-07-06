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

**clus_2***;


data clus_2;
set as.jasdata_cluster6_Final;
where cluster = 2;
run;

**1.elasticity for fleece**;

**look for beta**;
proc reg data = clus_2;
model fleece_qty = fleece_ns_qty  mail_cnt email_cnt sms_cnt;
run;

proc means data = clus_2;
var fleece_qty fleece_ns_qty;
run;

**2.elasticity for needle**;

**look for beta**;
proc reg data = clus_2;
model needle_qty = needle_ns_qty  mail_cnt email_cnt sms_cnt;
run;

proc means data = clus_2;
var needle_qty needle_ns_qty;
run;
**3.elasticity for warm**;

**look for beta**;
proc reg data = clus_2;
model warm_qty = warm_ns_qty  mail_cnt email_cnt sms_cnt;
run;

proc means data = clus_2;
var warm_qty warm_ns_qty;
run;
**4.elasticity for foam**;

**look for beta**;
proc reg data = clus_2;
model foam_qty = foam_ns_qty  mail_cnt email_cnt sms_cnt;
run;

proc means data = clus_2;
var foam_qty foam_ns_qty;
run;
**5.elasticity for quilt**;

**look for beta**;
proc reg data = clus_2;
model quilt_qty = quilt_ns_qty  mail_cnt email_cnt sms_cnt;
run;

proc means data = clus_2;
var quilt_qty quilt_ns_qty;
run;
**6.elasticity for public**;

**look for beta**;
proc reg data = clus_2;
model public_qty = public_ns_qty  mail_cnt email_cnt sms_cnt;
run;

proc means data = clus_2;
var public_qty public_ns_qty;
run;
**7.elasticity for sew**;

**look for beta**;
proc reg data = clus_2;
model sew_qty = sew_ns_qty  mail_cnt email_cnt sms_cnt;
run;

proc means data = clus_2;
var sew_qty sew_ns_qty;
run;

**9.elasticity for other**;

**look for beta**;
proc reg data = clus_2;
model other_qty = other_ns_qty  mail_cnt email_cnt sms_cnt;
run;

proc means data = clus_2;
var other_qty other_ns_qty;
run;
**10.elasticity for homedec**;

**look for beta**;
proc reg data = clus_2;
model homedec_qty = homedec_ns_qty  mail_cnt email_cnt sms_cnt;
run;

proc means data = clus_2;
var homedec_qty homedec_ns_qty;
run;

**8.elasticity for fabric**;

**look for beta**;
proc reg data = clus_2;
model fabric_qty = fabric_ns_qty  mail_cnt email_cnt sms_cnt;
run;

proc means data = clus_2;
var fabric_qty fabric_ns_qty;
run;
logit_fleece=0;	logit_needle=0; logit_warm=0;	logit_foam=0;	logit_quilt=0;	
logit_public=0;	logit_sew=0;	logit_other=0;	logit_homedec=0;	logit_fabric=0;


**Market Basket Analysis**;
data clus_2_mba;
set clus_2;
logit_fleece=0;	logit_needle=0; logit_warm=0;	logit_foam=0;	logit_quilt=0;	
logit_public=0;	logit_sew=0;	logit_other=0;	logit_homedec=0;	logit_fabric=0;
if fleece_qty > 0 then logit_fleece = 1;
if needle_qty > 0 then logit_needle = 1;
if warm_qty > 0 then logit_warm = 1;
if foam_qty > 0 then logit_foam = 1;
if quilt_qty > 0 then logit_quilt = 1;
if public_qty > 0 then logit_public = 1;
if sew_qty > 0 then logit_sew = 1;
if other_qty > 0 then logit_other = 1;
if homedec_qty > 0 then logit_homedec = 1;
if fabric_qty > 0 then logit_fabric = 1;
run;


proc means data = clus_2_mba;
var logit_fleece logit_needle logit_warm logit_foam logit_quilt logit_public logit_sew logit_other logit_homedec logit_fabric; 
run;

proc logistic descending data = clus_2_mba;
model logit_fleece =logit_needle logit_warm logit_foam logit_quilt logit_public logit_sew logit_other logit_homedec logit_fabric;  
run;

proc logistic descending data = clus_2_mba;
model logit_needle  =logit_fleece logit_warm logit_foam logit_quilt logit_public logit_sew logit_other logit_homedec logit_fabric;  
run;

proc logistic descending data = clus_2_mba;
model logit_warm =logit_fleece logit_needle  logit_foam logit_quilt logit_public logit_sew logit_other logit_homedec logit_fabric;  
run;

proc logistic descending data = clus_2_mba;
model logit_foam = logit_fleece logit_needle logit_warm  logit_quilt logit_public logit_sew logit_other logit_homedec logit_fabric;  
run;

proc logistic descending data = clus_2_mba;
model logit_quilt =logit_fleece logit_needle logit_warm logit_foam  logit_public logit_sew logit_other logit_homedec logit_fabric;  
run;

proc logistic descending data = clus_2_mba;
model logit_public = logit_fleece logit_needle logit_warm logit_foam logit_quilt  logit_sew logit_other logit_homedec logit_fabric;  
run;

proc logistic descending data = clus_2_mba;
model logit_sew=logit_fleece logit_needle logit_warm logit_foam logit_quilt logit_public  logit_other logit_homedec logit_fabric;  
run;

proc logistic descending data = clus_2_mba;
model logit_other =logit_fleece logit_needle logit_warm logit_foam logit_quilt logit_public logit_sew logit_homedec logit_fabric;  
run;

proc logistic descending data = clus_2_mba;
model logit_homedec =logit_fleece logit_needle logit_warm logit_foam logit_quilt logit_public logit_sew logit_other  logit_fabric;  
run;

proc logistic descending data = clus_2_mba;
model logit_fabric =logit_fleece logit_needle logit_warm logit_foam logit_quilt logit_public logit_sew logit_other logit_homedec ;  
run;
