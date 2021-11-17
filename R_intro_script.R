## 1. Instalando paquetes
library(ggplot2)
library(tidyverse)

## 2. Setando directorio
setwd("~/Dropbox/Postdoc_Rosario/BiodiversityGenomics_Winter2021/genomica_biodiversidad/material/")

f <- list.files()
txt <- list.files(pattern = ".txt")

## 3. Leyendo data
mus <- read.table("genes_ch1_mus_musculus.txt")

dim(mus)

## 4. Manipulando datos
colnames(mus) <- c("scaffold", "gene")
head(mus)

## pipes
mus <- as_tibble(mus)
mus2 <- mus %>% 
  rename(Scaffold = scaffold, Gene = gene) %>% 
  unite(Combined, Scaffold:Gene, sep = "_", remove = FALSE)
head(mus2)
#O
mus3 <- mus %>% 
  rename(Scaffold = scaffold, Gene = gene) %>% 
  mutate(Combined = paste(Scaffold, Gene, sep = "_"))
head(mus3)

# aumentemos la dificultad
mus_chr1 <- read_table2("Mus_musculus.GRCm38.75_chr1.gtf", comment = "#", col_names = F)

mus_chr1_sum <- mus_chr1 %>% count(X3)

#5. Graficos con ggplot
ggplot(mus_chr1_sum, aes(x=X3, y=n)) +
  geom_bar(stat="identity") +
  coord_flip()
