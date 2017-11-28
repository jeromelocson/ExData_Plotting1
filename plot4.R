## Reading the dataset
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
## Coverting Date variables to class type
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
## Subsetting the data
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
## Converting dates and time
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
data$datetime <- as.POSIXct(data$datetime)
## Ploting graph 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
    plot(Global_active_power~data$datetime, type="l", 
         ylab="Global Active Power", xlab="")
    plot(Voltage~data$datetime, type="l", 
         ylab="Voltage", xlab="")
    plot(Sub_metering_1~data$datetime, type="l", 
         ylab="Enery sub metering", xlab="")
    lines(Sub_metering_2~data$datetime,col='Red')
    lines(Sub_metering_3~data$datetime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~data$datetime, type="l", 
         ylab="Global Rective Power",xlab="")
})

## Saving to PNG file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()