#Plot 2 Global Active Power

input<-"./household_power_consumption.txt"
data<- read.table(input, header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE, dec=".")

#subset the data to extract just the information we are looking for between the 2 dates
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

gActivePower<-as.numeric(subSetData$Global_active_power)

#use paste and then striptime to get the datetime
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


plot(datetime, gActivePower,  xlab="", type="l", ylab="Global Active Power (kilowatts)")


dev.copy(png, file="plot2.png", height=480, width=480)


