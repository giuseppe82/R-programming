polluntantmean <- function(directory, pollutant, id = 1:332) {
		## Tips from Cousera Data Science Specialization	
	    ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used

        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        ## NOTE: Do not round the result!
        Files <- list.files(path = directory, full.names = TRUE); 
        Data  <- data.frame();  

        for (ID_vector in Files) {
        	Data <- rbind(Data, read.csv(ID_vector, comment.char = "", header = TRUE));
        }

        Monitors <- subset(Data, ID %in% id);
        Mean_pollutant <- mean(Monitors[[pollutant]], na.rm = TRUE); 
        Mean_pollutant;
    }

