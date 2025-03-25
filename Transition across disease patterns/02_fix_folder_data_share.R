
source("Transition across disease patterns/utils/prepare_csv.R")


load("Transition across disease patterns/Simulation Outputs/pop_study_2yr2_100_3000.RData")
prepare_csv(pop2,100,"schema_xa_3000")

load("Transition across disease patterns/Simulation Outputs/pop_study_2_100_3000.RData")
prepare_csv(pop,100,"schema_xb_3000")

load("Transition across disease patterns/Simulation Outputs/pop_study_iv2_100_3000.RData")
prepare_csv(pop_iv,100,"schema_xc_3000")



load("Transition across disease patterns/Simulation Outputs/pop_study_2yr_under2_100_3000.RData")
prepare_csv(pop2_under,100,"schema_xa_under_3000")

load("Transition across disease patterns/Simulation Outputs/pop_study_under2_100_3000.RData")
prepare_csv(pop_under,100,"schema_xb_under_3000")

load("Transition across disease patterns/Simulation Outputs/pop_study_iv_under2_100_3000.RData")
prepare_csv(pop_iv_under,100,"schema_xc_under_3000")





load("Transition across disease patterns/Simulation Outputs/pop_study_2yr2_100_10000.RData")
prepare_csv(pop2,100,"schema_xa_10000")

load("Transition across disease patterns/Simulation Outputs/pop_study_2_100_10000.RData")
prepare_csv(pop,100,"schema_xb_10000")

load("Transition across disease patterns/Simulation Outputs/pop_study_iv2_100_10000.RData")
prepare_csv(pop_iv,100,"schema_xc_10000")

