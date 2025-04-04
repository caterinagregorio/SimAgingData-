
prepare_csv <- function(input,nsim,name){
  lapply(1:nsim,function(x)fix_one_dataset(x,input,name))
}

fix_one_dataset <- function(x,input,name){
  
require(tidyverse)
require(magrittr)
dir.create(paste0("Transition across disease patterns//Simulated Data//",name))

data_ready <- input %>% filter(dataset_id==x) %>% 
  rename(subject_id=patient_id,
         cov1=dm_sex,
         cov2=educ_el,
         age_baseline=Age_entry) %>%
  mutate(age_exit=min(Age_exit,Age_death,na.rm = T),
         dht=ifelse(!is.na(Age_death),1,0)) %>% 
  select(-Age_death,-Age_exit,-contains("MP"),-lag_age,-age_group) %>% 
  select(dataset_id,subject_id,age_baseline,age_exit,time_in_study,dht,cov1,cov2,cov3,visit_number,age,ndis,everything())
print(colnames(data_ready))
write.csv(data_ready,file = paste0("Transition across disease patterns//Simulated Data//",name,"//",name,"_dataset",x))
  
}