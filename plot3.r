#Downloading file procedures

setwd("/Users/yannilboudo/Desktop/Coding/Coursera_Class/Explo_Data_Analysis/")
fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if(!file.exists("data")) {dir.create("data")}
temp<-tempfile()
download.file(fileUrl, temp, method = "curl")

dataDownloaded <-date()

#Unzipping the file
data <- read.table(unz(temp, "household_power_consumption.txt"))
unlink(temp)

#Read downloaded data
data_clean<-read.table("household_power_consumption.txt", sep=";", na.strings = "?", header = TRUE)

#Select important data to look at
data_subset<-data_clean[data_clean$Date =="1/2/2007" | data_clean$Date =="2/2/2007",]

#Making the plot
png(filename = "plot3.png",width = 480, height = 480)
with(data_subset, {
  plot(data_subset$Sub_metering_1,type="l", xaxt="n", xlab="", ylab="Energy sub metering")
  lines(x=data_subset$Sub_metering_2, col="red")
  lines(x=data_subset$Sub_metering_3, col="blue")
})legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3") )

axis(1, at=c(1, as.integer(nrow(data_subset)/2), nrow(data_subset)), labels=c("Thu", "Fri", "Sat"))
dev.off()