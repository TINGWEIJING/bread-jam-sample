package main

import (
	"fmt"
)

// TransactionType constants
const (
	Income  = "income"
	Expense = "expense"
)

// Transaction struct
type Transaction struct {
	TransactionID   int
	Amount          float64
	TransactionDate string
	TransactionType string
}

// calculateNetProfit calculates the net profit from a slice of Transactions and taxes
func calculateNetProfit(transactions []Transaction, taxes float64) float64 {
	totalIncome := 0.0
	totalExpenses := 0.0

	for _, transaction := range transactions {
		switch transaction.TransactionType {
		case Income:
			totalIncome += transaction.Amount
		case Expense:
			totalExpenses += transaction.Amount
		}
	}

	netIncome := totalIncome - totalExpenses
	netProfit := netIncome - taxes
	return netProfit
}

func main() {
	// Sample transactions
	transactions := []Transaction{
		{TransactionID: 1, Amount: 1000.0, TransactionDate: "2023-01-01", TransactionType: Income},
		{TransactionID: 2, Amount: 500.0, TransactionDate: "2023-01-02", TransactionType: Expense},
		{TransactionID: 3, Amount: 1500.0, TransactionDate: "2023-01-03", TransactionType: Income},
		{TransactionID: 4, Amount: 700.0, TransactionDate: "2023-01-04", TransactionType: Expense},
	}

	taxes := 200.0
	netProfit := calculateNetProfit(transactions, taxes)
	fmt.Printf("Net Profit: %.2f\n", netProfit)
}
