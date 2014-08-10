## R script to generate plot 3

data <- read.table(unz("exdata-data-household_power_consumption.zip", "household_power_consumption.txt"), header=T, quote="\"", sep=";", na.strings = "?")

data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S") 
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

dataN <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

## Plot 
par(mfrow=c(1,1))

plot(dataN$DateTime, dataN$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(dataN$DateTime, dataN$Sub_metering_1, col=1)
lines(dataN$DateTime, dataN$Sub_metering_2, col=2)
lines(dataN$DateTime, dataN$Sub_metering_3, col=4)
legend("topright", col=c(1,2,4), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=c(1,1,1))

dev.copy(png,file="plot3.png")
dev.off()

