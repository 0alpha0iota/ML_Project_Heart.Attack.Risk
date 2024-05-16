
model <- glm(best_subset, data = train_set, family = "binomial")

# Assuming 'model' is your logistic regression model and 'data' is your dataset
probabilities <- predict(model, dataset, type = "response")  # Get predicted probabilities
actuals <- dataset$Heart.Attack.Risk  # True labels

# Function to calculate metrics at different thresholds
calculate_metrics <- function(threshold) {
  
  predicted <- ifelse(probabilities > threshold, 1, 0)
  
    list(
    Precision <- sum(predicted == 1 & actuals == 1) / sum(predicted == 1),
    Recall <- sum(predicted == 1 & actuals == 1) / sum(actuals == 1),
    F1 <- 2 * (Precision * Recall) / (Precision + Recall)
    )
    
}

# Evaluate metrics at different thresholds
sapply(seq(0.1, 0.6, by = 0.05), calculate_metrics)

