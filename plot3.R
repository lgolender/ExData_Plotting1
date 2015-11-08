library("sqldf", lib.loc="~/R/win-library/3.2")

rawData <- read.csv.sql("C:/Leo/HW/explore/proj1/ExData_Plotting1/data/household_power_consumption.txt", 
                        sql = "select * from file where Date = '1/2/2007' or  Date = '2/2/2007'"
                        , sep = ";")

dates = as.POSIXct(strptime(paste(rawData[,1], rawData[,2], sep=" "), format="%d/%m/%Y %H:%M:%S"))
data<-data.frame(dates,rawData[,3],rawData[,4],rawData[,5],rawData[,6],rawData[,7],rawData[,8],rawData[,9])

n<-names(rawData)
n2<-rbind(c("Date", n[-c(1,2)]))
names(data)<- n2

plot(data[,1], data[,6], type="l", ylab="Energy Submetering", xlab="")
lines(data[,1], data[,7], type="l", col="red")
lines(data[,1], data[,8], type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
axis.POSIXct(1, at = data[, 1], format = "%A")

