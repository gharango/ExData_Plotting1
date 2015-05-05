
#get all data after unziping code
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
A=read.csv2("household_power_consumption.txt",header=TRUE,dec=".",colClasses=c("myDate","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings=c("?",NA))

library("dplyr")

A=dplyr::filter(A,Date>="2007-02-01" & Date<="2007-02-02")

png(file="plot1.png")
hist(A$Global_active_power,col="red", main="Global Active Power", xlab= "Global Active Power (kilowatts)", ylim=c(0,1200))
dev.off()
