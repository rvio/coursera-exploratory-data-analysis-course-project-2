#read the data
pm25 <- readRDS("Exploratory Data/Chapter 4/summarySCC_PM25.rds")

#create a dataframe consolidating the emmissions per year
aggpm25 <- aggregate(Emissions ~ year, data = pm25, FUN = sum)

#open a png file
png('Plot1.png')

#create the requested plot
barplot(aggpm25$Emissions,names.arg=aggpm25$year, xlab="years", col = "dark blue", main = "Change in emmissions in the USA")

#close the png file
dev.off()