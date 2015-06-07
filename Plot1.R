#Read in data assuming appropriate file is in the working directory
df <- read.table('household_power_consumption.txt', header=TRUE, sep=';', na.strings='?', colClasses=c(rep('character', 2), rep('numeric', 7)))

#Adjust the Date and Time columns to be formatted in the Date and POSIXlt formats respectively
df$Date <- as.Date(df$Date , "%d/%m/%Y")
df$Time <- paste(df$Date, df$Time, sep=" ")
df$Time <- strptime(df$Time, "%Y-%m-%d %H:%M:%S")

#Create a subset of the data structure to only include two days, 2007/02/01 and 2007/02/01
df.sub <- subset(df, Time$year==107 & Time$mon==1 & (Time$mday==1 | Time$mday==2) )

#Different way of creating the same subset
startDate <- as.Date("2007-02-01")
stopDate <- as.Date("2007-02-02")
df.sub2 <- df[df$Date >= startDate & df$Date <=stopDate,]
  
#Plot a histogram of the Global Active power data and save as a png
png("plot1.png", width = 480, height = 480)
hist(df.sub$Global_active_power, main = "Global Active power", col = "red", xlab = "Global Active Power (kilowatts)", )
dev.off()