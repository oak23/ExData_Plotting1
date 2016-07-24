library(dplyr)

#Sys.setlocale("LC_TIME", "English")
#setwd('C:/Users/oak/Downloads/BasePlotting/')

fileurl = file.path(getwd(),'household_power_consumption.txt')

dat = read.csv2(fileurl, header=T, na.strings = '?', as.is = T, dec='.') %>%
  filter(Date %in% c('1/2/2007','2/2/2007'))

datetime = strptime(paste(dat$Date, dat$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


png('plot3.png',width=480,height=480)

plot(datetime, dat$Sub_metering_1, col='black', ylab='Energy sub metering',type='l',xlab='')
axis(1, at=1:3, labels=c('Thu','Fri','Sat'))
lines(datetime, dat$Sub_metering_2,col='red')
lines(datetime, dat$Sub_metering_3,col='blue')
legend('topright',
       legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       col=c('black','red','blue'),
       lty=1
       )

dev.off()