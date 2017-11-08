#read the data
pm25 <- readRDS("Exploratory Data/Chapter 4/summarySCC_PM25.rds")
cat <- readRDS("Exploratory Data/Chapter 4/Source_Classification_Code.rds")

#keep only coal related SCC
cat <- dplyr::filter(cat, grepl('Coal', SCC.Level.Three))
listcoal <- cat$SCC
coaldata <- subset(pm25, SCC %in% as.vector(cat$SCC))

#create a dataframe consolidating the emmissions per year
coalpm25 <- aggregate(Emissions ~ year, data = coaldata, FUN = sum)

#open a png file
png('Plot4.png')

#create the requested plot
qplot(y=Emissions,x=year, data = coalpm25)+geom_line()

#close the png file
dev.off()