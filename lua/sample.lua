function createTransaction(transactionId, amount, transactionDate, transactionType)
    return {
        transactionId = transactionId,
        amount = amount,
        transactionDate = transactionDate,
        transactionType = transactionType
    }
end

function calculateNetProfit(transactions, taxes)
    local totalIncome = 0
    local totalExpenses = 0

    for _, transaction in ipairs(transactions) do
        if transaction.transactionType == 'income' then
            totalIncome = totalIncome + transaction.amount
        elseif transaction.transactionType == 'expense' then
            totalExpenses = totalExpenses + transaction.amount
        end
    end

    local netIncome = totalIncome - totalExpenses
    local netProfit = netIncome - taxes
    return netProfit
end

-- Create some transaction data
local transactions = {
    createTransaction(1, 1000.00, "2023-01-01", "income"),
    createTransaction(2, 500.00, "2023-01-02", "expense"),
    createTransaction(3, 1500.00, "2023-01-03", "income"),
    createTransaction(4, 700.00, "2023-01-04", "expense")
}

-- Calculate net profit
local taxes = 200.00
local netProfit = calculateNetProfit(transactions, taxes)
print("Net Profit: ", netProfit)
