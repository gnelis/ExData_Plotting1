##Get the data and transform dates and time columns

data<-read.table("Data/household_power_consumption.txt", sep = ';',header = TRUE, dec = '.', na.strings = '?')

data$DateTime <- paste(data$Date,data$Time)
data$Date<-as.Date(data$Date, format = '%d/%m/%Y')
data$Time<-strptime(data$Time, format = '%H:%M:%S')
data$DateTime <- strptime(data$DateTime, format = '%d/%m/%Y %H:%M:%S')

##Get the two days we are interested in
two_days<- subset(data, Date %in% as.Date(c('2007-02-01','2007-02-02')))



png('plot4.png',width = 480, height = 480)
par(mfcol=c(2,2))
plot(two_days$DateTime,two_days$Global_active_power, type = 'l', xlab ="",
     ylab = 'Global Active Power')

with(two_days,plot(DateTime,Sub_metering_1, col = 'black', type = 'l', xlab = "", ylab = "Energy sub metering"))
with(two_days,lines(DateTime,Sub_metering_2, col = 'red', type = 'l'))
with(two_days,lines(DateTime,Sub_metering_3, col = 'blue', type = 'l'))

legend("topright",legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), 
       col=c('black',"red", "blue"), lty=c(1,1,1),bty = "n")

plot(two_days$DateTime,two_days$Voltage, type = 'l', xlab ="datetime",
     ylab = 'Voltage')

plot(two_days$DateTime,two_days$Global_reactive_power, type = 'l', xlab ="datetime",
     ylab = 'Global_reactive_power')
dev.off()
