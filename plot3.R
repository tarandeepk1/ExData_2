#download the file
library(downloader)
library(ggplot2)
library(plyr)
download("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", dest="dataset.zip", mode="wb") 
unzip ("dataset.zip", exdir = ".")
NEI <- readRDS("summarySCC_PM25.rds")

png(filename = "./Plot3.png", width = 480, height = 480, units = "px")
NEI1<-subset(NEI, fips == "24510")
BData <- ddply(NEI1, .(type, year), summarize, TotalEmissions = sum(Emissions))

g<-ggplot(BData, aes(year, TotalEmissions))
p<-g+geom_point(aes(color=type))+geom_line(aes(color=type))
print(p)
dev.off()