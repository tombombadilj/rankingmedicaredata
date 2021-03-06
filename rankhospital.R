#rank hospitals within state
rankhospital <- function(state, selectedoutcome, num="best"){
    outcome <- read.csv("outcome-of-care-measures.csv",colClasses = "character")
    outcomelist <- c('heart attack','heart failure','pneumonia')
    statelist <- unique(outcome$State)
    if (!(state %in% statelist)){
        print("Invalid State")}
    if (!(selectedoutcome %in% outcomelist)){
        print("Invalid Outcome")}
    outcome$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia <- as.numeric(outcome$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
    outcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack <- as.numeric(outcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
    outcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure <- as.numeric(outcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)
    stateonly <- outcome[which(outcome$State == state),]
    if(selectedoutcome == "heart attack"){
        stateonly$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack <- as.numeric(stateonly$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
        NoNA <- stateonly[which(!(is.na(stateonly$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack))),]
        rankedheart <- NoNA[order(NoNA$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack,
                                  NoNA$Hospital.Name,na.last=TRUE),]
        if (num == "best"){print(head(rankedheart$Hospital.Name,n=1))}
        else if (num == "worst") {print(tail(rankedheart$Hospital.Name,n=1))}
        else {print(rankedheart$Hospital.Name[num])}
    }
    else if (selectedoutcome == 'heart failure'){
        stateonly$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure <- as.numeric(stateonly$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)
        NoNA <- stateonly[which(!(is.na(stateonly$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure))),]
        rankedfailure <- NoNA[order(NoNA$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure,
                                    NoNA$Hospital.Name, na.last=TRUE),]
        if (num == "best"){print(head(rankedheart$Hospital.Name,n=1))}
        else if (num == "worst") {print(tail(rankedheart$Hospital.Name,n=1))}
        else {print(rankedheart$Hospital.Name[num])}  
    }
    else if (selectedoutcome == 'pneumonia'){
        stateonly$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia <- as.numeric(stateonly$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
        NoNA <- stateonly[which(!(is.na(stateonly$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia))),]
        rankedpneumonia <- NoNA[order(NoNA$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia,
                                           NoNA$Hospital.Name, na.last=TRUE),]
        if (num == "best"){print(head(rankedpneumonia$Hospital.Name,n=1))}
        else if (num == "worst") {print(tail(rankedpneumonia$Hospital.Name,n=1))}
        else {print(rankedpneumonia$Hospital.Name[num])}   
    }
}    