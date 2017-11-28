## Reading the dataset
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
## Coverting Date variables to class type
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
## Subsetting the data
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
## Converting dates and time
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
data$datetime <- as.POSIXct(data$datetime)
## Plot 3
with(data, {
    plot(Sub_metering_1~data$datetime, type="l", ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~data$datetime,col='Red')
    lines(Sub_metering_3~data$datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
## Saving to PNG file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()