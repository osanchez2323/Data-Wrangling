library(ggplot2)
data(diamonds)

### Price Histograms with Facet and Color
qplot(data = diamonds, x = price, color = cut, fill = cut) +
  facet_wrap(~color)

### Price vs. Table Colored by Cut
qplot(data = diamonds, x = table, y = price, color = cut, fill = cut)

### Typical Table Value
# What is the typical table range for the majority of the diamonds of 
# ideal cut? 53 to 57

# What is the typical table range for the majority of the diamonds of 
# premium cut? 58 to 62

### Price vs. Volume and Diamond Clarity
diamonds$volume <- diamonds$x * diamonds$y * diamonds$z

qplot(x = volume, y = price, data = diamonds, color = clarity) +
  scale_y_log10() +
  xlim(0, quantile(diamonds$volume, 0.99))

### Proportion of Friendships Initiated
pf <- read.delim('Documents/pseudo_facebook.tsv')

pf$prop_initiated <- pf$friendships_initiated / pf$friend_count

### prop_initiated vs. tenure
pf$year_joined <- floor(2014 - pf$tenure / 365)

pf$year_joined.bucket <- cut(pf$year_joined,
                             c(2004, 2009, 2011, 2012, 2014))

ggplot(aes(x = tenure, y = prop_initiated), 
       data = subset(pf, !is.na(year_joined.bucket))) +
  geom_line(aes(color = year_joined.bucket), stat = "summary", fun.y = median)

### Smoothing prop_initiated vs. tenure
ggplot(aes(x = tenure, y = prop_initiated), 
       data = subset(pf, !is.na(year_joined.bucket))) +
  geom_line(aes(color = year_joined.bucket), stat = "summary", fun.y = median) +
  geom_smooth(method = 'lm', formula = y ~ x, size = 1)

### Largest Group Mean prop_initiated
with(subset(pf, year_joined > 2012), summary(prop_initiated))

### Price/Carat Binned, Faceted, & Colored
ggplot(aes(x = cut, y = price / carat), data = diamonds) +
  geom_point(aes(color = color)) +
  facet_wrap(~clarity)

### Gapminder Multivariate Analysis

# Fare vs. Age by Sex & Embarked Status
ggplot(aes(x = age, y = fare), data = subset(titan, !is.na(sex))) +
  geom_point(aes(color = embarked)) +
  facet_wrap(~sex)

# Fare Histograms with Facet and Color
qplot(data = titan, x = fare, color = sex, fill = sex) +
  facet_wrap(~embarked)
