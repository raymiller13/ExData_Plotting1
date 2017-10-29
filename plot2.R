hcdata <- read.table("./household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
hcdata$dt <- lubridate::dmy_hms(paste(hcdata$Date, hcdata$Time))
hcdata$Date <- lubridate::dmy(hcdata$Date)
hcdata$Time <- strptime(hcdata$Time, "%H:%M:%S")
hcdata$Time <- strftime(hcdata$Time, format="%H:%M:%S")
hcdata <- subset(hcdata, Date >= as.Date("2007-02-01"))
hcdata <- subset(hcdata, Date <= as.Date("2007-02-02"))

# Plot 2
par(mfrow = c(1,1), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
plot(hcdata$dt, hcdata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# Write plot to png file
png(filename="plot2.png")
plot(hcdata$dt, hcdata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()