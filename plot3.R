FileDat <- "household_power_consumption.txt"
PowerData <- read.table(FileDat, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
SubsetDat <- PowerData[PowerData$Date %in% c("1/2/2007","2/2/2007") ,]

#str(SubsetDat)
TimeDat <- strptime(paste(SubsetDat$Date, SubsetDat$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
SubMet1 <- as.numeric(SubsetDat$Sub_metering_1)
SubMet2 <- as.numeric(SubsetDat$Sub_metering_2)
SubMet3 <- as.numeric(SubsetDat$Sub_metering_3)

#plotting
png("plot3.png", width=480, height=480)
plot(TimeDat, SubMet1, type="l", xlab="", ylab="Energy sub metering")
lines(TimeDat, SubMet2, type="l", col="red")
lines(TimeDat, SubMet3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()