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

# plot the first sub metering
plot(sub_power$dateTime,sub_power$Sub_metering_1,type="l",ylab="Global Active Power (kilowatts)",xlab="")

#add plot lines for the second and third sub metering
lines(sub_power$dateTime,sub_power$Sub_metering_2,col="red")
lines(sub_power$dateTime,sub_power$Sub_metering_3,col="blue")

# create the legend
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
       
#copy the graph to a file
dev.copy(png,file="plot3.png",width=480,height=480)
dev.off()