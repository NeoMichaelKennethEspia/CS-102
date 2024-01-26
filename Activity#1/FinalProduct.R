
product1 <- read.csv("FirstProduct.csv")
product2 <- read.csv("SecondProduct.csv")
product3 <- read.csv("ThirdProduct.csv")

merged_products <- rbind(product1, product2, product3)

write.csv(merged_products, "FinalProduct.csv", row.names = FALSE)