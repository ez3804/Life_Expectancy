#

library(idbr)

idb_api_key("2a32a05c009dc9eb4c5c027d217ef33f74088576")

full <- idb5(country = 'all', year = '2025', variables = c('E0_F', 'E0_M'), country_name = TRUE)

save(full, file = 'idbr_data.rds')

