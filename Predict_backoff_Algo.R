
#  Katz Back Off Algorithm model

#    Testing the quadgram data frame to check for matching records
#    then testing the trigram data frame, then  bigram.  
#    If no next word found in quad, tri and bigrams the algorithm will return the most
#    frequently used word from the onegram data frame

(library(tm))
(library(stringr))

PredNextTerm <- function(inStr)
{
        assign("mesg", "in PredNextTerm", envir = .GlobalEnv)

        inStr <- CleanInputString(inStr);
  
        inStr <- unlist(strsplit(inStr, split=" "));
        inStrLen <- length(inStr);
        
        nxtTermFound <- FALSE;
        predNxtTerm <- as.character(NULL);
       
        if (inStrLen >= 3 & !nxtTermFound)
        {
                inStr1 <- paste(inStr[(inStrLen-2):inStrLen], collapse=" ");
                
                searchStr <- paste("^",inStr1, sep = "");
                fDF4Temp <- fDF4[grep (searchStr, fDF4$terms), ];
                
                if ( length(fDF4Temp[, 1]) > 1 )
                {
                        predNxtTerm <- fDF4Temp[1,1];
                        nxtTermFound <- TRUE;
                        mesg <<- " predicting next word using quadgram"
                }
                fDF4Temp <- NULL;
        }
        
             if (inStrLen >= 2 & !nxtTermFound)
        {
            
                inStr1 <- paste(inStr[(inStrLen-1):inStrLen], collapse=" ");
          
                searchStr <- paste("^",inStr1, sep = "");
                fDF3Temp <- fDF3[grep (searchStr, fDF3$terms), ];
                
                if ( length(fDF3Temp[, 1]) > 1 )
                {
                        predNxtTerm <- fDF3Temp[1,1];
                        nxtTermFound <- TRUE;
                        mesg <<- "predicting next word using trigram"
                }
                fDF3Temp <- NULL;
        }

        if (inStrLen >= 1 & !nxtTermFound)
        { inStr1 <- inStr[inStrLen];searchStr <- paste("^",inStr1, sep = "");
                fDF2Temp <- fDF2[grep (searchStr, fDF2$terms), ];
                
                if ( length(fDF2Temp[, 1]) > 1 )
                {
                        predNxtTerm <- fDF2Temp[1,1];
                        nxtTermFound <- TRUE;
                        mesg <<- "predicting next word using bigram.";
                }
                fDF2Temp <- NULL;
        }

        if (!nxtTermFound & inStrLen > 0)
        {
                predNxtTerm <- fDF1$terms[1];
                mesg <- "No word found, the most frequently used word is selected as next word."
        }
        
        nextTerm <- word(predNxtTerm, -1);
        
        if (inStrLen > 0){
                dfTemp1 <- data.frame(nextTerm, mesg);
                return(dfTemp1);
        } else {
                nextTerm <- "";
                mesg <-"";
                dfTemp1 <- data.frame(nextTerm, mesg);
                return(dfTemp1);
        }
}