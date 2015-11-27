corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        ## Return a numeric vector of correlations
        ## NOTE: Do not round the result!
        source("complete.R")
        Files <- list.files(path = directory, full.names = TRUE);
        Correlation <- c(); # the correlation vector returned by the function
        ix <- 1; 
        Nfiles <- length(Files);

        while (ix <= Nfiles) {
        	completeCases <- complete(directory, ix); 
        	if (completeCases$nobs > threshold) {
        		CaseaboveThreshold <- read.csv(Files[ix], comment.char = "", header = TRUE); 
        		Correlation <- c(Correlation, cor(CaseaboveThreshold$sulfate, 
        						CaseaboveThreshold$nitrate, use = "complete.obs")); 
        	}
        	ix <- ix + 1;
        }
        Correlation; 
}