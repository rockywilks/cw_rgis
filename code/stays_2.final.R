
library(tidyverse)



iris_sub <- as_tibble(iris) %>%
  group_by(Species) %>%
  sample_n(3) %>%
  ungroup()

print(iris_sub)

# Filter by species
filter(iris_sub, Species == "virginica")
filter(iris_sub, Species == "setosa")

# Multiple conditions
filter(iris_sub, Petal.Length > 5, Sepal.Length > 5)

# Sort descending
arrange(iris_sub, desc(Sepal.Width))

# Create subset
iris_3 <- filter(iris_sub, Sepal.Width > 3)

# Select columns (remove Sepal.Length and Sepal.Width)
select(iris_sub, -Sepal.Length, -Sepal.Width)

# Select columns containing "al"
select(iris_sub, contains("al"))

# Row numbering
x_max <- nrow(iris_sub)
x <- 1:x_max

# Add row ID
mutate(iris_sub, row_id = 1:nrow(iris_sub))

# Add overall mean Sepal Length
mutate(iris_sub, mu_sl = mean(Sepal.Length))

# Add sepal area
mutate(iris_sub,
       sep_area = Sepal.Length * Sepal.Width / 2)

# Add group mean Sepal Length
iris_sub %>%
  group_by(Species) %>%
  mutate(mu_sl = mean(Sepal.Length))

# Filter with pipe
iris_sub %>%
  filter(Species == "virginica")

# Grouped mutate
iris_sub %>%
  group_by(Species) %>%
  mutate(mu_sl = mean(Sepal.Length)) %>%
  ungroup()

# Filter and create new variable
iris_pipe <- iris_sub %>%
  filter(Species == "setosa") %>%
  mutate(pw_2times = 2 * Petal.Width)

# Mean Sepal Length
mean(iris_sub$Sepal.Length)

# Group summaries
iris_sub %>%
  group_by(Species) %>%
  summarize(
    mu_sl = mean(Sepal.Length),
    sum_sl = sum(Sepal.Length)
  )
