head <- read.csv("household_power_consumption.txt", nrow = 1)
name <- unlist(strsplit(names(head),"[.]"))
data <- read.csv("household_power_consumption.txt", skip = 66636, 
                nrows = 2880, sep=";", colClasses = "character")
names(data) <- name

data[,3] <- as.numeric(data[,3])

png("plot1.png",width=480,height=480,units="px",bg="transparent")
colors = rep("red",12)
hist(data$Global_active_power,col=colors,main="Global Active Power"
    ,xlab="Global Active Power (kilowatts)")
dev.off()