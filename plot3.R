# My working directory (not execute)
#setwd("~/Documents/COURSERA_COURSES/Data Science [Especialization]/04-Exploratory Data analysis_Rscripts/week1")

# Reading data and filtering by date (with "READdata" function)
source("Course_project_1_ReadData.R")
cat("\nReading data...")
TABLE <- READdata(startDate="2007-02-01", endDate="2007-02-02")

### PLOTTING
# PLOT 3
png(filename = "plot3.png", width = 480, height = 480)
    title <- paste0("Energy sub metering\n[",min(TABLE$Date, na.rm=TRUE)," to ",max(TABLE$Date, na.rm=TRUE),"]")
    plot(TABLE$DateTime, TABLE$Sub_metering_1, type="l", main=title, xlab="", ylab="Energy sub metering (Wh of active energy)")
    lines(TABLE$DateTime, TABLE$Sub_metering_2, col="red")
    lines(TABLE$DateTime, TABLE$Sub_metering_3, col="blue")
    legend("topright", col=c("black","red","blue"), lty=c(1,1,1), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
cat("\nFinished.")