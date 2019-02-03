setwd('g:/coursera/exdata')

##read data

fileName <- 'household_power_consumption.txt'
dataset<- read.table(fileName, header=TRUE, sep=';',na.strings='?')

## subset data for the required 2 dates and covert to date time classes
plotDataset <- dataset[dataset$Date %in% c("1/2/2007", "2/2/2007"),]
datetime <- strptime(paste(plotDataset$Date, plotDataset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## convert required coluns to numeric

globalActivePower <- as.numeric(plotDataset[,'Global_active_power'])
subMetering1 <- as.numeric(plotDataset[,'Sub_metering_1'])
subMetering2 <- as.numeric(plotDataset[,'Sub_metering_2'])
subMetering3 <- as.numeric(plotDataset[,'Sub_metering_3'])

## Plot the graph and download a png file

png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()