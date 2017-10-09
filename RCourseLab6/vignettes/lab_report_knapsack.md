---
title: <center>"A package of knapsack problem solution using three algorithms"</center>
author: <center>"Farhana chowdhury Tondra,Syeda Farha Shazmeen"</center>
subtitle: <center>"farch587@student.liu.se, syesh076@student.liu.se"</center>
date: "2017-10-09"
output: rmarkdown::html_vignette
vignette: >
  %\VignetteIndexEntry{A package of knapsack problem solution using three algothims}
   %\VignetteEngine{knitr::knitr}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}{inputenc}
---

**RCourseLab6** is entitled for the students who took the Advanced R course. This lab is based on popular knapsack problem which is adiscrete optimization problem. A knapsack can take upto highest capacity W and we have n number of items which have values v~i with weights w~i. To get the the largest value of the elements that can be added to the knapsack we have to solve the problem. The problem can be solved by several approaches.Among them the package **RCourseLab** implements **brute force algorithm**,**dynamic programming** & **greedy heuristic approach**. 



As usual to the other packages there is **/R** folder, where all three implemented algorithms are kept as .R file. **/Data** folder contains a.rda file of knapsack_objects which is a dataframe consisting of values and weights. **/test** folder contains implemented testcases for the functions. All .rd files are situdated inside **/man** folder and .Rmd file containing the vignette documentation is inside the **/vignettes** folder.



##knapsack_objects:

This file contains a dataframe where a number of items n, each with a weight w~i~ and a value v~i~.



```r
set.seed(42)
n <- 2000
knapsack_objects <-
data.frame(
w=sample(1:4000, size = n, replace = TRUE),
v=runif(n = n, 0, 10000)
)
```

data was saved by 


```r
#devtools::use_data("knapsack_objects", pkg="RCourseLab4")
```

And to load data , 


```r
#load("./knapsack_objects.rda")
```


##brute_force_knapsack()

The only solution that is guaranteed to give a correct answer in all situations for the knapsack problem is using brute-force search, i.e. going through all possible alternatives and return the maximum value found. This approach is of complexity O(2^n^) since all possible combinations 2^n^ needs to be evaluated.

This function takes a data frame X and a highest capacity W and returns the maximum knapsack value and the elements of it. The input values are non-negative integer values.


The code is implemented using below psuedocode:


```r
for i = 1 to 2^n^ do
      j <- n
      tempWeight<-0
      tempValue<-0
    while ( A[j] != 0 and j > 0)
          A[j]<- 0
          j<- j – 1
    A[j]<- 1
    for k <- 1 to n do
          if (A[k] = 1) then
          tempWeight<-tempWeight + Weights[k]
          tempValue<-tempValue + Values[k]
    if ((tempValue > bestValue) AND (tempWeight  Capacity)) then
          bestValue<-tempValue
          bestWeight<-tempWeight
          bestChoice<-A
    return bestChoice
```



```r
 brute_force_knapsack(x = knapsack_objects[1:8,], W = 3500)
 brute_force_knapsack(x = knapsack_objects[1:12,], W = 2000)
```

When the n=12 and weight= 3500,


```r
library(RCourseLab6)
brute_force_knapsack_8<-system.time(brute_force_knapsack(x = knapsack_objects[1:12,], W = 3500))
brute_force_knapsack_8
```

```
##    user  system elapsed 
##    0.09    0.00    0.09
```

When the n=16, and weight= 3500,


```r
brute_force_knapsack_16<-system.time(brute_force_knapsack(x = knapsack_objects[1:16,], W = 3500))
brute_force_knapsack_16
```

```
##    user  system elapsed 
##    0.22    0.00    0.22
```

**It can be stated that the complexity increases with increasing of n and that why the execution time increases almost 2 times with increases of n.**

When the n=16, weight= 2000,


```r
brute_force_knapsack_16<-system.time(brute_force_knapsack(x = knapsack_objects[1:16,], W = 2000))
brute_force_knapsack_16
```

```
##    user  system elapsed 
##    0.25    0.00    0.25
```


That means ,** with increasing values of n the execution time has also increased.**

**Question : ** How much time does it takes to run the algorithm for n = 16 objects?

**Answer : ** It takes more time than n=8 and n=12.

##knapsack_dynamic():

This algorithm calculates the mmaximum knapsack value by computing the solutions to the subsub-problems
once and then store the solutions in a table, so that they can be reused (repeatedly) later.
Input values are a data frame X and a highest capacity W and returns the maximum knapsack value and the elements of it. The input values are non-negative integer values. This algorithms complexity is O(Wn)

The followed pseudocode is given below:


```r
for i = 0 to N do
     for j = 0 to Capacity
          if j < Weights[i] then
                Table[i, j]<-Table[i-1, j]
          else
                Table[i, j]<-maximum { Table[i-1, j]
                            AND
                Values[i] + Table[i-1, j – Weights[i]]
  
return Table[N, Capacity]
```




```r
 knapsack_dynamic(x=knapsack_objects[1:8,], W = 3500)
```

```
## $value
## [1] 16770
## 
## $elements
## [1] 5 8
```

```r
 knapsack_dynamic(x=knapsack_objects[1:12,], W = 2000)
```

```
## $value
## [1] 15428
## 
## $elements
## [1] 3 8
```

So the results are same as the results of Brute Force Algorithm.

Now, the execution evaluation:
When the n=12 and weight= 3500,


```r
knapsack_dynamic_12<-system.time(knapsack_dynamic(x=knapsack_objects[1:12,], W = 3500))
knapsack_dynamic_12
```

```
##    user  system elapsed 
##    0.04    0.00    0.03
```

**It can be stated that the execution time of knapsack_dynamic is far less than brute force algorihtm **

When the n=500, and weight= 3500,


```r
knapsack_dynamic_500<-system.time(knapsack_dynamic(x=knapsack_objects[1:500,], W = 3500))
knapsack_dynamic_500
```

```
##    user  system elapsed 
##    0.89    0.00    0.89
```


so, **For large n the execution time is greater than the execution time of small n.**


When the n=500, weight= 2000,


```r
knapsack_dynamic_500<-system.time(knapsack_dynamic(x=knapsack_objects[1:500,], W = 2000))
knapsack_dynamic_500
```

```
##    user  system elapsed 
##    0.36    0.00    0.36
```

However, **for smaller capacity, the execution time is smaller for the same number of values.**

**Question : ** How much time does it takes to run the algorithm for n = 500 objects?

**Answer : ** The execution time increases as the n increases.

For comparing with greedy: 

When the n=800, weight= 3500,


```r
knapsack_dynamic(x=knapsack_objects[1:800,], W = 3500)
```

```
## $value
## [1] 195283
## 
## $elements
##  [1]  37  43  55  80  92 110 117 229 234 243 255 282 288 290 300 303 332
## [18] 345 346 400 436 472 500 537 574 577 599 719 747 764 776 794
```

```r
knapsack_dynamic_800<-system.time(knapsack_dynamic(x=knapsack_objects[1:800,], W = 3500))
knapsack_dynamic_800
```

```
##    user  system elapsed 
##    1.43    0.01    1.45
```

##greedy_knapsack():

This is an optimization solution which always makes the choice that looks best at the moment and adds it to the current subsolution. This algorithm will not give an exact result (but it can be shown that it will return at least 50% of the true maximum value), but it will reduce the computational complexity considerably (actually to O(nlogn) due to the sorting
part of the algorithm). Input values are a data frame X and a highest capacity W and returns the maximum knapsack value and the elements of it. The input values are non-negative integer values.


Below mentioned pseudocode is used to construct the greedy function:



```r
Integer CumWeight
Compute the value-to-weight ratios r~i~ = v~i~ / w~i~ ,i = 1, …, N, for the items given

Sort the items in non-increasing order of the value-to-weight ratios

for all items do
      if the current item on the list fits into the knapsack then
             place it in the knapsack
      else
             proceed to the next one
```



```r
  greedy_knapsack(x = knapsack_objects[1:800,], W = 3500)
```

```
## $value
## [1] 192647
## 
## $elements
##  [1]  92 574 472  80 110 537 332 117  37 776 577 288 234 255 500 794  55
## [18] 290 436 346 282 764 599 303 345 300 243  43 747  35  77 229 719 564
```

```r
  greedy_knapsack(x = knapsack_objects[1:1200,], W = 2000)
```

```
## $value
## [1] 212337
## 
## $elements
##  [1]   92  574  472   80  110  840  537 1000  332  117   37 1197 1152  947
## [15]  904  776  577  288 1147 1131  234  255 1006  833 1176 1092  873  828
## [29] 1059  500 1090  794 1033
```

** So, it can be stated that, the algorithm did not give the exact value of maximum knapsack where the dynamic algorithm gives.**

Now, the execution evaluation:
When the n=800 and weight= 3500,


```r
greedy_knapsack_800<-system.time(greedy_knapsack(x = knapsack_objects[1:1200,], W = 3500))
greedy_knapsack_800
```

```
##    user  system elapsed 
##       0       0       0
```

**As compared to dynamic and brute force algorithm the greedy calculates the result with a minimum amount of time. The complexity is considarbly less than the other two.**

When the n=1000000 and weight= 3500,


```r
greedy_knapsack_1000000<-system.time(greedy_knapsack(x = knapsack_objects[1:1000000,], W = 3500))
greedy_knapsack_1000000
```

```
##    user  system elapsed 
##    1.64    0.04    1.67
```

As well, the increased value of n increases the execution time.


**Question :** How much time does it takes to run the algorithm for n = 1000000 objects?

**Answer : **  The amount of time increases is as compared to previous n.

##TestSuit:

Testsuits are available for the functions **brute_force_knapsack()** & **greedy_knapsack()**. Students are supposed to create a testcase based on the two testsuits for **knapsack_dynamic()** function.
Possible testcases are created and tested in R.



```r
test_that("Correct object is returned", {
  expect_silent(dk <- knapsack_dynamic(x = knapsack_objects[1:8,], W = 3500))
  expect_named(dk, c("value", "elements"))
})
test_that("Function return correct results.", {
  dk <- knapsack_dynamic(x = knapsack_objects[1:8,], W = 3500)
  expect_equal(round(dk$value), 16770)
  expect_true(all(round(dk$elements) %in% c(5, 8)))}
```


##Identifying lineprof :


```r
library("RCourseLab6")
library(lineprof)
xw<-lineprof(a<-brute_force_knapsack(x = knapsack_objects[1:12,], W = 3500, fast=TRUE))
xw
xx<-lineprof(b<-brute_force_knapsack(x = knapsack_objects[1:12,], W = 3500))
xx
xy<-lineprof(c<-knapsack_dynamic(x = knapsack_objects[1:12,], W = 3500))
xy
xz<-lineprof(d<-greedy_knapsack(x = knapsack_objects[1:12000,], W = 3500))
xz
```

using shine we found


```r
shine(xx)
shine(xy)
shine(xz)
```

![Brute Force Line Profiling](../inst/images/brute.png)




![Dynamic Algorithm Line Profiling](../inst/images/Dynamic.png)

![Greedy Hurestic Line Profiling](../inst/images/greedy.png)


##Implementation in Rcpp: 

For improving code in bruteforce function , a new argument logical is used, which is by default FALSE. A chunk of C++ code is used inside the function foe checking the improvement. The part which is modified executes R code when fast=FALSE and when fast=TRUE , it executes Rcpp code.  


```r
else
        {
        cppFunction(' int abc(int tempValue, int bestValue, int tempWeight,
                    int Capacity, int bestWeight){
                    
                    if((tempValue > bestValue) && (tempWeight<= Capacity)){
                    bestValue=tempValue;
                    bestWeight=tempWeight;
                    
                   
                    }
                    return bestValue;
                    
                    } ')
```


However, after executing the code , we found out that the use of c++ code in this logic is inapproriate as it increases the execution time. And sometimes R session aborted for this. 


```r
library(RCourseLab6)
xx<-system.time(brute_force_knapsack(x = knapsack_objects[1:8,], W = 3500,fast=TRUE))
xy<-system.time(brute_force_knapsack(x = knapsack_objects[1:12,], W = 3500))
xx
xy
```

![Output](../inst/images/Capture.png)


**Question** What performance gain could you get by using Rcpp and C++?

**Answer : ** Due to unoptimized code , the implementation of c++ and Rcpp does not increases the performance. The reason might be use of c++ for simple task (if else), gain from which is likely to have been compansated by the additional overhead.  


##Package Installation:

This package can be installed using below command.    


```r
devtools::install_github("tondralok/RCourseLab6/RCourseLab6")
```



##References:
 1. https://en.wikipedia.org/wiki/Knapsack_problem
 2. http://www.micsymposium.org/mics_2005/papers/paper102.pdf



