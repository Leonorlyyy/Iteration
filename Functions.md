Functions
================
Leonor Rui
2024-10-24

## Writing function

As an example, here’s a z-score computation

``` r
x_vec = rnorm(n = 25, mean = 10, sd = 3.5)

(x_vec - mean(x_vec)) / sd(x_vec)
```

    ##  [1]  0.2419712 -1.3724571  0.2915307  1.8981097  0.9009095  0.3528813
    ##  [7] -0.9102811  0.3559381  0.1762024  0.0705830 -0.1965957 -0.9611688
    ## [13] -0.3820056 -1.3672620  1.4913929  0.4497819  0.9780309  1.6856807
    ## [19] -1.0905886 -0.3619012 -1.2541202 -0.1123595 -1.3285246 -0.8893144
    ## [25]  1.3335664

Now write a function to do this

``` r
z_scores = function(x) {
  
  z = (x - mean(x)) / sd(x)
  
  return(z)
}

z_scores(x_vec)
```

    ##  [1]  0.2419712 -1.3724571  0.2915307  1.8981097  0.9009095  0.3528813
    ##  [7] -0.9102811  0.3559381  0.1762024  0.0705830 -0.1965957 -0.9611688
    ## [13] -0.3820056 -1.3672620  1.4913929  0.4497819  0.9780309  1.6856807
    ## [19] -1.0905886 -0.3619012 -1.2541202 -0.1123595 -1.3285246 -0.8893144
    ## [25]  1.3335664

Does this always work?

``` r
z_scores(3)
```

    ## [1] NA

``` r
## can't compute SD for just one number

z_scores(c("my", "name", "is", "Leonor"))
```

    ## Warning in mean.default(x): argument is not numeric or logical: returning NA

    ## Error in x - mean(x): non-numeric argument to binary operator

``` r
## can't calculate mean and SD for character variable
```

``` r
z_scores = function(x) {
  
  if(!is.numeric(x)) {
    stop("x needs to be numeric")
  }
  
  if(length(x) < 5){
    stop("you need at least 5 numbers to compute the z")
  }
  
  z = (x - mean(x)) / sd(x)
  
  return(z)
}

z_scores(c("my", "name", "is", "Leonor"))
```

    ## Error in z_scores(c("my", "name", "is", "Leonor")): x needs to be numeric

``` r
z_scores(3)
```

    ## Error in z_scores(3): you need at least 5 numbers to compute the z

``` r
z_scores(x_vec)
```

    ##  [1]  0.2419712 -1.3724571  0.2915307  1.8981097  0.9009095  0.3528813
    ##  [7] -0.9102811  0.3559381  0.1762024  0.0705830 -0.1965957 -0.9611688
    ## [13] -0.3820056 -1.3672620  1.4913929  0.4497819  0.9780309  1.6856807
    ## [19] -1.0905886 -0.3619012 -1.2541202 -0.1123595 -1.3285246 -0.8893144
    ## [25]  1.3335664
