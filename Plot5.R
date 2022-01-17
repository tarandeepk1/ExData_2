#download the file
library(downloader)
library(ggplot2)
library(plyr)
download("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", dest="dataset.zip", mode="wb") 
unzip ("dataset.zip", exdir = ".")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png(filename = "./Plot5.png", width = 480, height = 480, units = "px")

NEI1<-subset(NEI, fips == "24510")
s2<-subset(NEI1, NEI1$type=="ON-ROAD")
df<-sapply(split(s2$Emissions, s2$year), sum)
df2<-data.frame(names(df), df)
plot(df2$names.df., df2$df, type = "b", xlab="year", ylab="Total Emissions", main="Total PM 2.5 Emissions over the years by Motor Vehicles in Baltimore City")
dev.off()