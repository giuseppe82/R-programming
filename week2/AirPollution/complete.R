complete <- function(directory, id = 1:332) {
        ## Tips from 
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases

        nobs <- data.frame();
        Cases <- data.frame(); 
        completeCases <- data.frame(); # the returned data frame
        Files <- list.files(path = directory, full.names = TRUE);
        
        for (ID_index in id) {
                Cases <- (read.csv(Files[ID_index], header = TRUE));
                nobs  <- sum(complete.cases(Cases));
                completeCases <- rbind(completeCases, data.frame(ID_index, nobs))
        }
        names(completeCases) <- c("id", "nobs"); 
        completeCases;
}