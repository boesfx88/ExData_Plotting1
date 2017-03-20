head <- read.csv("household_power_consumption.txt", nrow = 1)
name <- unlist(strsplit(names(head),"[.]"))
data <- read.csv("household_power_consumption.txt", skip = 66636, 
                 nrows = 2880, sep=";", colClasses = "character")
names(data) <- name

start <- as.numeric(strptime(paste(data[1,1],data[1,2],sep=" ")
                             ,"%d/%m/%Y %H:%M:%S"))
data[,3] <- as.numeric(data[,3])

data$sec <- apply(data,1, (function(row)
  (as.numeric(strptime(paste(row[1],row[2],sep=" "),"%d/%m/%Y %H:%M:%S"))
  -start)/86400))

png("plot2.png",width=480,height=480,units="px",bg="transparent")

plot(data$sec,data$Global_active_power,type="l"
     ,ylab="Global Active Power (kilowatts)",xaxt='n',xlab="")

axis(1, at=0:2, labels=c("Thu","Fri","Sat"))

dev.off()
