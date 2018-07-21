##Loading the data from the file
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.string = "?")

##Format the Date into the right format
data[,1] <-  as.Date(strptime(data[,1], "%d/%m/%Y"))

##Subset of the necessary data
data_extract <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

##Join Date and Time to one column and covert it to the right format
data_extract$Date <- as.POSIXct(strptime(paste(data_extract[,1], data_extract[,2]), "%Y-%m-%d %H:%M:%S"))

##Delete the unecessary data
rm(data)

##Open the File
png("plot4.png")

##Set the arrangemente
par(mfrow = c(2,2))

##Plot 1
with(data_extract, plot(Date, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

##Plot 2
with(data_extract, plot(Date, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

##Plot 3
with(data_extract, plot(Date, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
with(data_extract, lines(Date, Sub_metering_1, type = "l", col = "black"))
with(data_extract, lines(Date, Sub_metering_2, type = "l", col = "red"))
with(data_extract, lines(Date, Sub_metering_3, type = "l", col = "blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

##Plot 2
with(data_extract, plot(Date, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))

##Close the file
dev.off()
