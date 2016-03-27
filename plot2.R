# My working directory (not execute)
#setwd("~/Documents/COURSERA_COURSES/Data Science [Especialization]/04-Exploratory Data analysis_Rscripts/week1")

# Reading data and filtering by date (with "READdata" function)
source("Course_project_1_ReadData.R")
cat("\nReading data...")
TABLE <- READdata(startDate="2007-02-01", endDate="2007-02-02")

### PLOTTING
# PLOT 2
png(filename = "plot2.png", width = 480, height = 480)
    title <- paste0("Global Active Power\n[",min(TABLE$Date, na.rm=TRUE)," to ",max(TABLE$Date, na.rm=TRUE),"]")
    plot(TABLE$DateTime, TABLE$Global_active_power, type="l", main=title, xlab="", ylab="Global Active Power (kW)")
dev.off()
cat("\nFinished.")