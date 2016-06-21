setwd("/Users/Dipendra/Desktop/Coursera/ExData_Plotting1")

#Loading lubridate package to library
library(lubridate)

# Seggregating the data of two days from the entire dataset
varclass <- c(rep('character',2),rep('numeric',7))
pwrconsumption <-read.table("household_power_consumption.txt",header=TRUE, sep = ";", na.strings = "?",colClasses=varclass)
pwrconsumption <- pwrconsumption[pwrconsumption$Date=="1/2/2007" | pwrconsumption$Date=="2/2/2007",]

# clean up the variable names and convert date/time fields
cols <-c('Date','Time','GlobalActivePower','GlobalReactivePower','Voltage','GlobalIntensity', 'SubMetering1','SubMetering2','SubMetering3')
colnames(pwrconsumption) <- cols
pwrconsumption$DateTime <- dmy(pwrconsumption$Date)+hms(pwrconsumption$Time)
pwrconsumption <- pwrconsumption[,c(10,3:9)]

###Plot Data####

# make 4 plots
par(mfrow=c(2,2))

# plot data on top left (1,1)
plot(pwrconsumption$DateTime, pwrconsumption$GlobalActivePower, ylab='Global Active Power', xlab='', type='l')

# plot data on top right (1,2)
plot(pwrconsumption$DateTime, pwrconsumption$Voltage, xlab='datetime', ylab='Voltage', type='l')

# plot data on bottom left (2,1)
plot(pwrconsumption$DateTime, pwrconsumption$SubMetering1, type='l', col= 'black', xlab='', ylab='Energy sub metering')
lines(pwrconsumption$DateTime, pwrconsumption$SubMetering2, col='red')
lines(pwrconsumption$DateTime, pwrconsumption$SubMetering3, col= 'blue')

# plot data on bottom right (2,2)
plot(pwrconsumption$DateTime,pwrconsumption$GlobalReactivePower, xlab='datetime', ylab='Global_reactive_power', type='l')


#Copy from screen to the file
dev.copy(png, file='plot4.png', width = 480, height = 480, units = 'px')

# Turn off device
dev.off()
