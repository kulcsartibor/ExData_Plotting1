library(dplyr)
data <- read.csv("household_power_consumption.txt", sep = ";")
data$Datetime <- as.POSIXct(paste(data$Date, data$Time), format="%Y/%m/%d %H:%M:%S")

data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_intensity <- as.numeric(data$Global_intensity)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)


data <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")


## Plot generation part
hist(data$Global_active_power, main = "Global active power", col = "red", xlab = "Global acrive power (kilowatts)", ylab = "Frequency")
dev.copy(png,filename="figure/plot1.png")
dev.off()
