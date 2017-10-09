## ------------------------------------------------------------------------
set.seed(42)
n <- 2000
knapsack_objects <-
data.frame(
w=sample(1:4000, size = n, replace = TRUE),
v=runif(n = n, 0, 10000)
)

## ----eval=FALSE----------------------------------------------------------
#  #devtools::use_data("knapsack_objects", pkg="RCourseLab4")

## ------------------------------------------------------------------------
#load("./knapsack_objects.rda")

## ---- eval=FALSE---------------------------------------------------------
#  
#  for i = 1 to 2^n^ do
#        j <- n
#        tempWeight<-0
#        tempValue<-0
#      while ( A[j] != 0 and j > 0)
#            A[j]<- 0
#            j<- j – 1
#      A[j]<- 1
#      for k <- 1 to n do
#            if (A[k] = 1) then
#            tempWeight<-tempWeight + Weights[k]
#            tempValue<-tempValue + Values[k]
#      if ((tempValue > bestValue) AND (tempWeight  Capacity)) then
#            bestValue<-tempValue
#            bestWeight<-tempWeight
#            bestChoice<-A
#      return bestChoice
#  
#  

## ----eval=FALSE----------------------------------------------------------
#   brute_force_knapsack(x = knapsack_objects[1:8,], W = 3500)
#   brute_force_knapsack(x = knapsack_objects[1:12,], W = 2000)
#  
#  

## ------------------------------------------------------------------------
library(RCourseLab6)
brute_force_knapsack_8<-system.time(brute_force_knapsack(x = knapsack_objects[1:12,], W = 3500))
brute_force_knapsack_8


## ------------------------------------------------------------------------
brute_force_knapsack_16<-system.time(brute_force_knapsack(x = knapsack_objects[1:16,], W = 3500))
brute_force_knapsack_16

## ------------------------------------------------------------------------
brute_force_knapsack_16<-system.time(brute_force_knapsack(x = knapsack_objects[1:16,], W = 2000))
brute_force_knapsack_16

## ---- eval=FALSE---------------------------------------------------------
#  
#  for i = 0 to N do
#       for j = 0 to Capacity
#            if j < Weights[i] then
#                  Table[i, j]<-Table[i-1, j]
#            else
#                  Table[i, j]<-maximum { Table[i-1, j]
#                              AND
#                  Values[i] + Table[i-1, j – Weights[i]]
#  
#  return Table[N, Capacity]

## ------------------------------------------------------------------------
 knapsack_dynamic(x=knapsack_objects[1:8,], W = 3500)
 knapsack_dynamic(x=knapsack_objects[1:12,], W = 2000)
 

## ------------------------------------------------------------------------
knapsack_dynamic_12<-system.time(knapsack_dynamic(x=knapsack_objects[1:12,], W = 3500))
knapsack_dynamic_12

## ------------------------------------------------------------------------
knapsack_dynamic_500<-system.time(knapsack_dynamic(x=knapsack_objects[1:500,], W = 3500))
knapsack_dynamic_500

## ------------------------------------------------------------------------
knapsack_dynamic_500<-system.time(knapsack_dynamic(x=knapsack_objects[1:500,], W = 2000))
knapsack_dynamic_500

## ------------------------------------------------------------------------
knapsack_dynamic(x=knapsack_objects[1:800,], W = 3500)
knapsack_dynamic_800<-system.time(knapsack_dynamic(x=knapsack_objects[1:800,], W = 3500))
knapsack_dynamic_800

## ---- eval=FALSE---------------------------------------------------------
#  
#  Integer CumWeight
#  Compute the value-to-weight ratios r~i~ = v~i~ / w~i~ ,i = 1, …, N, for the items given
#  
#  Sort the items in non-increasing order of the value-to-weight ratios
#  
#  for all items do
#        if the current item on the list fits into the knapsack then
#               place it in the knapsack
#        else
#               proceed to the next one

## ------------------------------------------------------------------------
  greedy_knapsack(x = knapsack_objects[1:800,], W = 3500)
  greedy_knapsack(x = knapsack_objects[1:1200,], W = 2000)

## ------------------------------------------------------------------------
greedy_knapsack_800<-system.time(greedy_knapsack(x = knapsack_objects[1:1200,], W = 3500))
greedy_knapsack_800

## ------------------------------------------------------------------------
greedy_knapsack_1000000<-system.time(greedy_knapsack(x = knapsack_objects[1:1000000,], W = 3500))
greedy_knapsack_1000000

## ----eval=FALSE----------------------------------------------------------
#  test_that("Correct object is returned", {
#    expect_silent(dk <- knapsack_dynamic(x = knapsack_objects[1:8,], W = 3500))
#    expect_named(dk, c("value", "elements"))
#  })
#  test_that("Function return correct results.", {
#    dk <- knapsack_dynamic(x = knapsack_objects[1:8,], W = 3500)
#    expect_equal(round(dk$value), 16770)
#    expect_true(all(round(dk$elements) %in% c(5, 8)))}
#  

## ----eval=FALSE----------------------------------------------------------
#  library("RCourseLab6")
#  library(lineprof)
#  xw<-lineprof(a<-brute_force_knapsack(x = knapsack_objects[1:12,], W = 3500, fast=TRUE))
#  xw
#  xx<-lineprof(b<-brute_force_knapsack(x = knapsack_objects[1:12,], W = 3500))
#  xx
#  xy<-lineprof(c<-knapsack_dynamic(x = knapsack_objects[1:12,], W = 3500))
#  xy
#  xz<-lineprof(d<-greedy_knapsack(x = knapsack_objects[1:12000,], W = 3500))
#  xz

## ---- eval=FALSE---------------------------------------------------------
#  shine(xx)
#  shine(xy)
#  shine(xz)

## ---- eval=FALSE---------------------------------------------------------
#  else
#          {
#          cppFunction(' int abc(int tempValue, int bestValue, int tempWeight,
#                      int Capacity, int bestWeight){
#  
#                      if((tempValue > bestValue) && (tempWeight<= Capacity)){
#                      bestValue=tempValue;
#                      bestWeight=tempWeight;
#  
#  
#                      }
#                      return bestValue;
#  
#                      } ')

## ---- eval=FALSE---------------------------------------------------------
#  library(RCourseLab6)
#  xx<-system.time(brute_force_knapsack(x = knapsack_objects[1:8,], W = 3500,fast=TRUE))
#  xy<-system.time(brute_force_knapsack(x = knapsack_objects[1:12,], W = 3500))
#  xx
#  xy

## ---- eval=FALSE---------------------------------------------------------
#  devtools::install_github("tondralok/RCourseLab6/RCourseLab6")

