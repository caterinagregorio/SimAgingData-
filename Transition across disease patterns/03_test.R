schema_xa_3000_dataset1 %>% filter(age_baseline>age_exit) %>% nrow()
test <- schema_xa_3000_dataset1 %>% mutate(test=age_exit-age_baseline) %>% filter(time_in_study-test>0.5)
summary(test$time_in_study-test$test)
table(test$dht)
