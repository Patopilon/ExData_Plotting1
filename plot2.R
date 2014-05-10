# EXPLORATORY ANALYSIS
# PROJECT 1
# PLOT 2

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
# PLOT 2
#####################

plot (data$dataTime,data$Global_active_power,
      type="l",
      xlab="",
      ylab="Global Active Power (kilowatts)",
      col="black",
      lwd=1)

###########################
# save as png

dev.copy(png, file = "plot2.png",height=480, width=480, bg="transparent")
dev.off() 
