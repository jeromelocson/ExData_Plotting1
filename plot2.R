## Reading the dataset
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
## Coverting Date variables to class type
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
## Subsetting the data
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
## Converting dates and times
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
data$datetime <- as.POSIXct(data$datetime)
## Plotting graph 2
plot(data$Global_active_power~data$datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
## Save file to PNG
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()