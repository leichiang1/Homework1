bonds <- read.csv('Homework1_Bonds.csv')
#Loading up the data frame.

#QUESTION 1
table(bonds$Result)

#Presents a table that summarizes how many bonds were defeated, approved, etc.

prop.table(table(bonds$Gov_Type, bonds$Result),1)

#Shows a table of Gov. types and their proportion of carried and defeated bonds.

#QUESTION 2

bonds$Votes_Total <- bonds$Votes_Against + bonds$Votes_For

#Creates another variable/column that shows total voter turnout in each row.

summary(bonds$Votes_Total)

#Finds our highest voter turnout value

bonds[bonds$Votes_Total == '1030414',]

#Finds where the highest voter turnout occurred

#QUESTION 3
subset <- bonds[bonds$Votes_For > 10 & bonds$Result == 'Carried',]

# creates subset with approved bonds with votes approving bonds > 10 

subset$ptv <- (subset$Votes_For / subset$Votes_Total) * 100

#creates a new variable with percentage of votes that approved the bond.

hist(subset$ptv, main='Distribution of Rates that Passed Bonds',
xlab='Percentages', ylab = 'Frequency', col='skyblue',xlim=c(40,100),ylim=c(0,700))

# presents a histogram of the ptv variable

#QUESTION 4

plot(subset$ptv, subset$Amount/10000000, main='Approving Percentages vs. Cost of Bond',
     ylab = 'Cost of Bond (Ten Millions)', xlab= 'Approval Percentage')
#Scatterplot of Approval Percentages vs. Cost of the Bond
cor(subset$ptv, subset$Amount)
#r-value of the plot