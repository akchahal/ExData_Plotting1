setwd('g:/coursera/exdata')

##read data

fileName <- 'household_power_consumption.txt'
dataset<- read.table(fileName, header=TRUE, sep=';',na.strings='?')

## subset data for the required 2 dates and covert to date time classes
plotDataset <- dataset[dataset$Date %in% c("1/2/2007", "2/2/2007"),]
datetime <- strptime(paste(plotDataset$Date, plotDataset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


## convert to numeric columns
numericFields <- c("Global_active_power","Global_reactive_power","Voltage",
                   "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
for (fieldName in numericFields) {
  plotDataset[, fieldName] <- as.numeric(plotDataset[, fieldName])
}

## Plot the graph and download a png file
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
## plot 1
plot(datetime,plotDataset[, "Global_active_power"],type = "l", main ="", xlab = "",ylab = "Global Active Power",)
## plot 2
plot(datetime, plotDataset[, "Voltage"],type = "l", main = "",ylab = "Voltage",)
## plot 3
plot(datetime, plotDataset[, "Sub_metering_1"],type = "l", main = "",xlab = "",ylab = "Energy sub metering",)
lines(datetime, plotDataset[, "Sub_metering_2"], col = "red")
lines(datetime, plotDataset[, "Sub_metering_3"], col = "blue")
legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col = c("black", "red", "blue"),  lty = 1,  bty = "n",)
## plot 4
plot( datetime,  plotDataset[, "Global_reactive_power"],  type = "l",  main = "",  ylab = "Global_reactive_power",)

dev.off()