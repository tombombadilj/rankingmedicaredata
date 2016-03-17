#rank all in all state for the three outcomes
rankall <- function(selectedoutcome,num="best") {
    outcome <- read.csv("outcome-of-care-measures.csv",colClasses = "character")
    outcomelist <- c('heart attack','heart failure','pneumonia')
    statelist <- unique(outcome$State)
    statelist <- sort(statelist)
    answer = data.frame(Hostpial = character(),State=character())
    if (!(state %in% statelist)){
        print("Invalid State")}
    if (!(selectedoutcome %in% outcomelist)){
        print("Invalid Outcome")}
    outcome$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia <- as.numeric(outcome$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
    outcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack <- as.numeric(outcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
    outcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure <- as.numeric(outcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)
    if (selectedoutcome == "heart attack"){
        outcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack <- as.numeric(outcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
        NoNA <- outcome[which(!(is.na(outcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack))),]
        rankedheart <- NoNA[order(NoNA$State,NoNA$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack),]
        for (x in statelist) {stateonly <- rankedheart[which(rankedheart$State == x),]
        if (num == "best"){c <- data.frame(Hospital = stateonly$Hospital.Name[1],state = x)
        answer <- rbind(answer,c)}
        else if (num == "worst"){c <- data.frame(tail(stateonly$Hospital.Name,n=1), State = x)
        answer <- rbind(answer,c)}
        else {c<-data.frame(Hospital = stateonly$Hospital.Name[num],state = x)
        answer <- rbind(answer,c)}}
        return(answer)
    }
    if (selectedoutcome == "heart failure"){
        NoNA <- outcome[which(!(is.na(outcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure))),]
        rankedfailure <- NoNA[order(NoNA$State,NoNA$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure),]
        for (x in statelist) {stateonly <- rankedfailure[which(rankedfailure$State == x),]
        if (num == "best"){c <- data.frame(Hospital = stateonly$Hospital.Name[1],state = x)
        answer <- rbind(answer,c)}
        else if (num == "worst"){c <- data.frame(tail(stateonly$Hospital.Name,n=1), State = x)
        answer <- rbind(answer,c)}
        else {c<-data.frame(Hospital = stateonly$Hospital.Name[num],state = x)
        answer <- rbind(answer,c)}}
        return(answer)
    }
    if (selectedoutcome == "pneumonia"){
        NoNA <- outcome[which(!(is.na(outcome$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia))),]
        rankedpneumonia <- NoNA[order(NoNA$State,NoNA$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia),]
        for (x in statelist) {stateonly <- rankedpneumonia[which(rankedpneumonia$State == x),]
        if (num == "best"){c <- data.frame(Hospital = stateonly$Hospital.Name[1],state = x)
        answer <- rbind(answer,c)}
        else if (num == "worst"){c <- data.frame(tail(stateonly$Hospital.Name,n=1), State = x)
        answer <- rbind(answer,c)}
        else {c<-data.frame(Hospital = stateonly$Hospital.Name[num],state = x)
        answer <- rbind(answer,c)}}
        return(answer)
    }
}


