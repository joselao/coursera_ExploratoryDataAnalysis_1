# My working directory (not execute)
#setwd("~/Documents/COURSERA_COURSES/Data Science [Especialization]/04-Exploratory Data analysis_Rscripts/week1")

# Reading data and filtering by date (with "READdata" function)
source("Course_project_1_ReadData.R")
cat("\nReading data...")
TABLE <- READdata(startDate="2007-02-01", endDate="2007-02-02")

### PLOTTING
# PLOT 1
png(filename = "plot1.png", width = 480, height = 480)
    title <- paste0("Global Active Power\n[",min(TABLE$Date, na.rm=TRUE)," to ",max(TABLE$Date, na.rm=TRUE),"]")
    H <- hist(TABLE$Global_active_power, col="red", main=title, xlab="Global Active Power (kW)")
    rug(TABLE$Global_active_power)
    
    MEDIAN <- median(TABLE$Global_active_power, na.rm=TRUE)
    abline(v=MEDIAN, col="blue", lwd=2)
    text(x=MEDIAN, y=max(H$counts), labels=paste0("median=",round(MEDIAN,2)), col="blue", cex=0.7)
dev.off()
cat("\nFinished.")