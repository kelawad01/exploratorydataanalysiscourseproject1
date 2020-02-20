library(data.table)

setwd(
        "./Data Science Specialization/Course Data/exdata_data_household_power_consumption"
)
powerdata <-
        fread(
                file.path(getwd(), "household_power_consumption.txt"),
                col.names = c(
                        "date",
                        "time",
                        "globalactivepower",
                        "globalreactivepower",
                        "voltage",
                        "globalintensity",
                        "submetering1",
                        "submetering2",
                        "submetering3"
                )
        )

#Plot 1
#Convert date format
date <- as.Date(powerdata$date, "%d/%/m/%Y")


globalactivepower <- as.numeric(powerdata$globalactivepower)

#Specify the relevant data from the initial data table. Only 2 days.
specglobalactivepower <-
        globalactivepower[(date >= "2007-02-01") & (date <= "2007-02-02")]


png("plot1.png", width = 480, height = 480)

hist(
        specglobalactivepower,
        main = "Global Active Power",
        xlab = "Global Active Power (kilowatts)",
        ylab = "Frequency",
        col = "Red"
)

dev.off()

#Plot 2
#Make available the chron function from the chron library to reformat our time data.
library(chron)

#Instead of specifying dates as before we instead are going to subset the relevant portion of the data table.
powerdatasubset <-
        subset(powerdata,
               powerdata$date == "1/2/2007" | powerdata$date == "2/2/2007")

#Reformat the subsetted date and time data.
powerdatasubset$date <- as.Date(powerdatasubset$date, "%d/%m/%Y")
powerdatasubset$time <- chron(times = powerdatasubset$time)

#Store the reformatted date and time data in a new variable called datetime
datetime <-
        paste(as.Date(powerdatasubset$date), powerdatasubset$time)

png("plot2.png", width = 480, height = 480)

plot(
        x = powerdatasubset$datetime,
        y = powerdatasubset$globalactivepower,
        type = "l",
        ylab = "Global Active Power (kilowatts)",
        xlab = ""
)

dev.off()

#Plot 3

png("plot3.png", width = 480, height = 480)

plot(
        x = powerdatasubset$datetime,
        y = powerdatasubset$submetering1,
        type = "l",
        ylab = "Energy Sub Metering",
        xlab = ""
)

lines(x = powerdatasubset$datetime,
      y = powerdatasubset$submetering2,
      col = 'Red')

lines(x = powerdatasubset$datetime,
      y = powerdatasubset$submetering3,
      col = 'Blue')

legend(
        "topright",
        col = c("black", "red", "blue"),
        lty = 1,
        lwd = 2,
        legend = c("Submetering1", "Submetering2", "Submetering3")
)

dev.off()

#Plot 4

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

plot(
        x = powerdatasubset$datetime,
        y = powerdatasubset$globalactivepower,
        type = "l",
        ylab = "Global Active Power",
        xlab = ""
)

plot(
        x = powerdatasubset$datetime,
        y = powerdatasubset$voltage,
        type = "l",
        ylab = "Voltage",
        xlab = "datetime"
)

plot(
        x = powerdatasubset$datetime,
        y = powerdatasubset$submetering1,
        type = "l",
        ylab = "Energy Sub Metering",
        xlab = ""
)

lines(x = powerdatasubset$datetime,
      y = powerdatasubset$submetering2,
      col = 'Red')

lines(x = powerdatasubset$datetime,
      y = powerdatasubset$submetering3,
      col = 'Blue')

legend(
        "topright",
        col = c("black", "red", "blue"),
        lty = 1,
        lwd = 2,
        legend = c("Submetering1", "Submetering2", "Submetering3")
)

plot(
        x = powerdatasubset$datetime,
        y = powerdatasubset$globalreactivepower,
        type = "l",
        ylab = "Global Reactive Power",
        xlab = "datetime"
)

dev.off()
