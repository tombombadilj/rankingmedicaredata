# Working with Medicare Hospital Data
## 30-day hospital mortality rates for Pneumonia, Heart Attack, and Heart Failure
## The attached functions in this repository helps you sort through Medicare outcome data
## and find out how hospitals are performing in your state
1. Best(State,Outcome): The best function takes on two arguments: State and outcome, and it returns the best hospital in terms of that particular outcome as an output
Please enter state using the 2-character abbreviation (e.g., California -> "CA"), please pick one of the following outcomes for this function: "heart attack", "heart failure", and "pneumonia"
2. Rankhospital(State, Outcome, Number): the rankhospital function will return the hospital's name as an output for the indicated number in the rank by state. 
Number can also take on "best" and "worst" as values. For example, the 4th best performing hospital in Texas for 30-day heart attack mortality rankhospital("TX","heart attack",4) is Detar Hospital Navarro
3. Rankall(outcome, number). This function will return a data frame that includes hospitals from each state in the indicated number in the rank. For example rankall("heart attack", 20) will return a data frame 
with a list of all the hospitals ranked no. 20 in 30-day heart attack mortality rate from all states. 
