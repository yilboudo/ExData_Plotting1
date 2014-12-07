#Downloading file procedure

setwd("/Users/yannilboudo/Desktop/Coursera_Class/Exploratory_Data_Analysis/")
fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if(!file.exists("data")) {dir.create("data")}
temp<-tempfile()
download.file(fileUrl, temp, method = "curl")

dataDownloaded <-date()
#Unzip the file
data <- read.table(unz(temp, "household_power_consumption.txt"))
unlink(temp)

#Read downloaded data
data_clean<-read.table("household_power_consumption.txt", sep=";", na.strings = "?", header = TRUE)

#Select important data to look at
data_subset<-data_clean[data_clean$Date =="1/2/2007" | data_clean$Date =="2/2/2007",]

#Making the plot

png(filename = "plot2.png",width = 480, height = 480)
plot(data_subset$Global_active_power, type="l",xaxt="n",xlab="", ylab="Global Active Power (kilowatts)")
axis(1, at=c(1, as.integer(nrow(data_subset)/2), nrow(data_subset)), labels=c("Thu", "Fri", "Sat"))
dev.off()