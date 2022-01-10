# Exploratory Graphs
# ------------------
# Week 1: Project 1
# -----------------
# Antonio P. Peralta C.

# -------------------------------------
# Plot 1: Histogram Global Active Power
# -------------------------------------

# 1st) Read folder and dataset file (.txt format)
# -----------------------------------------------
datacons <- read.table(file = "data/housePowerCons.txt", sep = ";" , header = TRUE)


# 2nd) Change data type (chr) of column Date to data type (Date)
# --------------------------------------------------------------
datacons$Date <- as.Date(datacons$Date, format="%d/%m/%Y")


# 3rd) Subsetting and Create dataset with Date Range Specified: 1st/2nd Feb 2007
# ------------------------------------------------------------------------------
dataconsByDate <- subset(datacons, Date == "2007-02-01" | Date == "2007-02-02")
str(dataconsByDate)

# 4th) Converting Global_active_power column data type character to numeric 
# -------------------------------------------------------------------------
dataconsByDate$Global_active_power <- as.numeric(dataconsByDate$Global_active_power)


# 5th) Generate Plot1 with hist and arguments
# ------------------------------------------
# plot 1 x-axis: Global Active Power(kilowatt) / y-axis: Frecuency
hist(dataconsByDate$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)" , col = "red")
