
library(data.table)
library(chron)
power <- fread("household_power_consumption.txt")
power_sub <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")
power_sub$Date <- as.Date(power_sub$Date, format = "%d/%m/%Y")
power_sub$Time <- chron(times = power_sub$Time)

power_sub$Global_active_power <- as.numeric(power_sub$Global_active_power)

hist(power_sub$Global_active_power, col = "red", xlab = "Global Active Power(Kilowatts)", main = "Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()
