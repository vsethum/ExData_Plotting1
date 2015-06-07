#Plot 1 Global Active Power

input<-"./household_power_consumption.txt"
data<- read.table(input, header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE, dec=".")

#subset the data to extract just the information we are looking for between the 2 dates
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

gActivePower<-as.numeric(subSetData$Global_active_power)

hist(gActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.copy(png, file="plot1.png", height=480, width=480)


