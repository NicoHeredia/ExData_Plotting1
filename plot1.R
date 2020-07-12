FileDat <- "household_power_consumption.txt"
PowerData <- read.table(FileDat, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
SubsetDat <- PowerData[PowerData$Date %in% c("1/2/2007","2/2/2007") ,]

#str(SubsetDat)
GlobalActPower <- as.numeric(SubsetDat$Global_active_power)

#plotting
png("plot1.png", width=480, height=480)
hist(GlobalActPower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()