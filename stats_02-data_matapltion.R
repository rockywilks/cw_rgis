install.packages("tidyverse")
 install.packages("swirl")
library(tidyverse)
 
 set.seed(123)
 
 iris_sub <- as_tibble(iris) %>% 
   group_by(Species) %>% 
   sample_n(3) %>% 
   ungroup()
 
 print(iris_sub)
 
filter(iris_sub, Species == "virginica")
filter(iris_sub, Species %in% c("virginica")
filter(iris_sub, Species !=("setosa")

filter(iris_sub, petal.Length > 5,  Sepal.Length > 5)



arrange(iris_sub, desc(Sepal.Width))


iris_3 <- filter(iris_sub, Sepal.Width > 3) 



select(iris_sub, -c(sepal.length, - sepal.width))




select(iris_sub,contains("al"))


x_max <- nrow(iris_sub)
x <-1:x_max

mutate(iris_sub
       ,row_id = 1 nrow(iris_sub))

mutate(iris_sub, mu_sl + mean(sepal.length))

mutate(iris_sub, sep.area = sepal.length * sepal.width/2)

mutate(group_by(iris_sub,species), mu_sl = mean(sepal.length))


iris_sub %>% filter(species == "virginica")


iris_sub%>% 
  group_by (species) %>% 
  mutate (mu_sl = mean(sepal.length)) 
ungroup()

iris_pipe <- iris_sub %>%
  filter(species == "setosa") %>%
  mutate(pw_2times = 2*Petal.widith)

mean(iris_sub$Sepal.Length)
iris_sub %>% 
  group_by(species) %>%
  summarize(mu_sl + mean(Sepal.length),
            sum_sl = sum(Sepal.Length))










