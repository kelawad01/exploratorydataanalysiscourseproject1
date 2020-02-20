# Exploratory Data Analysis Coursera Project 1 -- Data Science Specialization

Exploratory Data Analysis Project 1

Data -- UCI Data
https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption

Data Description -- Measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available.

Variables Description - The following descriptions of the 9 variables are taken from the UCI website:
  1. Date: Date in format dd/mm/yy
  2. Time: time in format hh:mm:ss
  3. Global_active_power: household global minute-averaged active power (in kilowatt)
  4. Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
  5. Voltage: minute-averaged voltage (in volt)
  6. Global_intensity: household global minute-averaged current intensity (in ampere)
  7. Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
  8. Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
  9. Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.
  
Code Description:
  
The powerdata.R program takes data downloaded into my specific coursera course data directory and generates 4 plots as png files. 

Plot 1 -- variables
    specglobalaveragepower: the specific global average power over the 2 days of interest (02-01-2007 throught 02-02-2007)
    
Plot 2 -- variables
    powerdatasubset: a subset of the household_consumption_powerdata for the days of interest (02-01-  2007 through 02-02-2007)
    datetime: a concatenation and reformatting of the date and time variables of the power data       subset
    
