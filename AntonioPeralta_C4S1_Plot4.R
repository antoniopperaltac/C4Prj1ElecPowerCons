# Exploratory Graphs
# ------------------
# Week 1: Project 1
# -----------------
# Antonio P. Peralta C.

# -------------------------------------------------------------
# Plot 4: Scene divided in 4 panels: 1 plot each panel
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

# 1.5) Change data type of 
# Global_active_power column
# Sub_metering_1 and 2 column
# Voltage column
# Global_reactive_power column
# (chr) of column to data type numeric
# --------------------------------------------------------
# Global_active_power column
dataByDate$Global_active_power <- as.numeric(
                                  dataByDate$Global_active_power,
                                  na.omit(dataByDate$Global_active_power)
                           )
# Sub_metering_1 column
dataByDate$Sub_metering_1 <- as.numeric(
                                dataByDate$Sub_metering_1,
                                na.omit(dataByDate$Sub_metering_1)
                          )
# Sub_metering_2 column
dataByDate$Sub_metering_2 <- as.numeric(
                                dataByDate$Sub_metering_2,
                                na.omit(dataByDate$Sub_metering_2)
                          )
# Voltage column
dataByDate$Voltage <-   as.numeric(
                                dataByDate$Voltage,
                                na.omit(dataByDate$Voltage)
                         )
# Global_reactive_power column
dataByDate$Global_reactive_power <- as.numeric(
                                dataByDate$Global_reactive_power,
                                na.omit(dataByDate$Global_reactive_power)
                        )


# Reviewing the data structure
# --------------------------------------------------------
str(dataByDate)

# -----------------------------------------------
# 2nd) Create Plot4: 4 Plots each different panel
# -----------------------------------------------


# 2.1 Creating panels
# -------------------
par(mfrow = c(2,2))

# --------------------------------------------------------------------
# 1st Plot Panel(1,1): Global Active Power and Date Days (Thu-Fri-Sat)
# --------------------------------------------------------------------
plot(dataByDate$DateTime, dataByDate$Global_active_power,
     type = "l",
     ylab = "Global Active Power",
     xlab = " ")


# --------------------------------------------------------------------
# 2nd Plot Panel(1,2): Energy Sub Metering and Date Days (Thu-Fri-Sat)
# --------------------------------------------------------------------
plot(dataByDate$DateTime, dataByDate$Voltage,
     type = "l",
     ylab = "Voltage",
     xlab = " ")


# --------------------------------------------------------------------
# 3rd Plot Panel(2,1): Energy Sub Metering and Date Days (Thu-Fri-Sat)
# --------------------------------------------------------------------
par(mar=c(bottom=4, left=4, top=0, right=2))

# Plot 1st Variable
# ----------------------
plot(dataByDate$DateTime, dataByDate$Sub_metering_1,
     col = "black",
     type = "l",
     ylab = "Energy sub metering",
     xlab = " ")

# Plot 2nd Variable
# ----------------------
lines(dataByDate$DateTime, dataByDate$Sub_metering_2, col="red") 

# Plot 3rd Variable
# ----------------------
lines(dataByDate$DateTime, dataByDate$Sub_metering_3, col="blue") 

# Plot Legend
# ---------------
legend("topright", 
       inset = c(0,0),
       legend = c ("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       bty = "n", 
       xjust = 1, yjust = 1,
       text.font = 2, lty = 1, lwd = 1 , cex = 0.6
       )


# ----------------------------------------------------------------------
# 4th Plot Panel(2,2): Global Reactive Power and Date Days (Thu-Fri-Sat)
# ----------------------------------------------------------------------
plot(dataByDate$DateTime, dataByDate$Global_reactive_power,
     type = "l",
     ylab = "Global_reactive_power",
     xlab = " ")
