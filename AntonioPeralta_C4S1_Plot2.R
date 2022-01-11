# Exploratory Graphs
# ------------------
# Week 1: Project 1
# -----------------
# Antonio P. Peralta C.

# -------------------------------------------------------------
# Plot 2: Global Active Power by Date Days (Thu-Fri-Sat)
# -------------------------------------------------------------

# 1st) Read folder and dataset file (.txt format)
# -----------------------------------------------
datacons <- read.table(file = "data/housePowerCons.txt", sep = ";" , header = TRUE)


# 2nd) Change data type (chr) of column Date to data type (Date)
# --------------------------------------------------------------
datacons$Date <- as.Date(datacons$Date, format="%d/%m/%Y")


# 3rd) Subsetting and Create dataset with Date Range Specified: 1st/3rd Feb 2007
# ------------------------------------------------------------------------------
dataconsByDate <- subset(datacons, Date == "2007-02-01" | Date == "2007-02-3")


# 4th) Converting Global_active_power column data type character to numeric 
# -------------------------------------------------------------------------
dataconsByDate$Global_active_power <- as.numeric(dataconsByDate$Global_active_power)


# 5th) Plot2
# ----------
plot(dataconsByDate$Date, 
     dataconsByDate$Global_active_power,
     type = "l",
     ylab = "Global Active Power(kilowatt)",
     xlab = " "
     )