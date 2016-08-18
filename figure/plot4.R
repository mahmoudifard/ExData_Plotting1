##I downloaded the file and renamed it to data.txt in my working directory
## then I read the data and put it into "plotassign"
plotassign<- read.table("data.txt",header = TRUE, sep = ";",na.strings="?")

## we need to subset the data into requred Date and time which was done as below
## and the result were saved into a new variable called "PlotData"

PlotData <- plotassign[plotassign$Date %in% c("1/2/2007","2/2/2007"),]
Timeframe<- strptime(paste(PlotData$Date, PlotData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
PlotData<- cbind(Timeframe, PlotData)

##Generating the 3rd plot with plot() function

labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
columnlines <- c("black","red","blue")
par(mfrow=c(2,2))
plot(PlotData$Timeframe, PlotData$Global_active_power, type="l", col="green", xlab="", ylab="Global Active Power")
plot(PlotData$Timeframe, PlotData$Voltage, type="l", col="orange", xlab="datetime", ylab="Voltage")
plot(PlotData$Timeframe, PlotData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(PlotData$Timeframe, PlotData$Sub_metering_2, type="l", col="red")
lines(PlotData$Timeframe, PlotData$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=labels, lty=1, col=columnlines)
plot(PlotData$Timeframe, PlotData$Global_reactive_power, type="l", col="blue", xlab="datetime", ylab="Global_reactive_power")