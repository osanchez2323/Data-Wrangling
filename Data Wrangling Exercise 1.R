### Load the file onto RStudio and set it as a data frame
refine <- read.csv("Documents/refine_original.csv")
tbl_df(refine)


### Set the variables product_code and product_number, as well as full_address
refine <- refine %>% 
  separate(Product.code...number, c("product_code", "product_number"), sep="-") %>%
  unite(full_address, address, city, country, sep = ", ") %>% 
  arrange(company)

### Correct the spelling mistakes of the company names
refine$company[1:7] = "akzo"
refine$company[8:16] = "philips"
refine$company[17:20] = "unilever"
refine$company[21:25] = "van houten"

### Set the product codes to their respective product category
attach(refine)  
refine$product_category[product_code == "p"] <- "Smartphone"
refine$product_category[product_code == "v"] <- "Laptop"
refine$product_category[product_code == "x"] <- "TV"
refine$product_category[product_code == "q"] <- "Tablet"

### Add four binary (1 or 0) columns for company
refine$company_philips[company == "philips"] <- 1
refine$company_philips[company != "philips"] <- 0
refine$company_akzo[company == "akzo"] <- 1
refine$company_akzo[company != "akzo"] <- 0
refine$company_van_houten[company == "van houten"] <- 1
refine$company_van_houten[company != "van houten"] <- 0
refine$company_unilever[company == "unilever"] <- 1
refine$company_unilever[company != "unilever"] <- 0

### Add four binary (1 or 0) columns for product category
refine$product_smartphone[product_category == "Smartphone"] <- 1
refine$product_smartphone[product_category != "Smartphone"] <- 0
refine$product_laptop[product_category == "Laptop"] <- 1
refine$product_laptop[product_category != "Laptop"] <- 0
refine$product_tv[product_category == "TV"] <- 1
refine$product_tv[product_category != "TV"] <- 0
refine$product_tablet[product_category == "Tablet"] <- 1
refine$product_tablet[product_category != "Tablet"] <- 0

print(refine)
