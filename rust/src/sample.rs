// Define an enum for transaction types
#[derive(Debug)]
enum TransactionType {
    Income,
    Expense,
}

// Define a struct for transactions
#[derive(Debug)]
struct Transaction {
    transaction_id: u32,
    amount: f64,
    transaction_date: String,
    transaction_type: TransactionType,
}

// Function to calculate net profit
fn calculate_net_profit(transactions: &[Transaction], taxes: f64) -> f64 {
    let mut total_income = 0.0;
    let mut total_expenses = 0.0;

    for transaction in transactions {
        match transaction.transaction_type {
            TransactionType::Income => total_income += transaction.amount,
            TransactionType::Expense => total_expenses += transaction.amount,
        }
    }

    let net_income = total_income - total_expenses;
    let net_profit = net_income - taxes;
    net_profit
}

fn main() {
    // Create some transactions
    let transactions = vec![
        Transaction {
            transaction_id: 1,
            amount: 1000.0,
            transaction_date: String::from("2023-01-01"),
            transaction_type: TransactionType::Income,
        },
        Transaction {
            transaction_id: 2,
            amount: 500.0,
            transaction_date: String::from("2023-01-02"),
            transaction_type: TransactionType::Expense,
        },
        Transaction {
            transaction_id: 3,
            amount: 1500.0,
            transaction_date: String::from("2023-01-03"),
            transaction_type: TransactionType::Income,
        },
        Transaction {
            transaction_id: 4,
            amount: 700.0,
            transaction_date: String::from("2023-01-04"),
            transaction_type: TransactionType::Expense,
        },
    ];

    // Calculate and print the net profit
    let taxes = 200.0;
    let net_profit = calculate_net_profit(&transactions, taxes);
    println!("Net Profit: {:.2}", net_profit);
}
