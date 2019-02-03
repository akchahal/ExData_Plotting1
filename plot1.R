setwd('g:/coursera/exdata')

##read data

fileName <- 'household_power_consumption.txt'
dataset<- read.table(fileName, header=TRUE, sep=';',na.strings='?')

## subset data for the required 2 dates and covert to date time classes
plotDataset <- dataset[dataset$Date %in% c("1/2/2007", "2/2/2007"),]
plotDataset[,"Date"] <- as.Date(plotDataset[,"Date"],' %d/%m/%y ')
plotDataset[,"Time"] <- strptime(plotDataset[, "Time"], "%H:%M:%S", tz = "GMT")

## Plot the grapgh and download a png file

globalActivePower <- as.numeric(plotDataset[,'Global_active_power'])

png("plot1.png", width=480, height=480)
hist(
  globalActivePower,
  main ="Global Active Power",
  xlab = "Global Active Power (kilowatts)",
  col = "red",
)

dev.off()