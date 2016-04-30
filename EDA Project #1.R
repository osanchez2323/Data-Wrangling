#### I organized the code by each subsection in Udacity Problem Set 3

library(ggplot2)
data(diamonds)

names(diamonds)

### Price Histogram
qplot(x = price, data = diamonds)

### Diamond Count
tail(diamonds %>% 
  filter(price < 500) %>% 
  select(price))

tail(diamonds %>% 
  filter(price < 250) %>% 
  select(price))

tail(diamonds %>% 
  filter(price >= 15000) %>% 
  select(price))

### Cheaper Diamonds
qplot(x = price, data = diamonds, binwidth = 30, 
      color = I("black"), fill = I("#099DD9")) +
  scale_x_continuous(limits = c(300, 2000), breaks = seq(300, 2000, 100))

### Price by Cut
qplot(x = price, data = diamonds) +
  scale_x_discrete(breaks = seq(15000, 20000, 1000)) +
  facet_wrap(~cut)

###Scales and Multiple Histograms
qplot(x = price, data = diamonds) + facet_grid(cut ~ color)

### Price per Carat by Cut (Scale using log 10)
qplot(x = price/carat, data = diamonds) +
  scale_x_log10() +
  facet_wrap(~cut)

###Price Box Plots
summary(diamonds$price)
qplot(x = cut, y = price , data = diamonds, geom = 'boxplot')

### Interquartile Range (IQR)
by(diamonds$price, diamonds$color, summary)
IQR(diamonds$)

###Price Per Carat Box Plots by Color
qplot(x = color, y=price / carat , data = diamonds, geom='boxplot', fill = color) 

### Carat Frequency Polygon (0.3 & 1.01 have counts > 2000)
qplot(x = carat, data = diamonds, binwidth = 0.01, geom = "freqpoly") +
  scale_x_continuous(limits = c(0, 3), breaks = seq(0, 3, 0.5))

table(diamonds$carat)

### Gapminder Data (Used the Titanic data set from previous Project)
titan <- read.csv("Documents/titanic_original.csv")
as.data.frame(titan)

#Plot of Fare
qplot(x = fare, data = titan, binwidth = 10,
      color = I("black"), fill = I("blue")) +
  scale_x_continuous(limits = c(0, 250), breaks = seq(0, 250, 50))

#Plot of Fare by Embarked Status
qplot(x = fare, data = titan), binwidth = 10,
      color = I("black"), fill = I("blue")) +
  scale_x_continuous(limits = c(0, 250), breaks = seq(0, 250, 50)) +
  facet_wrap(~embarked)

#Boxplots of Fare by Embarked Status
qplot(x = embarked, y = fare , data = titan, geom='boxplot', fill = I("red"))


