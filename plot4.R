# set working directory to the one with the data file
setwd("C:/Users/jfrie001/Documents/coursera/exploratoryAnalysis")

# load the power data to a df
power<-read.table("./household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",stringsAsFactors=FALSE)

#create concatenated dateTime attribute
dt<-paste(power$Date,power$Time)
power$dateTime<-strptime(dt, "%d/%m/%Y %H:%M:%S")

#convert Date to Date class
power$Date<-as.Date(power$Date,format="%d/%m/%Y")

# filter data for the two days to be graphed
sub_power<-subset(power,subset=(Date>="2007-02-01" & Date <= "2007-02-02"))

# set up for 2 rows and 2 cols of graphs.  Populate graphs by row
par(mfrow = c(2,2))

# plot the four graphs
plot(sub_power$dateTime,sub_power$Global_active_power,type="l",ylab="Global Active Power",xlab="")
plot(sub_power$dateTime,sub_power$Voltage,type="l",ylab="Voltage",xlab="datetime")
plot(sub_power$dateTime,sub_power$Sub_metering_1,type="l",ylab="Global Active Power (kilowatts)",xlab="")
        #add plot lines for the second and third sub metering
        lines(sub_power$dateTime,sub_power$Sub_metering_2,col="red")
        lines(sub_power$dateTime,sub_power$Sub_metering_3,col="blue")
        # create the legend for sub metering
        legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(sub_power$dateTime,sub_power$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="")    

#copy the graph to a file
dev.copy(png,file="plot4.png",width=480,height=480)
dev.off()