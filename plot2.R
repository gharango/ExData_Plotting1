
#get all data after unziping code
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
A=read.csv2(unz("household_power_consumption.zip","household_power_consumption.txt"),header=TRUE,dec=".",colClasses=c("myDate","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings=c("?",NA))
library("dplyr")
A=dplyr::filter(A,Date>="2007-02-01" & Date<="2007-02-02")
png(file="plot2.png")
with(A, plot(Time, Global_active_power, type="l", ylab= "Global Active Power (kilowatts)", xlab=""))
dev.off()
