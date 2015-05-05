
#get all data after unziping code
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
A=read.csv2("household_power_consumption.txt",header=TRUE,dec=".",colClasses=c("myDate","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings=c("?",NA))
library("dplyr")
A=dplyr::filter(A,Date>="2007-02-01" & Date<="2007-02-02")
#plotting
png(file="plot4.png")
par(mfrow = c(2, 2))
with(A, {
plot(Time, Global_active_power, type="l", ylab= "Global Active Power (kilowatts)", xlab="")
plot(Time, Voltage, type="l", ylab= "Voltage", xlab="datetime")
{plot(Time, Sub_metering_1, col="black",type="l", ylab= "Energy sub metering", xlab="")
         lines(Time, Sub_metering_2, col="red")
		 lines(Time, Sub_metering_3, col="blue")
		 }
plot(Time, Global_reactive_power, type="l", ylab= "Global_Reactive_Power", xlab="datetime")
})
dev.off()
