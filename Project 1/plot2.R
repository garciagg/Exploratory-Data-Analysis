##plot 1

##read data

bigdata <- read.table(file="household_power_consumption.txt", head=TRUE, sep=";", stringsAsFactors = FALSE)

##Convert columns to date and time format

strptime(bigdata$Time, format="%H:%M:%S", tz="")

##Pick only relevant dates

mydata <- subset(bigdata, Date == "1/2/2007" | Date == "2/2/2007")

##Create date time column

mydata$datetime <- strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %H:%M:%S")

##Open Device
png("plot2.png",480,480)

##make graph
plot(mydata$datetime, mydata$Global_active_power, type="s", xlab="", ylab="Global Active Power (kilowatts)")


##Close Device
dev.off()