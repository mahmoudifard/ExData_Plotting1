##I downloaded the file and renamed it to data.txt in my working directory
## then I read the data and put it into "plotassign"
plotassign<- read.table("data.txt",header = TRUE, sep = ";",na.strings="?")

## we need to subset the data into requred Date and time which was done as below
## and the result were saved into a new variable called "PlotData"

PlotData <- plotassign[plotassign$Date %in% c("1/2/2007","2/2/2007"),]
Timeframe<- strptime(paste(PlotData$Date, PlotData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
PlotData<- cbind(Timeframe, PlotData)

## then we simply called for the hist() function to draw the histogram for plot 1.
hist(PlotData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

