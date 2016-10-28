##How many of the IDs match? 189
str(MergeData)

##Make all variable names lower case
names(MergeData) <- tolower(names(MergeData))

##Sort the data frame in ascending order by GDP
OrderByGDP <- MergeData[order(MergeData$usdollars),]

##What is the 13th country in the resulting data frame?
OrderByGDP[1][13,]

##Country Code is KDP, find name
KDPName <- subset(MergeData, countrycode == "KNA")
KDPName
## 13th Country in ordered data is St. Kitts and Nevis

##High Income Means, Check For mispellings
unique(MergeData$income.group)

##Average GDP rankings for the "High income: OECD"
HighIncomeOECD <- subset(MergeData, income.group == "High income: OECD")
mean(HighIncomeOECD$ranking)
##The average GDP rankings for the High Income OECD group is 32.96

##Average GDP rankings for the "High income:nonOECD" groups?
HighIncomeNonOECD <- subset(MergeData, income.group == "High income: nonOECD")
mean(HighIncomeNonOECD$ranking)
##Average ranking for the High Income Non OECD group is 91.91


##Cut the GDP Ranking into 5 separate quantile groups
## find ranges
189/5
(189/5)*2
(189/5)*3
(189/5)*4
(189/5)*5

##Create Categories
attach(MergeData)
MergeData$rankingcat[ranking <= 37] <- "1"
MergeData$rankingcat[ranking > 37 & ranking <= 75] <- "2"
MergeData$rankingcat[ranking > 75 & ranking <= 113] <- "3"
MergeData$rankingcat[ranking > 113 & ranking <= 151] <- "4"
MergeData$rankingcat[ranking > 151] <- "5"
detach(MergeData)

