# Seal Tag Data Visualization Tutorial - Instructions
## Overview
In this tutorial, you will visualise oceanographic data collected by seal-borne
tags. These tags record ocean properties, such as temperature, salinity, and 
fluorescence as the seals dive through the ocean. The raw data from these tags 
are processed and stored in netCDF format, which is a commonly used file format 
to store oceanographic and climate data.  

## Learning Objectives
By the end of this tutorial, you will be able to:  
1. Load and examine netCDF files  
2. Create maps showing spatial distributions of the seal tag data  
3. Create time series plots of sea surface parameters  
4. Create "pressure section" plots showing how ocean properties change across 
depths, time and space  
5. Interpret oceanographic data with respect to seal foraging behaviour  

## Getting Started
### `R` session
This tutorial was developed and tested using `R` version 4.6.0. It is 
recommended you install `R` version 4.6.0 or higher in your machine. You may 
also want to install RStudio or VS Code to run this tutorial.  
  
The full `R` info session is included below:  

```
R version 4.6.0 (2026-04-24 ucrt)
Platform: x86_64-w64-mingw32/x64
Running under: Windows 11 x64 (build 26200)

Matrix products: default
  LAPACK version 3.12.1

locale:
[1] LC_COLLATE=English_Australia.utf8  LC_CTYPE=English_Australia.utf8    LC_MONETARY=English_Australia.utf8
[4] LC_NUMERIC=C                       LC_TIME=English_Australia.utf8    

time zone: Australia/Hobart
tzcode source: internal

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
 [1] cowplot_1.2.0   cmocean_0.3-2   ggplot2_4.0.3   metR_0.18.3     ncdf4_1.24      janitor_2.2.1   lubridate_1.9.5 stringr_1.6.0  
 [9] tidyr_1.3.2     dplyr_1.2.1     terra_1.9-34   

loaded via a namespace (and not attached):
 [1] gtable_0.3.6       compiler_4.6.0     tidyselect_1.2.1   Rcpp_1.1.1-1.1     snakecase_0.11.1   scales_1.4.0      
 [7] fastmap_1.2.0      R6_2.6.1           generics_0.1.4     knitr_1.51         backports_1.5.1    checkmate_2.3.4   
[13] tibble_3.3.1       pillar_1.11.1      RColorBrewer_1.1-3 rlang_1.2.0        cachem_1.1.0       stringi_1.8.7     
[19] xfun_0.59          S7_0.2.2           otel_0.2.0         memoise_2.0.1      timechange_0.4.0   cli_3.6.6         
[25] withr_3.0.3        magrittr_2.0.5     grid_4.6.0         rstudioapi_0.19.0  lifecycle_1.0.5    vctrs_0.7.3       
[31] data.table_1.18.4  evaluate_1.0.5     glue_1.8.1         farver_2.1.2       codetools_0.2-20   purrr_1.2.2       
[37] tools_4.6.0        pkgconfig_2.0.3   
```

### `R` packages
To run this tutorial in your machine, you will need to install the following
packages in your machine:  

- `terra`: A widely popular package that performs spatial data analysis in `R`. 
For more information, see their [documentation]("https://rspatial.github.io/terra/").  
- `ncdf4`: A package for reading, writing and creating netCDF files in `R`. See 
their [manual](https://cran.r-project.org/web/packages/ncdf4/refman/ncdf4.html) 
for more information.  
- `metR`: A package designed to load netCDF files in a format that is compatible
with the `tidyverse`, making data cleaning and visualisation easier. Originally,
it was designed to deal with metereological data, but works with netCDF files
containing any type of data. More information in their 
[website]("https://eliocamp.github.io/metR/").  
- `dplyr`: Used for data cleaning, it is easy to use and it is part of the 
`tidyverse`. For more information, see their [documentation]("https://dplyr.tidyverse.org/").  
- `tidyr`: Used to make your data "tidier" so it is easier to analyse and 
visualise. It is also easy to use and part of the `tidyverse`. For more 
information, see their [documentation]("https://tidyr.tidyverse.org/").  
- `stringr`: Data cleaning package specifically designed to deal with strings or
character data. Part of the `tidyverse`, you can find more information in their
[documentation]("https://stringr.tidyverse.org/").  
- `lubridate`: This package is designed to make dealing with date-time data much
easier and flexible. It is also part of the `tidyverse` and you can learn more
about it by referring to their [documentation]("https://lubridate.tidyverse.org/").  
- `ggplot2`: Another package from the `tidyverse`. Unlike previous packages that
focus on data cleaning/manipulation, this one allows you to create plots and 
maps with relative ease. It uses an easy-to-learn syntax and creates nice 
looking plots. For more information, see their 
[documentation]("https://ggplot2.tidyverse.org/").  
- `janitor`: Package that facilitates the initial stages of data exploration and
data cleaning. It is not part of the `tidyverse`, but definitely a great 
companion. See their [documentation]("https://cran.r-project.org/web/packages/janitor/vignettes/janitor.html")
for more details.  
- `cmocean`: This package was designed to give oceanographers access to colour 
palettes that are perceptually uniform and are colourblind-friendly. See their
[website]("https://cran.r-project.org/web/packages/cmocean/vignettes/cmocean.html") 
for more information.  
- `cowplot`: A package designed as an add-on to `ggplot2` that helps create 
publication-quality figures with relative ease. It allows users to annotate 
plots and create complex multifaceted figures. Refer to their 
[documentation]("https://cran.r-project.org/web/packages/cowplot/vignettes/introduction.html") 
for more details.  
  
You can manually install any of these packages by running the `install.packages` 
function as follows: `install.packages(c("ncdf4", "janitor", "patchwork"))`. 
Alternatively, you can run the `checking_libraries.R` script included in this 
repository as follows: `source("scripts/checking_libraries.R")`. This scrpit 
checks if a library is already installed in your machine before attempting to 
install it.  

**Note:** If you have recently installed these packages in your machine, you do 
not need to install them again. However, if the installation occurred prior to 
2026, it is worth updating them.  

### Folder structure
This tutorial uses the following folder structure to make it easier to find and 
access the files needed to complete your work.  

```
marine_predator_ecology_tutorial/  
├── marine_predator_ecology_tutorial.Rproj     ← R Project file (root anchor)  
├── data/                ← original, unmodified data (treat as read-only)  
├── scripts/             ← R scripts (.R files), Quarto notebooks (.qmd)  
├── figures/             ← saved plots  
└── docs/                ← tutorial with solutions
```

The file you will be working with is `seal_tag_tutorial.qmd` stored under the 
`scripts/` folder. In this file, the grey-coloured boxes contain the `R` code 
and this is where you will be filling in the "blanks". In the grey boxes, any 
lines starting with `#` signal a comment, which will give you instructions/tips 
on how to complete the tutorial.  
  
All netCDF files containing the seal tag data can be found in the `data/` 
folder. Note that there are four different files, each file contains data 
collected by a different seal. 

**A note on raw data files**
It is best to never overwrite or modify in any way the original data files. If 
you would like to save any modifications, it is better if you create subfolders 
with the `data` folder to make it clearer what is considered raw and processed 
data. The new folder structure would look as follows:   

```
marine_predator_ecology_tutorial/  
├── marine_predator_ecology_tutorial.Rproj     ← R Project file (root anchor)  
├── data/                
│   ├── raw/             ← original, unmodified data (treat as read-only)  
│   └── processed/       ← cleaned/transformed data  
├── scripts/             ← R scripts (.R files), Quarto notebooks (.qmd)  
├── figures/             ← saved plots  
└── docs/                ← tutorial with solutions
```

## Tutorial Structure
You will work in four groups, each on a different seal tag file. The tasks are exactly the same, only the output is slightly different. Feel free to name your seal.

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
