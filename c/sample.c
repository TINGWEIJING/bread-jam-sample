#include <stdio.h>
#include <string.h>

typedef struct {
    int transactionId;
    double amount;
    char transactionDate[11]; // Assumes date format is YYYY-MM-DD
    char transactionType[8]; // "income" or "expense"
} Transaction;

double calculateNetProfit(Transaction transactions[], int numTransactions, double taxes) {
    double totalIncome = 0.0;
    double totalExpenses = 0.0;

    for (int i = 0; i < numTransactions; i++) {
        if (strcmp(transactions[i].transactionType, "income") == 0) {
            totalIncome += transactions[i].amount;
        } else if (strcmp(transactions[i].transactionType, "expense") == 0) {
            totalExpenses += transactions[i].amount;
        }
    }

    double netIncome = totalIncome - totalExpenses;
    double netProfit = netIncome - taxes;
    return netProfit;
}

int main() {
    Transaction transactions[4] = {
        {1, 1000.0, "2023-01-01", "income"},
        {2, 500.0, "2023-01-02", "expense"},
        {3, 1500.0, "2023-01-03", "income"},
        {4, 700.0, "2023-01-04", "expense"}
    };

    double taxes = 200.0;
    double netProfit = calculateNetProfit(transactions, 4, taxes);
    printf("Net Profit: %.2f\n", netProfit);

    return 0;
}
