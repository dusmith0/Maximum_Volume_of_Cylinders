### Cylinder Volume simulation
## Assuming fixed perimeter.
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

# Function for volume of clyinder
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
