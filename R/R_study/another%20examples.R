library("cluster")
library("factoextra")
library("magrittr")

# Load  and prepare the data
data("USArrests")
my_data <- USArrests %>%
  na.omit() %>%          # Remove missing values (NA)
  scale()                # Scale variables
# View the firt 3 rows
head(my_data, n = 3)

res.dist <- get_dist(USArrests, stand = TRUE, method = "pearson")
fviz_dist(res.dist,
          gradient = list(low = "#00AFBB", mid = "white", high = "#FC4E07"))

fviz_nbclust(my_data, kmeans, method = "gap_stat")

set.seed(123)
km.res <- kmeans(my_data, 3, nstart = 25)
# Visualize
# library("factoextra")
fviz_cluster(km.res, data = my_data,
             ellipse.type = "convex",
             palette = "jco",
             ggtheme = theme_minimal())
library(dplyr)
USArrests %>%
  mutate(Cluster = km.res$cluster) %>%
  group_by(Cluster) %>%
  summarise_all("mean")

# Compute PAM
library("cluster")
pam.res <- pam(my_data, 3)
# Visualize
fviz_cluster(pam.res)


