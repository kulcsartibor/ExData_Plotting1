library(dplyr)
data <- read.csv("household_power_consumption.txt", sep = ";")
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
png("plot3.png",width = 480, height = 480)
plot(data$Datetime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Easy sub metering")
lines(data$Datetime, data$Sub_metering_2, col="red") 
lines(data$Datetime, data$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
dev.off()
