plot1 <- function(file) {
  #loads the downloaded table as a whole
  loadtable <- read.table('data.txt', sep =";", header=TRUE)
  
  #date column is changed to the format as recommended
  loadtable$Date <- as.Date(loadtable$Date, "%d/%m/%Y")
  
  #change Global active power to numeric from factor
  loadtable$Global_active_power <- as.numeric(as.character(loadtable$Global_active_power))
  
  #get the data for the timeframe 2/1/07 to 2/2/07 into df
  df <- loadtable[(loadtable$Date=="2007-02-01"|loadtable$Date=="2007-02-02"),]
  
  #create histogram
  hist(df$Global_active_power, main = paste("Global Active Power"), col ="red", xlab ="Global Active Power (kilowatts)")

  #file is created
  dev.copy(png, file="plot1.png", width=480, height=480)
  dev.off()
}