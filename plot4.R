#Plot 4 Global Active Power

input<-"./household_power_consumption.txt"
data<- read.table(input, header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE, dec=".")

#subset the data to extract just the information we are looking for between the 2 dates
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

gActivePower<-as.numeric(subSetData$Global_active_power)
gReactivePower<-as.numeric(subSetData$Global_reactive_power)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
voltage <-as.numeric(subSetData$Voltage)

#get the 3 sub metering data

subMetering1<-as.numeric(subSetData$Sub_metering_1)
subMetering2<-as.numeric(subSetData$Sub_metering_2)
subMetering3<-as.numeric(subSetData$Sub_metering_3)

par(mfrow=c(2,2))

plot(datetime, gActivePower,  xlab="", type="l", ylab="Global Active Power")
plot(datetime, voltage,  xlab="", type="l", ylab="Voltage")
plot(datetime, subMetering1,  xlab="", type="l", ylab="Energy Submetering")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(datetime, gReactivePower, xlab="datetime", ylab="Global_reactive_power", type="l" )


dev.copy(png, file="plot4.png", height=480, width=480)
