install.packages("data.table")
library(data.table)
file_data = fread("q1_data.csv")
df = data.frame(file_data)

colnames(df)
head(df, 2)
nrow(df)
tail(df, 2)
df[47,'Ozone']
sum(is.na(df[,'Ozone']))

not_na_vec = !is.na(df[,"Ozone"])
mean(df[not_na_vec,"Ozone"])

solar_R_vals = df[df$Ozone > 31 & df$Temp>90, "Solar.R"]
not_na_R_vals = !is.na(solar_R_vals)
mean(solar_R_vals[not_na_R_vals])

Temp_vals = df[df$Month == 6, "Temp"]
mean(Temp_vals)

Ozone_vals = df[df$Month == 5, "Ozone"]
clean_ozone_vals = Ozone_vals[!is.na(Ozone_vals)]
max(clean_ozone_vals)