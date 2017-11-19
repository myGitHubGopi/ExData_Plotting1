myDataFile <- "./data/household_power_consumption.txt"
#Read the Data table
myData <- read.table(myDataFile,header = TRUE,sep=";", stringsAsFactors=FALSE, na.strings="?", dec=".")
#Subset the Data based on the date
mySubsetData <- subset (myData, Date %in% c("1/2/2007", "2/2/2007"))
mySubsetData$Date <- as.Date(mySubsetData$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(mySubsetData$Date), mySubsetData$Time)
mySubsetData$Datetime <- as.POSIXct(datetime)
#Plot 
with(mySubsetData, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})
#Convert into PNG
dev.copy(png, file="plot2.png", height=480, width=600)
dev.off()
