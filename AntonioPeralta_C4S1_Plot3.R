# Exploratory Graphs
# ------------------
# Week 1: Project 1
# -----------------
# Antonio P. Peralta C.

# -------------------------------------------------------------
# Plot 3: Energy Sub Metering by Date Days (Thu-Fri-Sat)
# -------------------------------------------------------------

# 1st) Preparing the Data
# 1.1) Read folder and dataset file (.txt format)
# -----------------------------------------------
datacons <- read.table(file = "data/housePowerCons.txt", sep = ";" , header = TRUE)


# 1.2) Create new column joining Date and Time Column
# ---------------------------------------------------
datacons$DateTime <- paste(datacons$Date, datacons$Time, sep = " ")


# 1.3) Change data type of column DateTime
# (chr) of column DateTime to data type Posixlt (DateTime)
# --------------------------------------------------------
datacons$DateTime <- strptime(datacons$DateTime, 
                              format="%d/%m/%Y %H:%M:%S"
                              )

datacons$Date <- as.Date(datacons$Date, format="%d/%m/%Y")

str(datacons)

# 1.4) Subsetting and Create dataset with Date Range Specified: 1st/2nd Feb 2007
# ------------------------------------------------------------------------------
dataByDate <- subset(datacons, Date == "2007-02-01" | Date == "2007-02-02")

str(dataByDate)

# 1.5) Change data type of Sub_metering_1 and 2 column
# (chr) of column to data type numeric
# --------------------------------------------------------
dataByDate$Sub_metering_1 <- as.numeric(
                                dataByDate$Sub_metering_1,
                                na.omit(dataByDate$Sub_metering_1)
                          )

dataByDate$Sub_metering_2 <- as.numeric(
                                dataByDate$Sub_metering_2,
                                na.omit(dataByDate$Sub_metering_2)
                          )

# 2nd) Create Plot3: Multivariable (Sub_metering_1, 2 y 3)
# Energy Sub Metering by Date Days (Thu-Fri-Sat)
# --------------------------------------------------------
# 2.1 Setting Margin
# ------------------
par(mar=c(bottom=4, left=4, top=0, right=2))

# 2.2a Plot 1st Variable
# ----------------------
plot(dataByDate$DateTime, dataByDate$Sub_metering_1,
     col = "black",
     type = "l",
     ylab = "Energy sub metering",
     xlab = " ")

# 2.2b Plot 2nd Variable
# ----------------------
lines(dataByDate$DateTime, dataByDate$Sub_metering_2, col="red") 

# 2.2c Plot 3rd Variable
# ----------------------
lines(dataByDate$DateTime, dataByDate$Sub_metering_3, col="blue") 

# 2.3 Plot Legend
# ---------------
legend("topright", 
       inset = c(0,0),
       legend = c ("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       text.font = 2, lty = 1, lwd = 1 , cex = 0.8
       )
