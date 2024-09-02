#include <vector>
#include <string>

struct Transaction {
    int transactionId;
    double amount;
    std::string transactionDate;
    std::string transactionType; // Use string to represent 'income' or 'expense'
};

double calculateNetProfit(const std::vector<Transaction>& transactions, double taxes) {
    double totalIncome = 0;
    double totalExpenses = 0;

    for (const auto& transaction : transactions) {
        if (transaction.transactionType == "income") {
            totalIncome += transaction.amount;
        } else if (transaction.transactionType == "expense") {
            totalExpenses += transaction.amount;
        }
    }

    double netIncome = totalIncome - totalExpenses;
    double netProfit = netIncome - taxes;
    return netProfit;
}

int main() {
    // Example usage
    std::vector<Transaction> transactions = {
        {1, 1000.0, "2023-05-10", "income"},
        {2, 500.0, "2023-05-11", "expense"},
        {3, 2000.0, "2023-05-12", "income"},
        {4, 300.0, "2023-05-13", "expense"}
    };

    double taxes = 300.0;
    double netProfit = calculateNetProfit(transactions, taxes);
    // std::cout << "Net Profit: $" << netProfit << std::endl;

    return 0;
}
