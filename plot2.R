##Get the data and transform dates and time columns

data<-read.table("Data/household_power_consumption.txt", sep = ';',header = TRUE, dec = '.', na.strings = '?')

data$DateTime <- paste(data$Date,data$Time)
data$Date<-as.Date(data$Date, format = '%d/%m/%Y')
data$Time<-strptime(data$Time, format = '%H:%M:%S')
data$DateTime <- strptime(data$DateTime, format = '%d/%m/%Y %H:%M:%S')

##Get the two days we are interested in
two_days<- subset(data, Date %in% as.Date(c('2007-02-01','2007-02-02')))

png('plot2.png',width = 480, height = 480)
plot(two_days$DateTime,two_days$Global_active_power, type = 'l', xlab ="",
     ylab = 'Global Active Power (kilowatts)')
dev.off()