READdata <- function(startDate=NULL, endDate=NULL){
    ## This function reads the "household_power_consumption.txt" and filter by arguments "startDate" and "endDate"
    ## startDate format: "YYYY-MM-DD" in character format
    ## endDate format: "YYYY-MM-DD" in character format
    
    ### GETTING DATA
    # reading data and adding Date and POSIXct class format
    TABLE <- read.delim("household_power_consumption.txt",header = TRUE, sep = ";")
    
    ### CLEANING DATA
    # assigning NA to missing data ("?")
    for(i in 1:NCOL(TABLE)) TABLE[,i] <- replace(TABLE[,i], TABLE[,i]=="?", NA)
    
    # converting numeric columns to numeric class data
    for(i in 3:9) TABLE[,i] <- as.numeric(as.character(TABLE[,i]))
    
    # adding class data and time to columns 
    TABLE$Date <- as.Date(strptime(TABLE$Date,"%d/%m/%Y"))
    TABLE$DateTime <- paste0(TABLE$Date," ",TABLE$Time)
    TABLE$DateTime <- as.POSIXct(strptime(TABLE$DateTime,"%Y-%m-%d %H:%M:%S"))
    
    # filtering rows from startDate to endDate
    if(is.null(startDate) == FALSE) {startDate <- as.Date(startDate); TABLE <- subset(TABLE, TABLE$Date >= startDate);}
    if(is.null(endDate) == FALSE) {endDate <- as.Date(endDate); TABLE <- subset(TABLE, TABLE$Date <= endDate);}
    
    # view & check data structure
    str(TABLE)
    summary(TABLE)
    #library(tabplot); tableplot(TABLE[,3:9]); # plotting all data profile

    return(TABLE)
}