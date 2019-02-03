setwd('g:/coursera/exdata')

##read data

fileName <- 'household_power_consumption.txt'
dataset<- read.table(fileName, header=TRUE, sep=';',na.strings='?')

## subset data for the required 2 dates and covert to date time classes
plotDataset <- dataset[dataset$Date %in% c("1/2/2007", "2/2/2007"),]
plotDataset[,"Date"] <- as.Date(plotDataset[,"Date"],' %d/%m/%y ')
plotDataset[,"Time"] <- strptime(plotDataset[, "Time"], "%H:%M:%S", tz = "GMT")

## Plot the graph and download a png file

globalActivePower <- as.numeric(plotDataset[,'Global_active_power'])

png("plot2.png", width=480, height=480)
plot(globalActivePower, type="l",xaxt="n",xlab="", ylab="Global Active Power (kilowatts)")
axis(1, at=c(1, as.integer(nrow(plotDataset)/2), nrow(plotDataset)), labels=c("Thu", "Fri", "Sat"))
dev.off()