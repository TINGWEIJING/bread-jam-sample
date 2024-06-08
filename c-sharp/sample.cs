using System;
using System.Collections.Generic;

public class Program
{
    public static void Main()
    {
        var transactions = new List<Transaction>
        {
            new Transaction { TransactionId = 1, Amount = 1000.0m, TransactionDate = "2023-01-01", TransactionType = TransactionType.Income },
            new Transaction { TransactionId = 2, Amount = 500.0m, TransactionDate = "2023-01-02", TransactionType = TransactionType.Expense },
            new Transaction { TransactionId = 3, Amount = 1500.0m, TransactionDate = "2023-01-03", TransactionType = TransactionType.Income },
            new Transaction { TransactionId = 4, Amount = 700.0m, TransactionDate = "2023-01-04", TransactionType = TransactionType.Expense }
        };

        decimal taxes = 200.0m;
        decimal netProfit = CalculateNetProfit(transactions, taxes);
        Console.WriteLine($"Net Profit: {netProfit}");
    }

    public static decimal CalculateNetProfit(List<Transaction> transactions, decimal taxes)
    {
        decimal totalIncome = 0m;
        decimal totalExpenses = 0m;

        foreach (var transaction in transactions)
        {
            if (transaction.TransactionType == TransactionType.Income)
            {
                totalIncome += transaction.Amount;
            }
            else if (transaction.TransactionType == TransactionType.Expense)
            {
                totalExpenses += transaction.Amount;
            }
        }

        decimal netIncome = totalIncome - totalExpenses;
        decimal netProfit = netIncome - taxes;
        return netProfit;
    }
}

public class Transaction
{
    public int TransactionId { get; set; }
    public decimal Amount { get; set; }
    public string TransactionDate { get; set; }
    public TransactionType TransactionType { get; set; }
}

public enum TransactionType
{
    Income,
    Expense
}
