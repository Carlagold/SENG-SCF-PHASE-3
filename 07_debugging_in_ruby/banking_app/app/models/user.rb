class User < ActiveRecord::Base
    has_many :accounts
    has_many :banks, through: :accounts
    
    def self.number_one
        balances = Account.group(:user_id).sum(:balance)
        user_id_with_the_highest_balance = balances.max.first
        User.find(user_id_with_the_highest_balance)
    end
    
    def total_balance
        self.accounts.sum(:balance)
    end

    def balance_by_account_type(account_type)
        self.accounts.where(account_type: account_type).sum(:balance)
    end

    def main_banks
        # returns a collection of all the Bank instances the user has invested more than $30,000
        accounts_by_balance = self.accounts.group(:bank_id).count(:balance)

        main_banks_ids = accounts_by_balance.filter do |bank_id, balance| 
            balance > 30000
        end.keys
        Bank.where(id: main_banks_ids)

    end

    def international_funds
        international_banks = Bank.where.not(country: self.country_of_residence)
        self.accounts.where(bank: international_banks).sum(:balance)
    end
end