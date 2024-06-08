class Transaction
    attr_accessor :transaction_id, :amount, :transaction_date, :transaction_type
  
    def initialize(transaction_id, amount, transaction_date, transaction_type)
      @transaction_id = transaction_id
      @amount = amount
      @transaction_date = transaction_date
      @transaction_type = transaction_type
    end
  end
  
  def calculate_net_profit(transactions, taxes)
    total_income = 0
    total_expenses = 0
  
    transactions.each do |transaction|
      if transaction.transaction_type == 'income'
        total_income += transaction.amount
      elsif transaction.transaction_type == 'expense'
        total_expenses += transaction.amount
      end
    end
  
    net_income = total_income - total_expenses
    net_profit = net_income - taxes
    net_profit
  end
  
  # Example usage
  transactions = [
    Transaction.new(1, 1000, "2023-01-01", "income"),
    Transaction.new(2, 500, "2023-01-02", "expense"),
    Transaction.new(3, 1500, "2023-01-03", "income"),
    Transaction.new(4, 700, "2023-01-04", "expense")
  ]
  
  taxes = 200
  net_profit = calculate_net_profit(transactions, taxes)
  puts "Net Profit: #{net_profit}"
  