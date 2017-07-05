##Auto -- Positioning
auto1 = read.csv(file = "auto.csv", header = TRUE)

auto<- as.data.frame(auto1)
# Assign brand  as rownames for labels
rownames(auto) <- auto$Brand_Name

devtools::use_data(auto, compress = "xz")


######Airbnb
ny_airbnb <- read.csv("NYC_Airbnb.csv", header=TRUE)


## Renaming misspelled column
names(ny_airbnb)[names(ny_airbnb) == "X..of.Startbucks"] = "X..of.Starbucks"

## Converting to Numeric
ny_airbnb$price = as.numeric(gsub("\\$", "", ny_airbnb$price))
ny_airbnb$extra_people = as.numeric(gsub("\\$", "", ny_airbnb$extra_people))


devtools::use_data(ny_airbnb, compress = "xz")

#####Soup
soup <- read.csv("soup_new.csv", header=TRUE, sep=",")
soup_store <- read.csv("soup_store_demo.csv", header=TRUE, sep=",")

soup$Date<-as.Date(soup$Date, "%m/%d/%Y" )

# Merge with "soup" file
soup <- merge(soup, store_demo, by="IRI_KEY")

devtools::use_data(soup, compress = "xz")
devtools::use_data(soup_store, compress = "xz")

#####Zillow
z1 <- read_excel("zillow_metro.xlsx")
sqft<- gather(z1, time, value, -c(RegionID, RegionName, State, SizeRank))
sqft$time <- as.Date(paste(sqft$time,"-01",sep=""))

devtools::use_data(sqft, compress = "xz")
