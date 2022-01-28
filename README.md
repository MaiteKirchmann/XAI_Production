XAI_Production

============

### Inhaltsverzeichnis

1.  [Teammitglieder](#1-teammitglieder)
2.  [Forschungsfrage](#2-forschungsfrage)
3.  [Faktorenraum](#3-faktorenraum)
4.  [Szenariotext](#4-szenariotext)
5.  [Unterschiedshypothesen](#5-unterschiedshypothesen)
6.  [Zusammenhangshypothesen](#6-zusammenhangshypothesen)
7.  [Hypothesenauswertung](#7-hypothesenauswertung)
8.  [Qualitätskontrolle](#8-qualitätskontrolle)

### 1. Teammitglieder

Du Trang Nguyen, Maite Kirchmann, Katharina Jannes, Laura Schmitz

### 2. Forschungsfrage

Inwiefern wird die Nutzerakzeptanz von XAI im Produktionsumfeld beeinflusst?

### 3. Faktorenraum



------------------------------------------------------------------------


-----------------------------------------

<br>

### 4. Szenariotext

Musterbeispiel: Nüsse sortieren mithilfe von KI​

​

Wie bereits erwähnt, handelt diese Studie von XAI (explainable artificial intelligence = erklärbare künstliche Intelligenz) in der Produktion.​

​
Im Folgenden wollen wir Ihnen kurz erklären, was man darunter versteht. ​

Eine künstliche Intelligenz (KI) kann zum Beispiel in einer Maschine implementiert sein. Wird diese in der Produktion eingesetzt, so hat sie meist eine zugeordnete Aufgabe. In der Lebensmittelproduktion wird eine künstliche Intelligenz beispielsweise zum Vorsortieren von Nüssen eingesetzt. Dort hat sie die Aufgabe die Nüsse nach einer Norm zu sortieren. Diese Maschine wird im folgenden Nusssortierer genannt.    ​

Eine KI wird zu einer XAI wenn die Produktionsmitarbeitenden verstehen, anhand welcher Merkmale die KI die Nüsse aussortiert. ​

Ein Merkmal kann bei diesem Beispiel die Größe, die Oberflächenbeschaffenheit oder die Form der Nuss sein. Können die Mitarbeitenden diese Auswahlkriterien nachvollziehen, kann man von einer XAI sprechen. ​

​
Der Grad der Erklärbarkeit ist jedoch von Mensch zu Mensch verschieden. Deshalb unterscheidet sich auch die Akzeptanz der KI in der Produktion individuell.​
​
Die Erhebung wird durchgeführt, um der Beantwortung der Frage näher zu kommen, wie die Nutzerakzeptanz einer KI beeinflusst wird.

------------------------------------------------------------------------

<br>

### 5. Unterschiedshypothesen:

#### Hypothese 1

-   ProduktionsmitarbeiterInnen unterscheiden sich von ArbeitnehmerInnen anderer Fachbereiche in Bezug auf die Akzeptanz von KI.
-   H0: 
-   H1: 


 MANCOVA

 Multivariate Tests                                                                            
 ───────────────────────────────────────────────────────────────────────────────────────────── 
                                          value         F            df1    df2    p           
 ───────────────────────────────────────────────────────────────────────────────────────────── 
   arbeitsumfeld    Pillai's Trace        0.03438223    0.6527850      3     55    0.5846143   
                    Wilks' Lambda          0.9656178    0.6527850      3     55    0.5846143   
                    Hotelling's Trace     0.03560646    0.6527850      3     55    0.5846143   
                    Roy's Largest Root    0.03560646    0.6527850      3     55    0.5846143   
 ───────────────────────────────────────────────────────────────────────────────────────────── 


 Univariate Tests                                                                                             
 ──────────────────────────────────────────────────────────────────────────────────────────────────────────── 
                    Dependent Variable      Sum of Squares    df    Mean Square    F              p           
 ──────────────────────────────────────────────────────────────────────────────────────────────────────────── 
   arbeitsumfeld    Akz_UmgangTechnik          0.088883850     1    0.088883850    0.191508003    0.6633182   
                    Akz_Zufriedenheit          0.001020350     1    0.001020350    0.003063725    0.9560524   
                    Akz_Verhaltensabsich       0.224505414     1    0.224505414    0.406046704    0.5265341   
   Residuals        Akz_UmgangTechnik         26.455183946    57    0.464126034                               
                    Akz_Zufriedenheit         18.983414101    57    0.333042353                               
                    Akz_Verhaltensabsich      31.515607581    57    0.552905396                               
 ──────────────────────────────────────────────────────────────────────────────────────────────────────────── 

#### Hypothese 2

-   ProduktionsmitarbeiterInnen jüngerer Generation unterscheiden sich von ProduktionsmitarbeiterInnen älterer Generation in Bezug auf die Akzeptanz von KI.
-   H0: 
-   H1: 

Welch Two Sample t-test

data:  filter(Cleandata, alter_Binary == "low")$Akz_Verhaltensabsich and filter(Cleandata, alter_Binary == "high")$Akz_Verhaltensabsich
t = 0.75618, df = 45.905, p-value = 0.4534
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
 -0.2482906  0.5470617
sample estimates:
mean of x mean of y 
 5.161290  5.011905

#### Hypothese 3

-   Frauen unterscheiden sich von Männern in Bezug auf die Akzeptanz von KI.

Welch Two Sample t-test

data:  filter(Cleandata, geschlecht == "Männlich")$Akz_UmgangTechnik and filter(Cleandata, geschlecht == "Weiblich")$Akz_UmgangTechnik
t = 1.7139, df = 55.605, p-value = 0.09211
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
 -0.04943964  0.63462483
sample estimates:
mean of x mean of y 
 4.700000  4.407407


------------------------------------------------------------------------

<br>

### 6. Zusammenhangshypothesen

#### Hypothese 1

-   Je höher die Transparenzempfindung ist, desto höher ist auch die Akzeptanz.

Kendall's rank correlation tau

data:  Cleandata$XAI_Transparenz and Cleandata$Akz_Verhaltensabsich
z = 4.1072, p-value = 4.005e-05
alternative hypothesis: true tau is not equal to 0
sample estimates:
     tau 
0.405948 

#### Hypothese 2

-   Je höher die Offenheit gegenüber Veränderungen, desto höher ist die Bereitschaft mit KI zusammenarbeiten. 

Kendall's rank correlation tau

data:  Cleandata$UmgangVeränderung and Cleandata$Akz_Verhaltensabsich
z = 2.1491, p-value = 0.03163
alternative hypothesis: true tau is not equal to 0
sample estimates:
      tau 
0.2128912

#### Hypothese 3

-   Je mehr Technik genutzt wird, desto höher ist die Bereitschaft mit KI zusammenarbeiten. 

#### komplexe Zusammenhangshypothese

#### Hypothese 1

-   Die Akzeptanz ist abhängig von Offenheit gegenüber Veränderungen, dem Verständnis für Funktionalität und der Erfahrung mit KI.

Call:
lm(formula = Akz_Verhaltensabsich ~ UmgangVeränderung + KI_Verständnis + 
    KI_Erfahrung, data = Cleandata)

Residuals:
    Min      1Q  Median      3Q     Max 
-1.5249 -0.3152  0.1293  0.4373  1.1048 

Coefficients:
                  Estimate Std. Error t value Pr(>|t|)    
(Intercept)        1.89327    0.71007   2.666 0.010050 *  
UmgangVeränderung  0.13062    0.15036   0.869 0.388793    
KI_Verständnis     0.53629    0.13767   3.896 0.000268 ***
KI_Erfahrung       0.07609    0.16958   0.449 0.655405    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.6097 on 55 degrees of freedom
Multiple R-squared:  0.3559,	Adjusted R-squared:  0.3208 
F-statistic: 10.13 on 3 and 55 DF,  p-value: 2.055e-05

#### Hypothese 2

-   Die Akzeptanz ist abhängig von dem Verständnis für Funktionalität, der Transparenzempfindung, der Erfahrung und der Erwartung von KI. 

Call:
lm(formula = Akz_Verhaltensabsich ~ KI_Verständnis + XAI_Transparenz + 
    KI_Erfahrung + KI_Erwartung, data = Cleandata)

Residuals:
    Min      1Q  Median      3Q     Max 
-1.4413 -0.3701  0.1560  0.3633  1.0433 

Coefficients:
                Estimate Std. Error t value Pr(>|t|)  
(Intercept)      1.66563    0.67241   2.477   0.0164 *
KI_Verständnis   0.34789    0.16846   2.065   0.0437 *
XAI_Transparenz  0.24114    0.15519   1.554   0.1261  
KI_Erfahrung     0.04059    0.16932   0.240   0.8115  
KI_Erwartung     0.14205    0.14121   1.006   0.3189  
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.5968 on 54 degrees of freedom
Multiple R-squared:  0.394,	Adjusted R-squared:  0.3492 
F-statistic: 8.779 on 4 and 54 DF,  p-value: 1.556e-05


------------------------------------------------------------------------

<br>

### 7. Hypothesenauswertung

#### Unterschiedshypothesen

#### Hypothese 1:

“.”

Ergebnis: Es gibt einen signifikanten Unterschied zwischen den beiden
getesteten Gruppen in Bezug auf die Offenheit gegenüber Veränderungen.
(*t*(183, 78) =  − 3, 62 ,*p* &lt; 0.001).

<br>

#### Hypothese 2:

“”

Ergebnis: Es gibt einen signifikanten Unterschied zwischen den beiden
getesteten Gruppen in Bezug auf die allgemeine Arbeitszufriedenheit.
(*t*(240, 05) =  − 8, 44 ,*p* &lt; 0.001).

png?

<br> <br>

#### Hypothese 3:

“Männer und Frauen unterscheiden sich in Bezug auf die Akzeptanz im Umgang mit Technik.”

Ergebnis: Es gibt keinen signifikanten Unterschied zwischen den beiden getesteten Gruppen 
in Bezug auf die Akzeptanz im Umgang mit Technik. 
(*t*(54.662) = 1.9854 ,*p* > 0.05)


Welch Two Sample t-test

data:  filter(Cleandata, geschlecht == "Männlich")$Akz_UmgangTechnik and filter(Cleandata, geschlecht == "Weiblich")$Akz_UmgangTechnik
t = 1.985, df = 54.662, p-value = 0.05217
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
 -0.003254863  0.672485632
sample estimates:
mean of x mean of y 
 4.700000  4.365385


<br> <br>

#### Zusammenhangshypothesen

#### Hypothese 1:





<br> <br>

#### Hypothese 2:



<br> <br>

#### Hypothese 3:



<br> <br>

#### Hypothese 4:



<br>

------------------------------------------------------------------------

### 8. Qualitätskontrolle


