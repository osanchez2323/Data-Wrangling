### Load the file onto RStudio and set it as a data frame
titan <- read.csv("Documents/titanic_original.csv")
as.data.frame(titan)

### Replace the missing value in the embark column with S
titan$embarked[embarked == ""] = "S"

### Calculate the mean of age, excluding the missing values
titan %>% 
  summarise(mean(age, na.rm=TRUE))

### Replace all the missing values in ages with mean of 29.88113
titan$age[is.na(age)] <- 29.88113

### Replace all the missing values in the boat column and replace it with
### dummy variable NA 
titan$boat[boat == ""] <- NA

### Create a new variable column which indicates if a passenger has a 
### cabin number (1) or doesn't have a cabin number (0)
titan$has_cabin_number[cabin == ""] <- 0
titan$has_cabin_number[cabin != ""] <- 1

head(titan)
tail(titan)
