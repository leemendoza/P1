complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    monitorvector = id
    filelist = list.files(directory)
    filecount = length(id)
    print(filecount)
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    id = integer(filecount)
    nobs = integer(filecount)
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    index = 0
    for (i in monitorvector){
        index = index + 1
        
        ## i corresponds to the number of the monitoring station
        id[index] = i
        
        ## read the file
        filename = paste(directory, filelist[i], sep = "\\")
        
        f = read.csv(filename)        
        
        ## subset the non-NAs pollutants 
        y = nrow(f[complete.cases(f),])
        #print(y)
        ## how many? and store in counts
        nobs[index] = y
    }
    
    ## create a data.frame
    df = data.frame(id, nobs)
    
    ## return said data.frame
    df
}

