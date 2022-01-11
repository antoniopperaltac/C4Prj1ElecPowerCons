# Exploratory Graphs
# ------------------
# Week 1: Project 1
# -----------------
# Antonio P. Peralta C.

# -------------------------------------------------------------
# Plot 2: Global Active Power by Date Days (Thu-Fri-Sat)
# -------------------------------------------------------------

# 1st) Preparing the Data
# 1.1) Read folder and dataset file (.txt format)
# -----------------------------------------------
datacons <- read.table(file = "data/housePowerCons.txt", sep = ";" , header = TRUE)


# 1.2) Create new column joining Date and Time Column
# ----------------------------------------------
datacons$DateTime <- paste(datacons$Date, datacons$Time, sep = " ")


# 1.3) Change data type of column DateTime
# (chr) of column DateTime to data type Posixlt (DateTime)
# ----------------------------------------------------------------------
datacons$DateTime <- strptime(datacons$DateTime, 
                              format="%d/%m/%Y %H:%M:%S")

str(datacons)

datacons$Date <- as.Date(datacons$Date, format="%d/%m/%Y")

str(datacons)


# 1.4) Subsetting and Create dataset with Date Range Specified: 1st/2nd Feb 2007
# ------------------------------------------------------------------------------
dataByDate <- subset(datacons, Date == "2007-02-01" | Date == "2007-02-02")

str(dataByDate)

# 1.5) Change data type of column Global_active_power
# (chr) of column Global_active_power to data type numeric
# --------------------------------------------------------
dataByDate$Global_active_power <- as.numeric(
        dataByDate$Global_active_power,
        na.omit(dataByDate$Global_active_power)
)

str(dataByDate)


# 2nd) Create Plot2: 
# Global Active Power by Date Days (Thu-Fri-Sat)
# ----------------------------------------------
plot(dataByDate$DateTime, dataByDate$Global_active_power,
     type = "l",
     ylab = "Global Active Power(kilowatt)",
     xlab = " ")
