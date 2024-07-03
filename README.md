## Maximum Volume of Cylinders

*Description*
This script is a product of a question posed during a conference. We were tasked to decide which of three cylinders contained the largest Volume if we assume the paremeter of the face of each cylinder remaind the same. The height and radius of each cylinder was rearranged to form different cylinders but maintain a constant area. The solution was given that it depends, and that calculus was involved to determine the true solution. That is it depends on how the height and radius was constructed to see which had the largest volume. I was not satisfied with this and thus this code was created. 

### Rational
*Argument 1*
First let us consider the Volume of a Cylinder:
$$
V = pi*r^2*h
$$

First we can see that radius is squared and height is not. Therefor, it is easy to see that radius must have a larger effect, and the clear solution is that the cylinder with the largest radius has the largest volume. 

However, the instuctors and many other individuals claimed that this was not enought to show that radius is most important. 


*Argument 2*
Another way to see that radius is most important is to consider the fixed perimiter in the formula. Here the fixed formula is 
$$ P = r * h $$
If we fix this we can adjust the formula as seen below:
$$ V = pi * r * (r * h) $$
and:
$$ V = pi * r * P$$
Then let $r_1$ be greater then $r_2$, and  assuming P is fixed, then the ratio of the volumes is:
$$ V_1/V_2 = (pi * r_1 * P)/(pi * r_2 * P) $$
$$ V_1/V_2 = r_1/r_2 $$
Thus the ratio of the Volume of each cylinder is exactly the ratio of the radii. And if $r_1 > r_2$ then $V_1 > V_2$. 

*Argument 3*
As the above arguments were not accepted, I created a simulation that could take a fixed perimeter, generate a series of possible radius and height integer pairs to maintain the fixed perimeter, and calculate the volume of each pair. 

A first function was created to generate the integer factors:
```{r,echo = FALSE, eval = TRUE}
factors <- function(fixed){
  fact <- c(0)
  spot <- 0
  for(i in 1:fixed) {
    if((fixed %% i) == 0) {
      spot <- spot + 1
      fact[spot] <- i
    }
  }
  return(fact)
}
```

```{r, echo = TRUE, eval = TRUE}
factors(25)
factors(100)
factors(3000)
```
After a second function called vol() runs each factor and calculates all given volumes of each possible factor pair. The only input is the fixed perimeter in val(fixed = 18):

```{r, echo = FALSE, eval = TRUE}
vol <- function(fixed = 18){
  interval <- factors(fixed)
  volume <- c(0)
  sizes <- matrix(nrow = length(interval), ncol = 3)
  for(i in 1:length(interval)){
    r <- interval[i]
    h <- interval[length(interval) + 1 - i]
    sizes[i,] <- c(h, r, h*r)
    volume[i] <- pi * r ^ 2 * h
    max
  }
  colnames(sizes) <- c("Height", "Radius", "Perimeter")
  max_int <- which.max(volume)
  max <- sizes[max_int,]
  max <-
  return(list(sizes = sizes, volume = volume))
}
```
```{r, echo = TRUE, eval = TRUE}
vol(25)
vol(100)
vol(3000)
```

Thus as we can see that the order of the Volume matches the Order of the Height and Radius combination, that the largest radius produces the largest Volume. 

