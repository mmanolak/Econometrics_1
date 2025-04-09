# Load necessary libraries
library(tidyverse)

# Set seed for reproducibility
set.seed(456)

# Simulate data
n <- 1000
x <- rnorm(n, mean = 2, sd = 1)
y <- 3 * x + rnorm(n, mean = 0, sd = 2)

# Calculate E(Y|X)
# We'll use a simple linear model to estimate E(Y|X)
model <- lm(y ~ x)
e_y_given_x <- fitted(model)

# Calculate E(Y)
e_y <- mean(y)

# Calculate E(E(Y|X))
e_e_y_given_x <- mean(e_y_given_x)

# Print results
print(paste("E(Y):", e_y))

print(paste("E(E(Y|X)):", e_e_y_given_x))

# Visualize the relationship
df <- data.frame(x, y, e_y_given_x)

ggplot(df, aes(x = x)) +
  geom_point(aes(y = y), alpha = 0.5) +
  geom_line(aes(y = e_y_given_x, color = "E(Y|X)"), size = 1) +
  geom_hline(aes(yintercept = e_y, color = "E(Y)"), size = 1) +
  geom_hline(aes(yintercept = e_e_y_given_x, color = "E(E(Y|X))"), linetype = "dashed", size = 1) +
  scale_color_manual(
    values = c("E(Y|X)" = "red", "E(Y)" = "blue", "E(E(Y|X))" = "green")
  ) +
  labs(
    title = "Illustration of the Law of Iterated Expectations",
    x = "X",
    y = "Y"
  )