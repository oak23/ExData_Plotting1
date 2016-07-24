library(dplyr)
library(lubridate)

#Sys.setlocale("LC_TIME", "English")
#setwd('C:/Users/oak/Downloads/BasePlotting/ExData_Plotting1/')

fileurl = file.path(getwd(),'household_power_consumption.txt')

dat = 
  read.csv2(fileurl, header=T, na.strings = '?', as.is = T, dec='.') %>%
  filter(Date %in% c('1/2/2007','2/2/2007')) %>%
  mutate(datetime = dmy_hms(with(dat, paste(Date,Time))))

png('plot1.png',width=480,height=480)

hist(dat$Global_active_power,col='red',
     main='Global Active Power',xlab='Global Active power (kilowatts)')

dev.off()