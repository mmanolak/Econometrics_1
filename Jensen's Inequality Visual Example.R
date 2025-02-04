# Load necessary libraries
library(ggplot2)

# Define the convex function f(x) = x^2
f <- function(x) {
  return(x^2)
}

# Define points
x1 <- -1
x2 <- 1
alpha <- 0.5  # Weight for the convex combination

# Calculate the convex combination
x_alpha <- alpha * x1 + (1 - alpha) * x2
f_x_alpha <- f(x_alpha)

# Calculate weighted average of f(x1) and f(x2)
f_comb <- alpha * f(x1) + (1 - alpha) * f(x2)

# Create data for the plot
x_vals <- seq(-2, 2, length.out = 500)
f_vals <- f(x_vals)

data <- data.frame(x = x_vals, y = f_vals)

# Plot the convex function and key points
plot <- ggplot(data, aes(x = x, y = y)) +
  geom_line(color = "blue", size = 1) +  # Convex function
  geom_point(aes(x = x1, y = f(x1)), color = "red", size = 3) +
  geom_point(aes(x = x2, y = f(x2)), color = "red", size = 3) +
  geom_point(aes(x = x_alpha, y = f_x_alpha), color = "pink", size = 3) +
  geom_point(aes(x = x_alpha, y = f_comb), color = "green", size = 3) +
  geom_segment(aes(x = x1, y = f(x1), xend = x_alpha, yend = f_comb), linetype = "dashed", color = "gray") +
  geom_segment(aes(x = x2, y = f(x2), xend = x_alpha, yend = f_comb), linetype = "dashed", color = "gray") +
  geom_segment(aes(x = x_alpha, y = f_comb, xend = x_alpha, yend = f_x_alpha), linetype = "dashed", color = "black") +
  labs(title = "Visualization of Jensen's Inequality",
       x = "x",
       y = "f(x)") +
  annotate("text", x = x1, y = f(x1), label = "f(x1)", vjust = -1, color = "red") +
  annotate("text", x = x2, y = f(x2), label = "f(x2)", vjust = -1, color = "red") +
  annotate("text", x = x_alpha, y = f_x_alpha, label = "f(alpha * x1 + (1-alpha) * x2)", vjust = -1, color = 'brown') +
  annotate("text", x = x_alpha, y = f_comb, label = "alpha * f(x1) + (1-alpha) * f(x2)", vjust = 1, color = "maroon") +
  theme_minimal()

# Print the plot
print(plot)

# Save the plot as a PNG file
ggsave("Jensens_Inequality.png", plot = plot, width = 8, height = 6, dpi = 300)

# Save the plot as a PDF file (optional)
ggsave("Jensens_Inequality.pdf", plot = plot, width = 8, height = 6)