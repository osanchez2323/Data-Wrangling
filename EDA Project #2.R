library(ggplot2)
data(diamonds)

### Price vs. x Scatterplot
qplot(x = x, y = price, data = diamonds)

### Correlations
cor.test(diamonds$price, diamonds$x, method = 'pearson')
# correlation = 0.88

cor.test(diamonds$price, diamonds$y, method = 'pearson')
# correlation = 0.87

cor.test(diamonds$price, diamonds$z, method = 'pearson')
# correlation = 0.86


### Price vs. Depth Scatterplot
qplot(x = depth, y = price, data = diamonds)

### Adjustments - Price vs. Depth Scatterplot
ggplot(data = diamonds, aes(x = depth, y = price)) + 
  geom_point(alpha = 1/100) +
  scale_x_continuous(breaks = seq(0, 80, 2))

### Typical Depth Range = between 58 to 64

### Correlation of Depth and Price
cor.test(diamonds$depth, diamonds$price, method = 'pearson')
# Correlation = -0.01 => do NOT use depth to predict price

### Price vs. Carat
ggplot(aes(x = carat, y = price), data = diamonds) +
  geom_point() +
  xlim(0, quantile(diamonds$carat, 0.99)) +
  ylim(0, quantile(diamonds$price, 0.99))

### Price vs. Volume
diamonds$volume <- diamonds$x * diamonds$y * diamonds$z

qplot(x = volume, y = price, data = diamonds)

### Findings - Price vs. Volume
# Most of the points do not pass a volume of 1000, and there seems to 
# be one outlier


### Correlations on Subsets
with(subset(diamonds, diamonds$volume < 800 & diamonds$volume != 0), cor.test(volume, price))
# correlation = 0.9235

### Adjustments - Price vs. Volume
ggplot(aes(x = volume, y = price), 
       data = subset(diamonds, diamonds$volume < 800 & diamonds$volume != 0)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm", formula = y ~ x, size = 1)

### Mean Price by Clarity
clarity1 <- group_by(diamonds, clarity)
diamondsByClarity <- summarise(clarity1, 
                               mean_price = mean(price))


diamondsByClarity <- diamonds %>% 
  group_by(clarity) %>% 
  summarise(mean_price = mean(price), 
             median_price = median(price),
             min_price = min(price),
             max_price = max(price),
             n = n())

### Bar Charts of Mean Price
diamonds_by_clarity <- group_by(diamonds, clarity)
diamonds_mp_by_clarity <- summarise(diamonds_by_clarity, mean_price = mean(price))

diamonds_by_color <- group_by(diamonds, color)
diamonds_mp_by_color <- summarise(diamonds_by_color, mean_price = mean(price))

p1 <- ggplot(aes(x = color, y = price), data = diamonds_by_color) +
  geom_bar(stat = "identity")

max(diam)

p2 <- ggplot(aes(x = clarity, y = price), data = diamonds_by_clarity) +
  geom_bar(stat = "identity")

grid.arrange(p1, p2)

### Gapmider Revisited
cell <- read.csv("Downloads/cellphone.csv")
as.data.frame(cell)

# Fare vs. Age Scatterplot
ggplot(aes(x = age, y = fare), data = titan) +
  geom_point()

# Fare vs. Age Scatterplot - Eliminating top 1%
ggplot(aes(x = age, y = fare), data = subset(titan, !is.na(fare))) +
  geom_point() +
  xlim(0, quantile(titan$age, 0.99)) +
  ylim(0, quantile(titan$fare, 0.99))

