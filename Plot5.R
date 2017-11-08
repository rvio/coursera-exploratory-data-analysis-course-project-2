#read the data
pm25 <- readRDS("Exploratory Data/Chapter 4/summarySCC_PM25.rds")
cat <- readRDS("Exploratory Data/Chapter 4/Source_Classification_Code.rds")

#sort with Baltimore
pm25 <- subset(pm25, fips == "24510")

#keep only vehicules related SCC
cat <- dplyr::filter(cat, grepl('Vehicles', SCC.Level.Two))
vehdata <- subset(pm25, SCC %in% as.vector(cat$SCC))

#create a dataframe consolidating the emmissions per year
vehpm25 <- aggregate(Emissions ~ year, data = vehdata, FUN = sum)

#open a png file
png('Plot5.png')

#create the requested plot
qplot(y=Emissions,x=year, data = vehpm25)+geom_line()

#close the png file
dev.off()