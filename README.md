# Seal Tag Data Visualization Tutorial - Instructions
## Overview
In this tutorial, you will visualise oceanographic data collected by seal-borne
tags. These tags record ocean properties, such as temperature, salinity, and 
fluorescence as the seals dive through the ocean. The raw data from these tags 
are processed and stored in netCDF format, which is a commonly used file format 
to store oceanographic and climate data.  

## Learning Objectives
By the end of this tutorial, you will be able to:
1.	Load and examine NetCDF oceanographic datasets
2.	Create maps showing geographical distributions of the seal tag data
3.	Create time series plots of sea surface parameters.
4.	Create pressure section plots showing how ocean properties change with depth and time/space.
5.	Interpret oceanographic data with respect to seal foraging behaviour.

## Getting Started
### R packages
Make sure you have these packages installed:
-	ncdf4: For reading NetCDF files
-	tidyverse: For data manipulation and visualization
-	maps: For creating maps
-	mapproj: For map projections
-	cmocean: For oceanographic color maps
-	lubridate: For handling date-time data
-	patchwork: For combining multiple plots
-	gtable: For arranging plots and tables

You can install all packages by running the following command in R: install.packages(c("ncdf4","tidyverse","maps","mapproj","cmoce an","lubridate","patchwork","gtable"))

### Files Needed
-	*_PROCESSED.nc: A seal tag NetCDF dataset. Note: There are four datasets in the folder. You will work in four groups, each on a different seal tag file. The tasks are exactly the same, only the output is slightly different. Feel free to name your seal.
-	seal_tag_tutorial.R: The tutorial script. Note: To make the script work you will need to fill in the blanks (“	”). Tips and instructions for completing the script are provided as comments (“# ……”) in the script.

## Tutorial Structure
### Part A: NetCDF Data Loading and Exploration (~10 minutes)
In the first part of the tutorial, you will learn how to open and explore the NetCDF file containing the seal tag data. This will help you understand the structure of the data and how to extract the variables you need for analysis.

Ǫuestions:
1.	What information can you find in the NetCDF file?
2.	How many profiles did the seal tag record?
3.	When and where were the first and last profiles measured?
4.	How deep did the seal typically dive?

### Part B: Mapping Seal Locations (~10 minutes)
After you've loaded the data, you will create a map of the seal tag profile locations, colouring each profile based on sea surface temperature. This will show you where the seal travelled to during its foraging trip and give you an idea of the changes in environmental conditions along the way.

Ǫuestions:
1.	What is the Southern most point the seal reached?
2.	How did the sea surface temperature vary across the profile locations?
3.	Why is a polar projection more appropriate for Southern Ocean data than a standard rectangular projection?

### Part C: Time Series of Sea Surface Properties (~15 minutes)
Next, you will plot up time series of sea surface temprature, salinity and fluorescence, to see how these variables change over time (and space) during the seal's foraging trip.

Ǫuestions:
1.	Do you see any interesting trends over time?
2.	What might these trends indicate?

### Part D: Pressure Section Plots (~15 minutes)
Lastly, you will create section plots of temperature, salinity and fluorescence. Section plots are very helpful ways to visualise the water column properties along a transect, as a function of depth (y-axis) and time/location (x-axis). These plots basically show a vertical cut through the ocean as the seal experienced it during its trip.

Ǫuestions
1.	Based on your observations, what would be a key benefit of seal tag data?
2.	What does fluorescence tell us about ocean biology and productivity?
3.	Do the seals appear to target any specific regions? Why might this seal be found in these particular locations? What oceanographic features might be important?
4.	In the materials, you will find a map of Antarctic coastal polynyas. These are areas of open water in the sea ice zone. Do you see any patterns in the seal's profile locations that might relate to these polynyas?
5.	What might explain the spatial distribution of the profile locations?
6.	Are there any biases in the way a seal collects data (compared to robotic platforms like floats)?

Good luck and have fun exploring the data!
