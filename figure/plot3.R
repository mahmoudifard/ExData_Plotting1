##I downloaded the file and renamed it to data.txt in my working directory
## then I read the data and put it into "plotassign"
plotassign<- read.table("data.txt",header = TRUE, sep = ";",na.strings="?")

## we need to subset the data into requred Date and time which was done as below
## and the result were saved into a new variable called "PlotData"

PlotData <- plotassign[plotassign$Date %in% c("1/2/2007","2/2/2007"),]
Timeframe<- strptime(paste(PlotData$Date, PlotData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
PlotData<- cbind(Timeframe, PlotData)

##Generating the 3rd plot with plot() function

columnlines <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(PlotData$Timeframe, PlotData$Sub_metering_1, type="l", col=columnlines[1], xlab="", ylab="Energy sub metering")
lines(PlotData$Timeframe, PlotData$Sub_metering_2, col=columnlines[2])
lines(PlotData$Timeframe, PlotData$Sub_metering_3, col=columnlines[3])
legend("topright", legend=labels, col=columnlines, lty="solid")