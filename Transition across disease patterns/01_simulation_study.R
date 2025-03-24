library(tidyverse)
library(magrittr)
library(flexsurv)
library(mstate)
library(hesim)
library(data.table)
library(ggplot2)
library(tidyverse)
library(magrittr)
library(splines)
library(stats)
library(rstpm2)
library(truncdist)
library(flexsurv)
source("Transition across disease patterns/fun/fun_simulate_mm.R")
source("Transition across disease patterns/fun/study_design_fun.R")

# save simulation results 
output_folder <-paste0("Simulation Outputs")

if (!dir.exists(output_folder)) {
  dir.create(output_folder)
  message("Folder 'Simulation Outputs' created.")
} else {
  message("Folder 'Simulation Outputs' already exists.")
}


####   SCENARIO 1: 2 Multimorbidity disease patterns ####

scenario <- "2" # number of disease patterns
load(paste0("Transition across disease patterns/init/scenario",scenario,".RData"))

# 1) How many datasets?
N <- 100

#####   10000 #####

# 2) how many individuals?
nsim <- 10000

# Set seed for reproduce results 
seed<- 1258

simlist_2 <- sim_mm_traj(nsim,N,scenario_obj = scenario_obj_B,seed=seed,scenario = "2")
simdata2_10000 <- simlist_2[[1]]
simlongdata2_10000<- simlist_2[[2]]

save(simdata2_10000, file = paste0(output_folder, "/", "sim_data_",scenario,"_",as.character(N),"_",as.character(nsim),".RData"))
save(simlongdata2_10000, file = paste0(output_folder, "/", "sim_datalong_",scenario,"_",as.character(N),"_",as.character(nsim),".RData"))
message("Dataset saved in 'Simulation Outputs' folder.")

### Population based study SNAC-K

# years in between follow-ups and corresponding age threshold for population based scenario
# patients with age <= 78 years have follow ups every 6 years, > 78 every 3 years
age_tr <- 78
obs_t_int <- c(6,3)

pop <- popbased_study(simdata2_10000,simlongdata2_10000,
                      obs_t_int = obs_t_int, age_tr = age_tr)

save(pop, file = paste0(output_folder, "/", "pop_study_",scenario,"_"
                        ,as.character(N),"_",as.character(nsim),".RData"))

### Every two years

# years in between follow-ups and corresponding age threshold for population based scenario
# patients with age <= 78 years have follow ups every 6 years, > 78 every 3 years

age_tr <- 78
obs_t_int <- c(2,2)

pop2 <- popbased_study(simdata2_10000,simlongdata2_10000,
                      obs_t_int = obs_t_int, age_tr = age_tr)

save(pop2, file = paste0(output_folder, "/", "pop_study_2yr",scenario,"_"
                        ,as.character(N),"_",as.character(nsim),".RData"))

### Irregular visits

pop_iv <- iv_study(simdata2_10000,simlongdata2_10000)

save(pop_iv, file = paste0(output_folder, "/", "pop_study_iv",scenario,"_"
                           ,as.character(N),"_",as.character(nsim),".RData"))

#####   3000 #####

# 2) how many individuals?
nsim <- 3000

# Set seed for reproduce results 
seed<- 1259

simlist_2 <- sim_mm_traj(nsim,N,scenario_obj = scenario_obj_B,seed=seed,scenario = "2")
simdata2_3000 <- simlist_2[[1]]
simlongdata2_3000<- simlist_2[[2]]

save(simdata2_3000, file = paste0(output_folder, "/", "sim_data_",scenario,"_",as.character(N),"_",as.character(nsim),".RData"))
save(simlongdata2_3000, file = paste0(output_folder, "/", "sim_datalong_",scenario,"_",as.character(N),"_",as.character(nsim),".RData"))
message("Dataset saved in 'Simulation Outputs' folder.")

### Population based study SNAC-K

# years in between follow-ups and corresponding age threshold for population based scenario
# patients with age <= 78 years have follow ups every 6 years, > 78 every 3 years
age_tr <- 78
obs_t_int <- c(6,3)

pop <- popbased_study(simdata2_3000,simlongdata2_3000,
                      obs_t_int = obs_t_int, age_tr = age_tr)

save(pop, file = paste0(output_folder, "/", "pop_study_",scenario,"_"
                        ,as.character(N),"_",as.character(nsim),".RData"))

### Every two years

# years in between follow-ups and corresponding age threshold for population based scenario
# patients with age <= 78 years have follow ups every 6 years, > 78 every 3 years

age_tr <- 78
obs_t_int <- c(2,2)

pop2 <- popbased_study(simdata2_3000,simlongdata2_3000,
                       obs_t_int = obs_t_int, age_tr = age_tr)

save(pop2, file = paste0(output_folder, "/", "pop_study_2yr",scenario,"_"
                         ,as.character(N),"_",as.character(nsim),".RData"))

### Irregular visits

pop_iv <- iv_study(simdata2_3000,simlongdata2_3000)

save(pop_iv, file = paste0(output_folder, "/", "pop_study_iv",scenario,"_"
                           ,as.character(N),"_",as.character(nsim),".RData"))

#######################################
#######  UNDERREPORTING ###############
#######################################

set.seed(42)

# 5) list of underreported disease
underrep_diseases <- c("dementia", "depression_mood_dis", "chronic_kidney_dis", "osteoarthr_degen_joint_dis", "deafness_hearing_loss")
# 6) vector with corresponding underreporting probabilities
diseases_prob <- c(0.2,0.2,0.2,0.2, 0.2)

pop_under <- apply_underrep(pop, underrep_diseases , diseases_prob)

save(pop_under, file = paste0(output_folder, "/", "pop_study_under",scenario,"_"
                              ,as.character(N),"_",as.character(nsim),".RData"))


pop2_under <- apply_underrep(pop2, underrep_diseases , diseases_prob)

save(pop2_under, file = paste0(output_folder, "/", "pop_study_2yr_under",scenario,"_"
                              ,as.character(N),"_",as.character(nsim),".RData"))

pop_iv_under <- apply_underrep(pop_iv, underrep_diseases , diseases_prob)

save(pop_iv_under, file = paste0(output_folder, "/", "pop_study_iv_under",scenario,"_"
                               ,as.character(N),"_",as.character(nsim),".RData"))