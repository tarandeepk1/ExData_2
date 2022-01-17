#download the file
library(downloader)
download("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", dest="dataset.zip", mode="wb") 
unzip ("dataset.zip", exdir = ".")
NEI <- readRDS("summarySCC_PM25.rds")

png(filename = "./Plot2.png", width = 480, height = 480, units = "px")
NEI1<-subset(NEI, fips == "24510")
df<-sapply(split(NEI1$Emissions, NEI1$year), sum)
df2<-data.frame(names(df), df)
plot(df2$names.df., df2$df, type = "b", xlab="year", ylab="Total Emissions", main="Total PM 2.5 Emissions over the years in Baltimore City")
dev.off()