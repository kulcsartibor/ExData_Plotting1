library(dplyr)
data <- read.table("household_power_consumption.txt", sep = ";", dec=".", stringsAsFactors=FALSE, header =  TRUE)
data$Datetime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_intensity <- as.numeric(data$Global_intensity)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)


data <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")


## Plot generation part
png("plot4.png",width = 480, height = 480)
par(mfrow=c(2,2))
plot(data$Datetime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power", pch = 1)
plot(data$Datetime, data$Voltage, type = "l", xlab = "datetime", ylab = "voltage", pch = 2)
plot(data$Datetime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Easy sub metering", pch = 3)
lines(data$Datetime, data$Sub_metering_2, col="red", pch = 3) 
lines(data$Datetime, data$Sub_metering_3, col="blue", pch = 3)
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, pch = 3)
plot(data$Datetime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global Rective Power", pch = 1)

dev.off()
