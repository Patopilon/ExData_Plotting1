# EXPLORATORY ANALYSIS
# PROJECT 1
# PLOT 3

#setwd("~/PDIAZG/Coursera/SPECIALIZATION/EXPLORATORY_DATA/PROJECT1")

#######################################################
#  read the data first 
#######################################################
data<- read.table("household_power_consumption.txt",
                  skip = 66637, nrow = 2880, sep = ";", 
                  col.names = colnames(read.table(
                    "household_power_consumption.txt",
                    nrow = 1, header = TRUE, sep=";")))
########################################################
data$Date<-as.character(data$Date)
data$Time<-as.character(data$Time)

data$dataTime<-strptime(paste(data$Date,data$Time), format='%d/%m/%Y %H:%M:%S')

##################################################
# PLOT 3
#####################
plot (data$dataTime,data$Sub_metering_1,
      type="l",
      xlab="",
      ylab="Energy sub metering",
      col="black")
lines(data$dataTime,data$Sub_metering_2,col="red") 
lines(data$dataTime,data$Sub_metering_3,col="blue") 

legend("topright",
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1,y.intersp=0.5,
       col=c("black","red","blue"),cex=0.8) 

legend(data$dataTime[1850],50,lty=1,
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       y.intersp=0.5,
       col=c("black","red","blue"),cex=0.8) 

legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=1) 

###########################
# save as png

dev.copy(png, file = "plot3.png",height=504, width=504, bg="transparent")
dev.off()