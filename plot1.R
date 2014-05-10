# EXPLORATORY ANALYSIS
# PROJECT 1
# PLOT 1

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
# PLOT 1
#####################

hist(data$Global_active_power,xlab="Global Active Power (kilowatts)",
     main="Global Active Power",col="RED")
###########################
# save as png

dev.copy(png, file = "plot1.png", height=480, width=480, bg="transparent")
dev.off()
