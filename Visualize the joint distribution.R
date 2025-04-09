library(tidyverse)

# Set seed for reproducibility
set.seed(123)

# Simulate data from a bivariate normal distribution
n <- 1000
mu_x <- 0
mu_y <- 0
sigma_x <- 1
sigma_y <- 1
rho <- 0.6
sigma_xy <- rho * sigma_x * sigma_y

x <- rnorm(n, mu_x, sigma_x)
epsilon <- rnorm(n, 0, sqrt(sigma_y^2 - sigma_xy^2 / sigma_x^2))
y <- mu_y + sigma_xy / sigma_x^2 * (x - mu_x) + epsilon

# Create a data frame
df <- data.frame(x, y)

# Visualize the joint distribution
ggplot(df, aes(x = x, y = y)) +
  geom_point(alpha = 0.5) +
  geom_density_2d() +
  labs(title = "Joint Distribution of X and Y")