library("sqldf", lib.loc="~/R/win-library/3.2")

rawData <- read.csv.sql("C:/Leo/HW/explore/proj1/ExData_Plotting1/data/household_power_consumption.txt", 
                        sql = "select * from file where Date = '1/2/2007' or  Date = '2/2/2007'"
                        , sep = ";")

dates = as.POSIXct(strptime(paste(rawData[,1], rawData[,2], sep=" "), format="%d/%m/%Y %H:%M:%S"))
data<-data.frame(dates,rawData[,3],rawData[,4],rawData[,5],rawData[,6],rawData[,7],rawData[,8],rawData[,9])

n<-names(rawData)
n2<-rbind(c("Date", n[-c(1,2)]))
names(data)<- n2

plot(data[,1], data[,2], main = "", xaxt = "n", xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
axis.POSIXct(1, at = data[, 1], format = "%A")
