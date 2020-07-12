FileDat <- "household_power_consumption.txt"
PowerData <- read.table(FileDat, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
SubsetDat <- PowerData[PowerData$Date %in% c("1/2/2007","2/2/2007") ,]

#str(SubsetDat)
GlobalActPower <- as.numeric(SubsetDat$Global_active_power)
TimeDat <- strptime(paste(SubsetDat$Date, SubsetDat$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
SubMet1 <- as.numeric(SubsetDat$Sub_metering_1)
SubMet2 <- as.numeric(SubsetDat$Sub_metering_2)
SubMet3 <- as.numeric(SubsetDat$Sub_metering_3)
GlobalReactPower <- as.numeric(SubsetDat$Global_reactive_power)
Volt <- as.numeric(SubsetDat$Voltage)

#plotting
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

plot(TimeDat, GlobalActPower, type="l", xlab="", ylab="Global Active Power")

plot(TimeDat, Volt, type="l", xlab="datetime", ylab="Voltage")

plot(TimeDat, SubMet1, type="l", xlab="", ylab="Energy sub metering")
lines(TimeDat, SubMet2, type="l", col="red")
lines(TimeDat, SubMet3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(TimeDat, GlobalReactPower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()