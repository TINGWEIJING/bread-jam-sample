class Transaction {
  int transactionId;
  double amount;
  String transactionDate;
  String transactionType;  // 'income' or 'expense'

  Transaction(this.transactionId, this.amount, this.transactionDate, this.transactionType);
}

double calculateNetProfit(List<Transaction> transactions, double taxes) {
  double totalIncome = 0;
  double totalExpenses = 0;

  for (var transaction in transactions) {
    if (transaction.transactionType == 'income') {
      totalIncome += transaction.amount;
    } else if (transaction.transactionType == 'expense') {
      totalExpenses += transaction.amount;
    }
  }

  double netIncome = totalIncome - totalExpenses;
  double netProfit = netIncome - taxes;
  return netProfit;
}

void main() {
  List<Transaction> transactions = [
    Transaction(1, 1000.0, '2023-05-10', 'income'),
    Transaction(2, 500.0, '2023-05-11', 'expense'),
    Transaction(3, 1500.0, '2023-05-12', 'income'),
    Transaction(4, 300.0, '2023-05-13', 'expense')
  ];

  double taxes = 250.0;
  double netProfit = calculateNetProfit(transactions, taxes);
  print('Net Profit: \$$netProfit');
}
