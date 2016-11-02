plot3 <- function(file){
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
  
  #change sub_metering to numeric from factor
  df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
  df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
  df$Sub_metering_3 <- as.numeric(df$Sub_metering_3)
  
  #plot is created
  plot(df$datetime, df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(df$datetime, df$Sub_metering_2, col="red")
  lines(df$datetime, df$Sub_metering_3, col="blue")
  
  #legend is created
  legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
  
  #file is created
  dev.copy(png, file="plot3.png", width=480, height=480)
  dev.off()
}