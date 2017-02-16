library(data.table)
library(tidyr)

power <- fread("household_power_consumption.txt")
power_sub <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")

power_sub <- as.data.frame(power_sub)
power_sub <- unite(power_sub, Date_Time, Date, Time, sep = " ")
power_sub$Global_active_power <- as.numeric(power_sub$Global_active_power)

power_sub$Date_Time <- strptime(power_sub$Date_Time, format ="%e/%m/%Y %H:%M:%S")

plot(power_sub$Date_Time, power_sub$Global_active_power, type = "l", xlab = '', ylab = 'Global Active Power (kilowatts)')
dev.copy(png, file = "plot2.png")
dev.off()
