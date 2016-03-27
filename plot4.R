# My working directory (not execute)
#setwd("~/Documents/COURSERA_COURSES/Data Science [Especialization]/04-Exploratory Data analysis_Rscripts/week1")

# Reading data and filtering by date (with "READdata" function)
source("Course_project_1_ReadData.R")
cat("\nReading data...")
TABLE <- READdata(startDate="2007-02-01", endDate="2007-02-02")

### PLOTTING
# PLOT 4
png(filename = "plot4.png", width = 480, height = 480)

    # setting multiplot 2 x 2 pictures on one plot
    par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
    title <- paste0("Household power consumption\n[",min(TABLE$Date, na.rm=TRUE)," to ",max(TABLE$Date, na.rm=TRUE),"]")

    # P1
    plot(TABLE$DateTime, TABLE$Global_active_power, type="l", xlab="", ylab="Global Active Power (kW)")

    # P2
    plot(TABLE$DateTime, TABLE$Voltage, type="l", xlab="", ylab="Voltage (V)")

    # P3
    plot(TABLE$DateTime, TABLE$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering (Wh of active energy)")
    lines(TABLE$DateTime, TABLE$Sub_metering_2, col="red")
    lines(TABLE$DateTime, TABLE$Sub_metering_3, col="blue")
    legend("topright", col=c("black","red","blue"), lty=c(1,1,1), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

    # P4
    plot(TABLE$DateTime, TABLE$Global_reactive_power, type="l", xlab="", ylab="Global Reactive Power (kW)")

    # Page title
    mtext(title, outer = TRUE, cex=0.9)
    
dev.off()
cat("\nFinished.")