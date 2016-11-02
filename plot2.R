plot2 <- function(file){
  #loads the downloaded table as a whole
  loadtable <- read.table('data.txt', sep =";", header=TRUE)
  
  #date column is changed to the format as recommended
  loadtable$Date <- as.Date(loadtable$Date, "%d/%m/%Y")
  
  #change Global active power to numeric from factor
  loadtable$Global_active_power <- as.numeric(as.character(loadtable$Global_active_power))
  
  #get the data for the timeframe 2/1/07 to 2/2/07 into df
  df <- loadtable[(loadtable$Date=="2007-02-01"|loadtable$Date=="2007-02-02"),]
  
  #combine date and time
  df$datetime <- paste(df$Date, df$Time, sep=" ")
  df$datetime <- strptime(df$datetime, format="%Y-%m-%d %H:%M:%S")

  #plot is created
  plot(df$datetime, df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  
  #file is being created
  dev.copy(png, file="plot2.png", width=480, height=480)
  dev.off()
}