
#get all data from zipped file  as object.size < 143MB
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
A=read.csv2(unz("household_power_consumption.zip","household_power_consumption.txt"),header=TRUE,dec=".",colClasses=c("myDate","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings=c("?",NA))

#subsetting
library("dplyr")
A=dplyr::filter(A,Date>="2007-02-01" & Date<="2007-02-02")

#setting time values
A$Time = strptime(paste(as.character(A$Date),A$Time),"%Y-%m-%d %H:%M:%S")

#plotting
png(file="plot3.png")
with(A, {plot(Time, Sub_metering_1, col="black",type="l", ylab= "Energy sub metering", xlab="")
         lines(Time, Sub_metering_2, col="red")
		 lines(Time, Sub_metering_3, col="blue")
		 })
legend("topright", col=c("black","red","blue"), lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
