library(dplyr)
library(lubridate)

#Sys.setlocale("LC_TIME", "English")
#setwd('C:/Users/oak/Downloads/BasePlotting/ExData_Plotting1/')

fileurl = file.path(getwd(),'household_power_consumption.txt')

dat = 
  read.csv2(fileurl, header=T, na.strings = '?', as.is = T, dec='.') %>%
  filter(Date %in% c('1/2/2007','2/2/2007')) %>%
  mutate(datetime = dmy_hms(with(dat, paste(Date,Time))))

png('plot3.png',width=480,height=480)

with(dat, plot(datetime, Sub_metering_1, col='black', ylab='Energy sub metering',type='l',xlab=''))
axis(1, at=1:3, labels=c('Thu','Fri','Sat'))
with(dat, lines(datetime, Sub_metering_2,col='red'))
with(dat, lines(datetime, Sub_metering_3,col='blue'))
legend('topright',
       legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       col=c('black','red','blue'),
       lty=1
)

dev.off()