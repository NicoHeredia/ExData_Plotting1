FileDat <- "household_power_consumption.txt"
PowerData <- read.table(FileDat, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
SubsetDat <- PowerData[PowerData$Date %in% c("1/2/2007","2/2/2007") ,]

#str(SubsetDat)
GlobalActPower <- as.numeric(SubsetDat$Global_active_power)
TimeDat <- strptime(paste(SubsetDat$Date, SubsetDat$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#plotting
png("plot2.png", width=480, height=480)
plot(TimeDat, GlobalActPower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()