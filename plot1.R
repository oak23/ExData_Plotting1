library(dplyr)

Sys.setlocale("LC_TIME", "English")
setwd('C:/Users/oak/Downloads/BasePlotting/ExData_Plotting1/')

fileurl = file.path(getwd(),'household_power_consumption.txt')

dat = read.csv2(fileurl, header=T, na.strings = '?', as.is = T, dec='.') %>%
  filter(Date %in% c('1/2/2007','2/2/2007'))

datetime = strptime(paste(dat$Date, dat$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


png('plot1.png',width=480,height=480)

hist(dat$Global_active_power,col='red',
     main='Global Active Power',xlab='Global Active power (kilowatts)')

dev.off()