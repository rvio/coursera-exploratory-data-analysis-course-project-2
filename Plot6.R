#read the data
pm25 <- readRDS("Exploratory Data/Chapter 4/summarySCC_PM25.rds")
cat <- readRDS("Exploratory Data/Chapter 4/Source_Classification_Code.rds")

#sort with Baltimore and Los Angeles
pm25 <- subset(pm25, fips == c("24510","06037"))

#keep only vehicules related SCC
cat <- dplyr::filter(cat, grepl('Vehicles', SCC.Level.Two))
vehdata <- subset(pm25, SCC %in% as.vector(cat$SCC))
vehdata[vehdata == "24510"] <- "Baltimore"
vehdata[vehdata == "06037"] <- "Los Angeles"

#create a dataframe consolidating the emmissions per year
vehpm25 <- aggregate(Emissions ~ fips , data = vehdata, FUN = sum)

#open a png file
png('Plot6.png')

#create the requested plot
qplot(y=Emissions,x=fips, data = vehpm25)

#close the png file
dev.off()