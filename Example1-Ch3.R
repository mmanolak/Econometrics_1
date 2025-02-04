# Load necessary libraries
library(tidyverse)

# Set the seed for reproducibility
set.seed(456)

# Define the parameters for a normal distribution (mean and standard deviation)
mu <- 0
sigma <- 1

# Simulate 1000 draws from a normal distribution
draws <- rnorm(1000, mean = mu, sd = sigma)

# Convert the simulation results to a tibble
draws_tibble <- tibble(draw = draws)

# Estimate the probability density function (PDF) using kernel density estimation
pdf_estimate <- density(draws)

# Convert the PDF estimate to a tibble for plotting
pdf_tibble <- tibble(x = pdf_estimate$x, y = pdf_estimate$y)

# Plot the PDF
ggplot(pdf_tibble, aes(x = x, y = y)) +
  geom_line(color = "blue") +
  labs(title = "Estimated PDF of a Standard Normal Distribution",
       x = "x",
       y = "Density") +
  theme_minimal()

# Add the theoretical PDF for comparison
ggplot(pdf_tibble, aes(x = x, y = y)) +
  geom_line(color = "blue") +
  stat_function(fun = dnorm, args = list(mean = mu, sd = sigma), color = "red", linetype = "dashed") +
  labs(title = "Estimated and Theoretical PDF of a Standard Normal Distribution",
       x = "x",
       y = "Density") +
  theme_minimal() +
  annotate("text", x = 3, y = 0.3, label = "Theoretical", color = "red") +
  annotate("text", x = -3, y = 0.2, label = "Estimated", color = "blue")