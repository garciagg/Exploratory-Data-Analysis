##plot 4

##read data

bigdata <- read.table(file="household_power_consumption.txt", head=TRUE, sep=";", stringsAsFactors = FALSE)

##Convert columns to date and time format

strptime(bigdata$Time, format="%H:%M:%S", tz="")

##Pick only relevant dates

mydata <- subset(bigdata, Date == "1/2/2007" | Date == "2/2/2007")

##Create date time column

mydata$datetime <- strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %H:%M:%S")

##Open Device
png("plot4.png",480,480)

##set up plotting area
par(mfrow=c(2,2))

##make graph 1
plot(mydata$datetime, mydata$Global_active_power, type="s", xlab="", ylab="Global Active Power")

##make graph 2
plot(mydata$datetime, mydata$Voltage, xlab="datetime", ylab="Voltage", type="s")

##make graph 3
plot(mydata$datetime, mydata$Sub_metering_1, type="s", xlab="", ylab="Energy sub metering")
points(mydata$datetime, mydata$Sub_metering_2, col="red", type="s")
points(mydata$datetime, mydata$Sub_metering_3, col="blue", type="s")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

##make graph 4
plot(mydata$datetime, mydata$Global_reactive_power, xlab="datetime", ylab="Global Reactive Power", type="s")

##Close Device
dev.off()