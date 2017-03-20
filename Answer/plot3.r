head <- read.csv("household_power_consumption.txt", nrow = 1)
name <- unlist(strsplit(names(head),"[.]"))
data <- read.csv("household_power_consumption.txt", skip = 66636, 
                 nrows = 2880, sep=";", colClasses = "character")
names(data) <- name

start <- as.numeric(strptime(paste(data[1,1],data[1,2],sep=" ")
                             ,"%d/%m/%Y %H:%M:%S"))
data[,7] <- as.numeric(data[,7])
data[,8] <- as.numeric(data[,8])
data[,9] <- as.numeric(data[,9])
data$sec <- apply(data,1, (function(row)
  (as.numeric(strptime(paste(row[1],row[2],sep=" "),"%d/%m/%Y %H:%M:%S"))
   -start)/86400))

png("plot3.png",width=480,height=480,units="px",bg="transparent")

plot(data$sec,data$Sub_metering_1,type="l",ylab="Energy sub metering"
     ,xaxt='n',xlab="",col="black")
lines(data$sec,data$Sub_metering_2,type="l",ylab="Energy sub metering"
     ,xaxt='n',xlab="",col="red")
lines(data$sec,data$Sub_metering_3,type="l",ylab="Energy sub metering"
     ,xaxt='n',xlab="",col="blue")

axis(1, at=0:2, labels=c("Thu","Fri","Sat"))

legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       , col = c("black", "red", "blue"), lty = c(1,1,1))

dev.off()
