
#  Clean up the user input string before it is used to predict the next term

CleanInputString <- function(inStr)
{
        # remove the non-alphabatical characters
        
        inStr <- iconv(inStr, "latin1", "ASCII", sub=" ");
        inStr <- gsub("[^[:alpha:][:space:][:punct:]]", "", inStr);
     
        inStrCrps <- VCorpus(VectorSource(inStr))      # create corpus
        
        inStrCrps <- tm_map(inStrCrps, content_transformer(tolower)) # convert to lower case
        inStrCrps <- tm_map(inStrCrps, removePunctuation)            # remove punctuation
        inStrCrps <- tm_map(inStrCrps, removeNumbers)                # remove numbers
        inStrCrps <- tm_map(inStrCrps, stripWhitespace)              # strip white space
        inStr <- as.character(inStrCrps[[1]])
        inStr <- gsub("(^[[:space:]]+|[[:space:]]+$)", "", inStr)    # remove non alphabets characters
  
        if (nchar(inStr) > 0) {
                return(inStr); 
        } else {
                return("");
        }
}
