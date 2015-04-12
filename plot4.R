#This file is to generate plot 2 from project 1 of the Exploratory Data Analysis course to .png file

#Read in the power consumption data, ? == NA, as.is = T to keep time variables as character variables
power <- read.table("household_power_consumption.txt", header = T, sep = ";", as.is = T, na.strings = "?")

#Convert the date and time columns
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
power_days <- subset(power,Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
#as.Date(power_days$Date, format = "%a")

#Have to convert the time variable
timestamp <- strptime(paste(power_days$Date,power_days$Time), "%Y-%m-%d %H:%M:%S")

#Opening the png graphics device and setting the width and height of the graph
png(filename = "plot4.png",width = 480, height = 480)

#Settings for layout of plots 
par(mfrow = (c(2,2)))

plot(x = timestamp, y = power_days$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(x = timestamp, y = power_days$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")


#Plotting a line graph of Global Active Power
plot(x = timestamp, y = power_days$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub meeting")
lines(x = timestamp, y = power_days$Sub_metering_2, type = "l", col = "blue")
lines(x = timestamp, y = power_days$Sub_metering_3, type = "l", col = "red")
legend(x ="topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), lwd = c(2.5,2.5,2.5), col = c("black", "blue", "red"), bty = "n")

plot(x = timestamp, y = power_days$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")


#Turning off the graphics device
dev.off()