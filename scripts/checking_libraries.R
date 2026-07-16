# Checking if relevant libraries are installed locally
lib_list <- c("terra", "dplyr", "tidyr", "stringr", "lubridate", "janitor", 
              "ncdf4", "metR", "ggplot2", "cmocean", "cowplot")

for(lib in lib_list){
  if(!requireNamespace(lib, quietly = TRUE)){
    print(paste0("Installing ", lib, " library"))
    install.packages(lib)
  }
}
