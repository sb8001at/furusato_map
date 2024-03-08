if(!require(pacman)) install.packages("pacman")
pacman::p_load(tidyverse, sf, leaflet, shiny, shinythemes)

options(scipen=100) # 桁の大きい数値を指数表示にしない

vec <- 
  c("pop", "pop_M", "pop_F", "pop_2015", "pop_change", "pop_change_rate",
    "pop_density", "household", "Number_donations_accepted", "Donation_amount_accepted",
    "Number_donations_from_outside", "Donation_amount_from_outside", "Costs_procure_gifts",
    "Costs_return_gifts", "Costs_PR", "Costs_settlement", "Costs_Administration",
    "Costs_others", "Total_costs", "Donation_amount_per_pop", "Donation_number_per_pop")

names(vec) <- 
  c("人口（2020年）", "男性人口", "女性人口", "人口（2015年）", "5年間の人口増減数", 
    "5年間の人口増減率", "人口密度", "世帯数", "受け入れた寄付件数", "受け入れた寄附金額", 
    "市町村外から受け入れた寄付件数", "市町村外から受け入れた寄付金額", "返礼品等の調達に係る費用",
    "返礼品等の送付に係る費用", "広報に係る費用", "決済等に係る費用", "事務に係る費用", 
    "その他の費用", "費用合計", "一人当たりの市町村外から受け入れた寄付金額",
    "一人当たりの市町村外から受け入れた寄付件数")

vec_nin <- c("pop", "pop_M", "pop_F", "pop_2015", "pop_change", "pop_density")
vec_ken <- c("Number_donations_accepted", "Number_donations_from_outside", "Donation_number_per_pop")
vec_yen <- c(
  "Donation_amount_accepted", "Donation_amount_from_outside", "Costs_procure_gifts",
  "Costs_return_gifts", "Costs_PR", "Costs_settlement", "Costs_Administration",
  "Costs_others", "Donation_amount_per_pop")
