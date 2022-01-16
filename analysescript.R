#### Pakete laden: ----
library(tidyverse)
library(psych)
source("qualtricshelpers.R")

# Rohdaten einlesen: ----

#file.numeric <- ("data/data.csv")
file.text <- ("data/data2.csv")
raw.text <- read.csv("data/data2.csv")

raw <- load_qualtrics_csv(file.text)


# Testdaten und unvollständige Daten entfernen: ----
# Unvollständige Fragebögen und Speeder entfernen (>289 sec) 

raw %>%
  filter(Progress == 100) %>%
  filter(ResponseId != "R_3R4OScS5VgLUdgP") %>%
  filter(ResponseId != "R_31cpXUjQl3AD2Z9") %>%
  filter(ResponseId != "R_1mxEKQ5VWXf3lbw") %>%
  filter(ResponseId != "R_1NDKKME6r1Hfkai") -> raw

# Unnötige Spalten entfernen: ----

raw.short <- raw[,c(-1:-8, -10:-17)]

# Spalten umbennen: ----

# Ist an dieser Stelle nicht nötig!

# Richtige Skalenniveaus zuordnen: ----


generate_codebook(raw.short, file.text, "data/codebook.csv")

#Müssen alle Variablennamen klein geschrieben werden?
#codebook <- read_codebook("data/codebook_final.csv")
#names(raw.short) <- codebook$variable

raw.short$Geschlecht <- as.factor(raw.short$Geschlecht)

raw.short$Alter <- as.numeric(raw.short$Alter)

raw.short$Arbeitsumfeld <- as.factor(raw.short$Arbeitsumfeld)

raw.short$Bildungsabschluss <- ordered(raw.short$Bildungsabschluss, level = c("Kein Schulabschluss",
                                                                              "Volks- oder Hauptschulabschluss",
                                                                              "Realschulabschluss",
                                                                              "(Fach-)Abitur",
                                                                              "Abgeschlossene Ausbildung",
                                                                              "(Fach-)Hochschulabschluss"))



# Skalen berechnen: ----



# Item entfernen: ----



# RDS abspeichern: ----