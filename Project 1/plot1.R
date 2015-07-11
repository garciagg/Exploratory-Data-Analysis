##plot 1

##read data

bigdata <- read.table(file="household_power_consumption.txt", head=TRUE, sep=";", stringsAsFactors = FALSE)

##Convert columns to date and time format

strptime(bigdata$Time, format="%H:%M:%S", tz="")

##Pick only relevant dates

mydata <- subset(bigdata, Date == "1/2/2007" | Date == "2/2/2007")

##Open Device
png("plot1.png",480,480)

##make histogram

hist(as.numeric(mydata$Global_active_power), col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

##Close Device
dev.off()