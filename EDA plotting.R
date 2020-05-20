#importing the data set ()
complt =  read.csv("household_power_consumption.txt", sep = ';')

#obtaining a subset from dataset 'complt' using the date range from 1/2/2007 to 2/2/2007
data = subset(complt, complt$Date == '1/2/2007'|complt$Date == '2/2/2007')

#combained the varible data and time and created a seperate varible 
dateNtime = strptime(paste(data$Date,data$Time), '%d/%m/%Y %H:%M:%S')

#changed the charactor varibles into numeric
data$Global_reactive_power = as.numeric(data$Global_reactive_power)
data$Voltage = as.numeric(data$Voltage)
data$Global_intensity = as.numeric(data$Global_intensity)
data$Sub_metering_1 = as.numeric(data$Sub_metering_1)
data$Sub_metering_2 = as.numeric(data$Sub_metering_2)
data$Sub_metering_3 = as.numeric(data$Sub_metering_3)

#plot 1 - Global Active Power (kilowatts)
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (killowatts)", main = "Global Active power")

#plot2 
plot(dateNtime, data$Global_active_power, type = "n", ylab = "Global Active Power (killowatts", xlab = " ")
lines(dateNtime,data$Global_active_power, type = "l")

#plot3

plot(dateNtime, data$Sub_metering_1+data$Sub_metering_2+data$Sub_metering_3, type = "n", ylab = "Energy sub metering", xlab = " ")
lines(dateNtime,data$Sub_metering_1, type = "l")
lines(dateNtime,data$Sub_metering_2, type = "l", col = "red")
lines(dateNtime,data$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1), col = c("black","red","blue"))


#plot4

par(mfrow= c(2,2))
plot(dateNtime,data$Global_active_power, ylab = "Global Active Power", xlab = " ",type = "n")
lines(dateNtime,data$Global_active_power, type = "l")

plot(dateNtime,data$Voltage, ylab = "Voltage", xlab = "Datetime ",type = "n")
lines(dateNtime,data$Voltage, type = "l")

plot(dateNtime,data$Sub_metering_1+data$Sub_metering_2+data$Sub_metering_3, type = "n", ylab = "Energy sub metering", xlab = " ")
lines(dateNtime,data$Sub_metering_1, col = "black")
lines(dateNtime,data$Sub_metering_2, col = "red")
lines(dateNtime,data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = c(1,1,1), cex = 0.5)


plot(dateNtime,data$Global_reactive_power, type = "n", ylab = "Global_reactive_power", xlab = "datetime")
lines(dateNtime,data$Global_reactive_power, type =   "l")
