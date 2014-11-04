# set working directory to the one with the data file
setwd("C:/Users/jfrie001/Documents/coursera/exploratoryAnalysis")

# load the power data to a df
power<-read.table("./household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",stringsAsFactors=FALSE)

#convert Date to Date class
power$Date<-as.Date(power$Date,format="%d/%m/%Y")

#create concatenated dateTime attribute
dt<-paste(as.Date(power$Date),power$Time)
power$dateTime<-as.POSIXct(dt)

# filter data for the two days to be graphed
sub_power<-subset(power,subset=(Date>="2007-02-01" & Date <= "2007-02-02"))

# plot the graph
hist(sub_power$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")

#copy the graph to a file
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()