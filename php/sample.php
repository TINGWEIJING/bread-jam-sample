<?php

class Transaction {
    public int $transactionId;
    public float $amount;
    public string $transactionDate;
    public string $transactionType;  // 'income' or 'expense'

    public function __construct(int $transactionId, float $amount, string $transactionDate, string $transactionType) {
        $this->transactionId = $transactionId;
        $this->amount = $amount;
        $this->transactionDate = $transactionDate;
        $this->transactionType = $transactionType;
    }
}

function calculateNetProfit(array $transactions, float $taxes): float {
    $totalIncome = 0.0;
    $totalExpenses = 0.0;

    foreach ($transactions as $transaction) {
        if ($transaction->transactionType === 'income') {
            $totalIncome += $transaction->amount;
        } elseif ($transaction->transactionType === 'expense') {
            $totalExpenses += $transaction->amount;
        }
    }

    $netIncome = $totalIncome - $totalExpenses;
    $netProfit = $netIncome - $taxes;
    return $netProfit;
}

// Example usage
$transactions = [
    new Transaction(1, 1000.0, '2023-01-01', 'income'),
    new Transaction(2, 500.0, '2023-01-02', 'expense'),
    new Transaction(3, 1500.0, '2023-01-03', 'income'),
    new Transaction(4, 700.0, '2023-01-04', 'expense')
];

$taxes = 200.0;
$netProfit = calculateNetProfit($transactions, $taxes);
echo "Net Profit: $netProfit\n";
?>
