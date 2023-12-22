---
  title: "InfStats"
author: "Pep Guardiola"
date: "2023-07-08"
output: html_document
---

  ```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE, message = FALSE, warning = FALSE)
```

## Importing Data
```{r}
college <- read.csv ("college.csv")
```

```{r}
install.packages("apa")
install.packages("ggpubr")
```

## Loading libraries
```{r}
library(tidyverse)
library(dplyr)
library(skimr)
library(janitor)
library(here)
library(kableExtra)
library(ggthemes)
library(broom)
library(rstatix)
library(correlation)
library(lm.beta)
library(psych)
```

```{r}
college %>%
  t_test(weight_2 ~ smokes)
```
```{r}
college %>%
  t_test(weight_2 ~ smokes, var.equal = TRUE)
```
```{r}
college %>%
  t_test(weight_2 ~ smokes, var.equal = TRUE, detailed = TRUE)
```
```{r}
college %>%
  t_test(weight_2 ~ smokes, var.equal = TRUE, detailed = TRUE, alternative = "greater")
```
```{r}
college %>%
  t_test(act_english ~ gender, var.equal = TRUE,
         comparisons = list(c("Male","Female")))
```
```{r}
college %>%
  t_test(act_english ~ gender, var.equal = TRUE, detailed = TRUE,
         comparisons = list(c("Male","Female")))
```
## Dependent T Test
```{r}
college %>%
  select(weight_1, weight_2) %>%
  pivot_longer(cols = everything(),
               names_to = "time",
               values_to = "weight",
               names_prefix = "weight_") %>%
  t_test(weight ~ time, paired = TRUE)
```

```{r}
hospital_data <- data.frame(
  age_group= c("Under50", "Over50", "Under50", "Over50", "Over50"),
  hospital_visits = c(4, 3, 2, 5, 2)
)

mean(hospital_data$hospital_visits)
```

```{r}
hospital_data <- data.frame(
  age_group= c("Under50", "Over50", "Under50", "Over50", "Over50"),
  hospital_visits = c(4, 3, 2, 5, 2)
)

aggregate(hospital_visits ~ age_group, data = hospital_data, FUN = mean)
```
```{r}
city_data <- data.frame(
  city= c("New York", "New York", "New York","New York", "Chicago", "Chicago", "Chicago", "Chicago"),
  category = c("Transportation", "Deli Sandwiches", "Subways", "BK", "Transportation", "Healthcare", "Socioeconomics", "Safety"),
  score = c(70, 75, 65, NA, 78, 80, 70, NA)
)
```

```{r}
city_data <- data.frame(
  city= c("New York", "New York", "New York","New York", "Chicago", "Chicago", "Chicago", "Chicago"),
  category = c("Transportation", "Healthcare", "Socioeconomics", "Safety", "Transportation", "Healthcare", "Socioeconomics", "Safety"),
  score = c(70, 75, 65, NA, 78, 80, 70, NA)
)

city_data %>%
  drop_na() %>%
  pivot_wider(names_from = category, values_from = score)

```
```{r}
install.packages("bnlearn")
```
```{r}
# Load the bnlearn package
library(bnlearn)

# Load the example data
data(Asia)

# Learn the structure of the Bayesian network
bn <- learn.bn(Asia, method="Chow-Liu")

# Learn the parameters of the Bayesian network
bn.fit <- fit.bn(bn, data=Asia)

# Plot the Bayesian network
plot(bn.fit)

# Make predictions using the Bayesian network
newdata <- data.frame(Smoking=c("Yes", "No"),
                      Lung_Cancer=c("No", "Yes"))
predictions <- predict(bn.fit, newdata=newdata)
```

```{r}
install.packages("http://www.bnlearn.com/releases/bnlearn_latest.tar.gz")
```

```{r}
require(bnlearn)

data(alarm)
hc_alarm <- hc(alarm)
```

```{r}
install.packages("Rgraphviz")
```

```{r}
library(bnlearn)
library(Rgraphviz)
```