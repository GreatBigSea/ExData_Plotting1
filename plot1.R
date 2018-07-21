##Loading the data from the file
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.string = "?")

##Format the Date into the right format
data[,1] <-  as.Date(strptime(data[,1], "%d/%m/%Y"))

##Subset of the necessary data
data_extract <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

##Delete the unecessary data
rm(data)

##Open the File
png("plot1.png")

##Plot the data
hist(data_extract$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

##Close the file
dev.off()