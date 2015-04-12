#This file is to generate plot 1 from project 1 of the Exploratory Data Analysis course to .png file

#Read in the power consumption data, ? == NA, as.is = T to keep time variables as character variables
power <- read.table("household_power_consumption.txt", header = T, sep = ";", as.is = T, na.strings = "?")

#Convert the date and time columns
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
power_days <- subset(power,Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
#power$Time <- strptime(power$Time)

#Opening the png graphics device and setting the width and height of the graph
png(filename = "plot1.png",width = 480, height = 480)

#Plotting a histogram of the Global Active Power using the base graphics
hist(power_days$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", ylim = c(0,1200))

#Turning off the graphics device
dev.off()