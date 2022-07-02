---
title: "Pembudidayaan Ikan Nasional"
author: "Rifaldi"
date: '2022-07-02'
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Import library

```{r library}
library(dplyr)
library(ggplot2)
```

## Read data csv

```{r read}
df <- read.csv("D:/Tugas/Semester 8/produksibudidayanasional.csv")
str(df)
```

## Selecting, Filtering and Aggregate data

```{r aggregate}
data_volume <- df %>% 
  select(-c(ID, ProvinsiID, Budidaya, IkanID, Nilai)) %>% 
  filter(NamaIkan != "total", Volume > 0) %>% 
  group_by(NamaIkan) %>% 
  summarise(total_volume=sum(Volume))
```

## Data Visualization

```{r Visualize}
ggplot(data_volume, aes(x= reorder(NamaIkan,total_volume), y=total_volume, fill=NamaIkan)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  labs(
    title = "Total Volume Budidaya Hewan Laut di Indonesia",
    subtitle = "Jenis hewan laut yang dibudidayakan di Indonesia",
    x = "Jenis Hewan Laut",
    y = "Total Volume")
```

