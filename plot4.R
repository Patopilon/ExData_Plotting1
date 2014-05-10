# EXPLORATORY ANALYSIS
# PROJECT 1
# PLOT 4

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
# PLOT 4
#####################

par(mfrow=c(2,2))

# graf 1

plot (data$dataTime,data$Global_active_power,
      type="l",
      xlab="",
      ylab="Global Active Power",
      col="black",
      lwd=1)

# graf 2

plot (data$dataTime,data$Voltage,
      type="l",
      xlab="datetime",
      ylab="Voltage",
      col="black",
      lwd=1)

# graf 3

plot (data$dataTime,data$Sub_metering_1,
      type="l",
      xlab="",
      ylab="Energy sub metering",
      col="black",
      lwd=1,axes=T)
lines(data$dataTime,data$Sub_metering_2,col="red",lwd=1.5) 
lines(data$dataTime,data$Sub_metering_3,col="blue",lwd=1.5) 

legend(data$dataTime[500],50, lty=c(1,1,1),
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lwd=c(2,2,2),
       col=c("black","red","blue"),
       y.intersp=0.2, 
       bty="n") 

#graf 4

plot (data$dataTime,data$Global_reactive_power,
      type="l",
      xlab="datetime",
      ylab="Global_reactive_power",
      col="black",
      lwd=1)

###########################
# save as png

dev.copy(png, file = "plot4.png",height=480, width=480,  bg="transparent")
dev.off() 

