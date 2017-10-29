hcdata <- read.table("./household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
hcdata$dt <- lubridate::dmy_hms(paste(hcdata$Date, hcdata$Time))
hcdata$Date <- lubridate::dmy(hcdata$Date)
hcdata$Time <- strptime(hcdata$Time, "%H:%M:%S")
hcdata$Time <- strftime(hcdata$Time, format="%H:%M:%S")
hcdata <- subset(hcdata, Date >= as.Date("2007-02-01"))
hcdata <- subset(hcdata, Date <= as.Date("2007-02-02"))

# Plot 3
par(mfrow = c(1,1), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
plot(hcdata$dt, hcdata$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(hcdata$dt, hcdata$Sub_metering_2, type = "l", col = "red")
lines(hcdata$dt, hcdata$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 2)

# Write plot to png file
png(filename="plot3.png")
plot(hcdata$dt, hcdata$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(hcdata$dt, hcdata$Sub_metering_2, type = "l", col = "red")
lines(hcdata$dt, hcdata$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 2)
dev.off()