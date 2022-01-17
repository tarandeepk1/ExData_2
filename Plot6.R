#download the file
library(downloader)
library(ggplot2)
library(plyr)
download("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", dest="dataset.zip", mode="wb") 
unzip ("dataset.zip", exdir = ".")
NEI <- readRDS("summarySCC_PM25.rds")

png(filename = "./Plot6.png", width = 480, height = 480, units = "px")
NEI_Bal<-subset(NEI, fips == "24510")
NEI_LA<-subset(NEI,fips == "06037")
BData <- ddply(NEI_Bal, .(year), summarize, TotalEmissions= sum(Emissions))
LData <- ddply(NEI_LA, .(year), summarize, TotalEmissions= sum(Emissions))
BData$County<-"Baltimore"
LData$County<-"Los Angeles"
Data<-rbind(BData, LData)
g<-ggplot(Data, aes(year, TotalEmissions))
p<-g+geom_point(aes(color=County))+geom_line(aes(color=County))
print(p)
dev.off()