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

## ----eval=FALSE----------------------------------------------------------
#   brute_force_knapsack(x = knapsack_objects[1:8,], W = 3500)
#   brute_force_knapsack(x = knapsack_objects[1:12,], W = 2000)
#  
#  

## ------------------------------------------------------------------------
brute_force_knapsack_8<-system.time(brute_force_knapsack(x = knapsack_objects[1:12,], W = 3500))
brute_force_knapsack_8


## ------------------------------------------------------------------------
brute_force_knapsack_16<-system.time(brute_force_knapsack(x = knapsack_objects[1:16,], W = 3500))
brute_force_knapsack_16

## ------------------------------------------------------------------------
brute_force_knapsack_16<-system.time(brute_force_knapsack(x = knapsack_objects[1:16,], W = 2000))
brute_force_knapsack_16

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
#  xx<-lineprof(a<-brute_force_knapsack(x = knapsack_objects[1:12,], W = 3500))
#  xx
#  xy<-lineprof(b<-knapsack_dynamic(x = knapsack_objects[1:12,], W = 3500))
#  xy
#  xz<-lineprof(c<-greedy_knapsack(x = knapsack_objects[1:12000,], W = 3500))
#  xz

## ---- eval=FALSE---------------------------------------------------------
#  shine(xx)
#  shine(xy)
#  shine(xz)

