#read the data
pm25 <- readRDS("Exploratory Data/Chapter 4/summarySCC_PM25.rds")
pm25 <- subset(pm25, fips == "24510")

#create a dataframe consolidating the emmissions per year
aggpm25 <- aggregate(Emissions ~ year + type, data = pm25, FUN = sum)

#open a png file
png('Plot3.png')

#create the requested plot
qplot(y=Emissions,x=year, data = aggpm25, col=factor(type))+geom_line()

#close the png file
dev.off()