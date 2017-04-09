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
png("plot2.png",width = 480, height = 480)
plot(data$Datetime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active power (kilowatts)")
dev.off()
