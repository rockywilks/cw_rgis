library(tidyverse)

iris %>% 
  ggplot(
    aes(x = Sepal.Length,
        y = Sepal.Width)
  ) + 
  geom_point()

# point figure ------------------------------------------------------------

## Shift + Ctr + M for pipe
iris %>% 
  ggplot(aes(x = Sepal.Length,
             y = Sepal.Width ,
             color = Species)
         )+
  geom_point()

iris %>% 
  ggplot(aes(x = Sepal.Length,
             y = Sepal.Width)
         ) +
  geom_point(color = "darkgreen")


# line figure -------------------------------------------------------------

df_x <- tibble(x = 1:50,
       y = 2 * x)

df_x %>%  
  ggplot(
    aes(x = x,
        y = y)
  ) +
  geom_line()

# histogram ---------------------------------------------------------------

iris %>% 
  ggplot(
    aes(x = Sepal.Length)
  ) +
  geom_histogram()

# box plot ----------------------------------------------------------------

iris %>% 
  ggplot(
    aes(x = Species,
        y = Sepal.Length)
  ) +
  geom_boxplot()
    

# change color ------------------------------------------------------------

iris %>%  
  ggplot(
    aes(x = Species,
        y = Sepal.Length,
        color = Species)
  ) +
  geom_boxplot()



# change inside box plot --------------------------------------------------

iris %>% 
  ggplot(
    aes(x = Species,
        y = Sepal.Length,
        fill = Species)
  ) +
  geom_boxplot()



# exersize ----------------------------------------------------------------

iris %>% 
  arrange (desc(Sepal.Length))

#Q2

iris %>% 
  filter((Sepal.Width) >3.0)
    
#Q3

 df_petal <- iris %>% 
   select(Petal.Length, Petal.Width) %>% 
   arrange(desc(Petal.Length))
 
 #Q4
 iris %>% 
 group_by(Species) %>% 
   summarise(mean = mean(Sepal.Width))
#Q5
 
 iris %>% 
   ggplot(aes(x = Petal.Width,
              y = Sepal.Width,
              color = Species)
          ) +
   geom_point( )

 





             