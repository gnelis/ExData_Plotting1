##Get the data and transform dates and time columns

data<-read.table("Data/household_power_consumption.txt", sep = ';',header = TRUE, dec = '.', na.strings = '?')
data$Date<-as.Date(data$Date, format = '%d/%m/%Y')
data$Time<-strptime(data$Time, format = '%H:%M:%S')

##Get the two days we are interested in
two_days<- subset(data, Date %in% as.Date(c('2007-02-01','2007-02-02')))

##Plot histogram
png('plot1.png',width = 480, height = 480)
hist(as.numeric(two_days$Global_active_power), main = 'Global Active Power',
     xlab = 'Global Active Power (kilowatts)', col = 'red')
dev.off()