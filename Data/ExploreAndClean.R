##explore current table structures
str(GDP)
str(Education)

##US.dollars. is character and has commas. Change US.dollars. variable in GDP and rename 
GDP$USDollars <- as.numeric(gsub(",","",GDP$US.dollars.))

##Merge the GDP and Education Datasets
MergeData <- merge(x=GDP, y=Education, by="CountryCode")

##Save the new Merged Data Set

write.csv(MergeData,"MergeData")