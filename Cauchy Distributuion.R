# Load necessary library
library(ggplot2)

# Generate random samples from a Cauchy distribution
set.seed(123)  # For reproducibility
n <- 1000  # Number of samples
cauchy_samples <- rcauchy(n, location = 0, scale = 1)  # Standard Cauchy distribution
normal_samples <- rnorm(n, mean = 0, sd = 1)  # Normal distribution for comparison

# Create a data frame for visualization
data <- data.frame(x = cauchy_samples, distribution = "Cauchy")
normal_data <- data.frame(x = normal_samples, distribution = "Normal")

# Combine data for easier plotting
combined_data <- rbind(data, normal_data)

# Define the theoretical Cauchy PDF for comparison
cauchy_pdf <- function(x, location = 0, scale = 1) {
  1 / (pi * scale * (1 + ((x - location) / scale)^2))
}

# Define the theoretical Normal PDF for comparison
normal_pdf <- function(x, mean = 0, sd = 1) {
  (1 / (sd * sqrt(2 * pi))) * exp(-0.5 * ((x - mean) / sd)^2)
}

# Create x values for the theoretical PDFs
x_vals <- seq(-10, 10, length.out = 1000)  # Keep a reasonable range for visibility
cauchy_pdf_vals <- cauchy_pdf(x_vals)
normal_pdf_vals <- normal_pdf(x_vals)

# Adjust scaling for the Cauchy distribution to visually amplify tails
scaled_cauchy_pdf_vals <- cauchy_pdf_vals * 5  # Amplify the Cauchy PDF for better visibility of tails

# Create data frames for the theoretical PDFs
cauchy_theoretical_data <- data.frame(x = x_vals, y = scaled_cauchy_pdf_vals, distribution = "Cauchy")
normal_theoretical_data <- data.frame(x = x_vals, y = normal_pdf_vals, distribution = "Normal")

# Combine theoretical data for plotting
theoretical_data <- rbind(cauchy_theoretical_data, normal_theoretical_data)

# Plot the histogram of the samples and overlay the theoretical PDFs
plot <- ggplot() +
  geom_histogram(data = combined_data, aes(x = x, y = ..density.., fill = distribution), bins = 50, alpha = 0.5, color = "black") +
  geom_line(data = theoretical_data, aes(x = x, y = y, color = distribution), size = 1) +
  xlim(-10, 10) +  # Set limits for better visibility
  scale_fill_manual(values = c("Cauchy" = "blue", "Normal" = "green"),
                    name = "Distribution") +
  scale_color_manual(values = c("Cauchy" = "blue", "Normal" = "green"),
                     name = "PDF") +
  labs(title = "Comparison of Cauchy and Normal Distributions",
       x = "x",
       y = "Density") +
  theme_minimal()

# Print the plot
print(plot)

# Save the plot as a PNG file
ggsave("Cauchy_vs_Normal_Distribution_Scaled_Distinct_PDFs.png", plot = plot, width = 8, height = 6, dpi = 300)

# Save the plot as a PDF file (optional)
ggsave("Cauchy_vs_Normal_Distribution_Scaled_Distinct_PDFs.pdf", plot = plot, width = 8, height = 6)
