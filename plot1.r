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
data_subset$DateTime <- strptime(paste(as.character(data_subset$Date), data_subset$Time), format = "%Y-%m-%d %H:%M:%S")
png(filename = "plot1.png",width = 480, height = 480)
hist(data_subset$Global_active_power,  col ="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()