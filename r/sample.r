# Define the transactions as a data frame
transactions <- data.frame(
  transactionId = c(1, 2, 3, 4),
  amount = c(1000, 500, 1500, 700),
  transactionDate = as.Date(c("2023-01-01", "2023-01-02", "2023-01-03", "2023-01-04")),
  transactionType = c("income", "expense", "income", "expense")
)

# Function to calculate net profit
calculateNetProfit <- function(transactions, taxes) {
  # Calculate total income
  totalIncome <- sum(transactions$amount[transactions$transactionType == "income"])
  
  # Calculate total expenses
  totalExpenses <- sum(transactions$amount[transactions$transactionType == "expense"])
  
  # Calculate net income
  netIncome <- totalIncome - totalExpenses
  
  # Calculate net profit
  netProfit <- netIncome - taxes
  
  return(netProfit)
}

# Example usage
taxes <- 200
netProfit <- calculateNetProfit(transactions, taxes)
print(paste("Net Profit: ", netProfit))
