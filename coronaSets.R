
rm(list=ls())
library (Hmisc)

data <- read.csv("C:/Users/91992/OneDrive/Desktop/COVID19_line_list_data.csv")
describe(data)

#cleaned up the data
data$death_dummy <- as.integer(data$death != 0)
#death rate
sum(data$death_dummy/nrow(data))

#***AGE:People who die are older
dead = subset(data, death_dummy==1)
alive = subset(data, death_dummy==0)

mean (dead$age)
mean (alive$age)

t.test(alive$age, dead$age, alternative = "two.sided",conf.level = 0.96)

#***Gender:People who die are older
men = subset(data, gender=="male")
women = subset(data, gender=="female")

mean (men$death_dummy)
mean (women$death_dummy)
