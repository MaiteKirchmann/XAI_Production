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
  filter(Progress == 100) -> raw

#filter(ResponseId != "R_3R4OScS5VgLUdgP") %>%
#filter(ResponseId != "R_31cpXUjQl3AD2Z9") %>%
#filter(ResponseId != "R_1mxEKQ5VWXf3lbw") %>%
#filter(ResponseId != "R_1NDKKME6r1Hfkai")


# Unnötige Spalten entfernen: ----

raw.short <- raw[,c(-1:-8, -10:-17)]

# Spalten umbennen: ----

# Ist an dieser Stelle nicht nötig!


generate_codebook(raw.short, file.text, "data/codebook.csv")

#Müssen alle Variablennamen klein geschrieben werden?

codebook <- read_codebook("data/codebook_final.csv")

names(raw.short) <- codebook$variable

# Richtige Skalenniveaus zuordnen: ----

raw.short$geschlecht <- as.factor(raw.short$geschlecht)

raw.short$alter <- as.numeric(raw.short$alter)

raw.short$arbeitsumfeld <- as.factor(raw.short$arbeitsumfeld)

raw.short$bildungsabschluss <- ordered(raw.short$bildungsabschluss, level = c("Kein Schulabschluss",
                                                                              "Volks- oder Hauptschulabschluss",
                                                                              "Realschulabschluss",
                                                                              "(Fach-)Abitur",
                                                                              "Abgeschlossene Ausbildung",
                                                                              "(Fach-)Hochschulabschluss"))

scale.zustimmung <- c("stimme gar nicht zu",
                      "stimme nicht zu",
                      "stimme eher nicht zu",
                      "stimme eher zu",
                      "stimme zu",
                      "stimme völlig zu")

raw.short$akz_Techniknutzung <- as.factor(raw.short$akz_Techniknutzung)

scale.zustimmungKa <- c("stimme gar nicht zu",
                        "stimme nicht zu",
                        "stimme eher nicht zu",
                        "stimme eher zu",
                        "stimme zu",
                        "stimme völlig zu",
                        "keine Angabe")

raw.short$umgangVeränderung_1 <- ordered(raw.short$umgangVeränderung_1, levels = scale.zustimmung)
raw.short$umgangVeränderung_2 <- ordered(raw.short$umgangVeränderung_2, levels = scale.zustimmung)
raw.short$umgangVeränderung_3 <- ordered(raw.short$umgangVeränderung_3, levels = scale.zustimmung)
raw.short$umgangVeränderung_4 <- ordered(raw.short$umgangVeränderung_4, levels = scale.zustimmung)
raw.short$umgangVeränderung_5 <- ordered(raw.short$umgangVeränderung_5, levels = scale.zustimmung)
raw.short$umgangVeränderung_6 <- ordered(raw.short$umgangVeränderung_6, levels = scale.zustimmung)
raw.short$umgangVeränderung_7 <- ordered(raw.short$umgangVeränderung_7, levels = scale.zustimmung)

raw.short$akz_UmgangTechnik_1 <- ordered(raw.short$akz_UmgangTechnik_1, levels = scale.zustimmung)
raw.short$akz_UmgangTechnik_2 <- ordered(raw.short$akz_UmgangTechnik_2, levels = scale.zustimmung)
raw.short$akz_UmgangTechnik_3 <- ordered(raw.short$akz_UmgangTechnik_3, levels = scale.zustimmung)
raw.short$akz_UmgangTechnik_4 <- ordered(raw.short$akz_UmgangTechnik_4, levels = scale.zustimmung)
raw.short$akz_UmgangTechnik_5 <- ordered(raw.short$akz_UmgangTechnik_5, levels = scale.zustimmung)
raw.short$akz_UmgangTechnik_6 <- ordered(raw.short$akz_UmgangTechnik_6, levels = scale.zustimmung)
raw.short$akz_UmgangTechnik_7 <- ordered(raw.short$akz_UmgangTechnik_7, levels = scale.zustimmung)
raw.short$akz_UmgangTechnik_8 <- ordered(raw.short$akz_UmgangTechnik_8, levels = scale.zustimmung)
raw.short$akz_UmgangTechnik_9 <- ordered(raw.short$akz_UmgangTechnik_9, levels = scale.zustimmung)
raw.short$akz_UmgangTechnik_10 <- ordered(raw.short$akz_UmgangTechnik_10, levels = scale.zustimmung)

raw.short$akz_Zufriedenheit_1 <- ordered(raw.short$akz_Zufriedenheit_1, levels = scale.zustimmung)
raw.short$akz_Zufriedenheit_2 <- ordered(raw.short$akz_Zufriedenheit_2, levels = scale.zustimmung)
raw.short$akz_Zufriedenheit_3 <- ordered(raw.short$akz_Zufriedenheit_3, levels = scale.zustimmung)
raw.short$akz_Zufriedenheit_4 <- ordered(raw.short$akz_Zufriedenheit_4, levels = scale.zustimmung)
raw.short$akz_Zufriedenheit_5 <- ordered(raw.short$akz_Zufriedenheit_5, levels = scale.zustimmung)
raw.short$akz_Zufriedenheit_6 <- ordered(raw.short$akz_Zufriedenheit_6, levels = scale.zustimmung)
raw.short$akz_Zufriedenheit_7 <- ordered(raw.short$akz_Zufriedenheit_7, levels = scale.zustimmung)

raw.short$akz_Verhaltensabsich_1 <- ordered(raw.short$akz_Verhaltensabsich_1, levels = scale.zustimmung)
raw.short$akz_Verhaltensabsich_2 <- ordered(raw.short$akz_Verhaltensabsich_2, levels = scale.zustimmung)
raw.short$akz_Verhaltensabsich_3 <- ordered(raw.short$akz_Verhaltensabsich_3, levels = scale.zustimmung)

raw.short$kI_Verständnis_1 <- ordered(raw.short$kI_Verständnis_1, levels = scale.zustimmung)
raw.short$kI_Verständnis_2 <- ordered(raw.short$kI_Verständnis_2, levels = scale.zustimmung)
raw.short$kI_Verständnis_3 <- ordered(raw.short$kI_Verständnis_3, levels = scale.zustimmung)
raw.short$kI_Verständnis_4 <- ordered(raw.short$kI_Verständnis_4, levels = scale.zustimmung)
raw.short$kI_Verständnis_5 <- ordered(raw.short$kI_Verständnis_5, levels = scale.zustimmung)
raw.short$kI_Verständnis_6 <- ordered(raw.short$kI_Verständnis_6, levels = scale.zustimmung)
raw.short$kI_Verständnis_7 <- ordered(raw.short$kI_Verständnis_7, levels = scale.zustimmung)

raw.short$xai_Transparenz_1 <- ordered(raw.short$xai_Transparenz_1, levels = scale.zustimmung)
raw.short$xai_Transparenz_2 <- ordered(raw.short$xai_Transparenz_2, levels = scale.zustimmung)
raw.short$xai_Transparenz_3 <- ordered(raw.short$xai_Transparenz_3, levels = scale.zustimmung)
raw.short$xai_Transparenz_4 <- ordered(raw.short$xai_Transparenz_4, levels = scale.zustimmung)
raw.short$xai_Transparenz_5 <- ordered(raw.short$xai_Transparenz_5, levels = scale.zustimmung)
raw.short$xai_Transparenz_6 <- ordered(raw.short$xai_Transparenz_6, levels = scale.zustimmung)

raw.short$kI_Erwartung_1 <- ordered(raw.short$kI_Erwartung_1, levels = scale.zustimmung)
raw.short$kI_Erwartung_2 <- ordered(raw.short$kI_Erwartung_2, levels = scale.zustimmung)
raw.short$kI_Erwartung_3 <- ordered(raw.short$kI_Erwartung_3, levels = scale.zustimmung)
raw.short$kI_Erwartung_4 <- ordered(raw.short$kI_Erwartung_4, levels = scale.zustimmung)
raw.short$kI_Erwartung_5 <- ordered(raw.short$kI_Erwartung_5, levels = scale.zustimmung)
raw.short$kI_Erwartung_6 <- ordered(raw.short$kI_Erwartung_6, levels = scale.zustimmung)

raw.short$kI_Erfahrung_1 <- ordered(raw.short$kI_Erfahrung_1, levels = scale.zustimmung)
raw.short$kI_Erfahrung_2 <- ordered(raw.short$kI_Erfahrung_2, levels = scale.zustimmung)
raw.short$kI_Erfahrung_3 <- ordered(raw.short$kI_Erfahrung_3, levels = scale.zustimmung)
raw.short$kI_Erfahrung_4 <- ordered(raw.short$kI_Erfahrung_4, levels = scale.zustimmung)
raw.short$kI_Erfahrung_5 <- ordered(raw.short$kI_Erfahrung_5, levels = scale.zustimmung)

# Skalen berechnen: ----

schluesselliste <- list(
  UmgangVeränderung = c("-umgangVeränderung_1", "umgangVeränderung_2", "umgangVeränderung_3", "umgangVeränderung_4", "-umgangVeränderung_5", "umgangVeränderung_6", "-umgangVeränderung_7"),
  Akz_UmgangTechnik = c("akz_UmgangTechnik_1", "akz_UmgangTechnik_2","-akz_UmgangTechnik_3","-akz_UmgangTechnik_4","akz_UmgangTechnik_5","akz_UmgangTechnik_6","akz_UmgangTechnik_7","akz_UmgangTechnik_8","akz_UmgangTechnik_9","akz_UmgangTechnik_10"),
  Akz_Zufriedenheit = c("akz_Zufriedenheit_1", "akz_Zufriedenheit_2","-akz_Zufriedenheit_3","-akz_Zufriedenheit_4","-akz_Zufriedenheit_5","akz_Zufriedenheit_6","akz_Zufriedenheit_7"),
  Akz_Verhaltensabsich = c("akz_Verhaltensabsich_1", "akz_Verhaltensabsich_2","akz_Verhaltensabsich_3"),
  KI_Verständnis = c("kI_Verständnis_1", "kI_Verständnis_2", "kI_Verständnis_3", "-kI_Verständnis_4", "kI_Verständnis_5", "kI_Verständnis_6", "kI_Verständnis_7"),
  XAI_Transparenz = c("xai_Transparenz_1", "xai_Transparenz_2", "xai_Transparenz_3", "-xai_Transparenz_4", "-xai_Transparenz_5", "xai_Transparenz_6"),
  KI_Erwartung = c("kI_Erwartung_1", "kI_Erwartung_2", "kI_Erwartung_3", "kI_Erwartung_4", "-kI_Erwartung_5", "-kI_Erwartung_6"), 
  KI_Erfahrung = c("kI_Erfahrung_1", "-kI_Erfahrung_2", "kI_Erfahrung_3", "kI_Erfahrung_4", "kI_Erfahrung_5")
)

scores <- scoreItems(schluesselliste, items = raw.short, missing = TRUE, min = 1, max = 6)

scores_before <- scores$alpha

data <- bind_cols(raw.short, as_tibble(scores$scores))

# Item entfernen: ----

data <- data %>% 
  select(-starts_with("umgangVeränderung", ignore.case = F)) %>% 
  select(-starts_with("akz", ignore.case = F)) %>%
  select(-starts_with("kI", ignore.case = F)) %>%
  select(-starts_with("xai", ignore.case = F))


# RDS abspeichern: ----

saveRDS(data, "data/clean_data.rds")


