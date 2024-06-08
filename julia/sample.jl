struct Transaction
    transactionId::Int
    amount::Float64
    transactionDate::String
    transactionType::String  # 'income' or 'expense'
end

function calculateNetProfit(transactions::Vector{Transaction}, taxes::Float64)::Float64
    totalIncome = 0.0
    totalExpenses = 0.0

    for transaction in transactions
        if transaction.transactionType == "income"
            totalIncome += transaction.amount
        elseif transaction.transactionType == "expense"
            totalExpenses += transaction.amount
        end
    end

    netIncome = totalIncome - totalExpenses
    netProfit = netIncome - taxes
    return netProfit
end

function main()
    transactions = [
        Transaction(1, 1000.0, "2023-05-10", "income"),
        Transaction(2, 500.0, "2023-05-11", "expense"),
        Transaction(3, 1500.0, "2023-05-12", "income"),
        Transaction(4, 300.0, "2023-05-13", "expense")
    ]

    taxes = 250.0
    netProfit = calculateNetProfit(transactions, taxes)
    println("Net Profit: \$(netProfit)")
end

main()
