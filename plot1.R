## R script to generate  plot 1

data <- read.table(unz("exdata-data-household_power_consumption.zip", "household_power_consumption.txt"), header=T, quote="\"", sep=";", na.strings = "?")

data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S") 
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

dataN <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

## Plot 
par(mfrow=c(1,1))
hist(dataN$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col = 2)
dev.copy(png,file="plot1.png")
dev.off()
