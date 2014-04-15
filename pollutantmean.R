pollutantmean <- function(directory, pollutant, id = 1:332) {
   ## 'directory' is a character vector of length 1 indicating
   ## the location of the CSV files
   filelist = list.files(directory)
   ##print(filelist)
   ## let's set the working directory to that what's passed in
   ##setwd(directory)
   ## 'pollutant' is a character vector of length 1 indicating
   ## the name of the pollutant for which we will calculate the
   ## mean; either "sulfate" or "nitrate".
   
   ## res is the vector containing each value
   res=numeric(0)
   
   ## 'id' is an integer vector indicating the monitor ID numbers
   ## to be used
   for (i in id) {      
       ## open each file
       filename = paste(directory, filelist[i], sep = "\\")
       ##print(filename)
       f = read.csv(filename)
       z = f[pollutant]
       
       ## subset the non-NAs using the proper pollutant 
       y = !is.na(z)
       z = z[y]
       ## add to the existing vector
       res = c(res, z)
   }
 
   ## Return the mean of the pollutant across all monitors list
   ## in the 'id' vector (ignoring NA values)
   print(mean(res), digits=4)
}
