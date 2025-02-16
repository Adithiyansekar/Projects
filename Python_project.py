

import os
import json


class BankAccount:
    def __init__(self,account_number,name,balance=0):
        self.account_number = account_number
        self.name = name
        self.balance = balance
        self.transactions = []
    def deposit(self,amount):
        if amount <= 0:
            print("Invalid amount. Deposite must be greater than 0.\n")
            return
        self.balance += amount
        self.transactions.append(f"Deposited: ${amount}.")
        print(f"Deposited ${amount} successfully.\n")
    
    def get_balance(self):
        print(f"{self.name} your current balance is ${self.balance}.\n")
    
    def withdraw(self,amount):
        if amount <= 0:
            print("Invalid amount. Deposit must be greater than 0.\n")
            return
        if amount > self.balance:
            print("Insufficient balance.\n")
            return
        self.balance -= amount
        self.transactions.append(f"Withdrew: ${amount}.\n")
        print(f"Withdrew ${amount} successful.\n")

    def transfer(self,amount,targer_account):
        if amount<=0:
            print("Invalid amount. Transfer must be greater than 0.\n")
            return
        if amount > self.balance:
            print("Insufficient balance for transfer.\n")
            return
        self.withdraw(amount)
        targer_account.deposit(amount)
        self.transactions.append(f"Transferred: ${amount} to {targer_account.account_number}")
        targer_account.transactions.append(f"Received: ${amount} from {self.account_number}")
        print(f"Transferred ${amount} to account {targer_account.account_number} successfully.")

    def view_transactions(self):
        print("Transaction History:\n")
        for transaction in self.transactions:
            print(transaction)
    
    def save_to_file(self):
        data = {
            "account_number" : self.account_number,
            "name" : self.name,
            "balance" : self.balance,
            "transactions" : self.transactions
        }
        with open(f"{self.account_number}.json","w") as file:
            json.dump(data,file)
    
    @staticmethod
    def load_from_file(account_number):
        if not os.path.exists(account_number):
            print("Account file dose not exist.")
            return None
        with open (f"{account_number}.json","r") as file:
            data = json.dump(file)
        account = BankAccount(data["account_number"], data["name"], data["balance"])
        account.transactions = data["transactions"]
        return account

def main():
    print("Welcome to Banking Application.\n")
    accounts = {}

    while True:
        print("\n1. Create Account\n2. Deposit\n3. Withdraw\n4. Transfer\n5. View Transaction\n6. Check balance\n7. Exit")
        choice = input("Enter your choice: ")

        if choice == "1":
            account_number = input("Enter account number: ")
            name = input("Enter account holder's name: ")
            if account_number in accounts:
                print("Account already exists.")
                continue
            accounts[account_number] = BankAccount(account_number,name)
            print("Account created successfully.")
        elif choice == "2":
            account_number = input("Enter account number: ")
            if account_number not in accounts:
                print("Account dose not exists.")
                continue
            amount = float(input("Enter amount to deposit: "))
            accounts[account_number].deposit(amount)

        elif choice == "3":
            account_number= input("Enter account number: ")
            if account_number not in accounts:
                print("Account dose not exists.")
                continue
            amount = float(input("Enter amount to withdraw: "))
            accounts[account_number].withdraw(amount)

        elif choice == "4":
            sender_account = input("Enter account number: ")
            if sender_account not in accounts:
                print("Account dose not exists.")
                continue
            receiver_account = input("Enter receiver's account number: ")
            if receiver_account not in accounts:
                print("Receiver's account number dose not exists.")
                continue
            amount = float(input("Enter amount to transfer: "))
            accounts[account_number].transfer(amount,accounts[receiver_account])

        elif choice == "5":
            account_number=input("Enter account number: ")
            if account_number not in accounts:
                print("Account number dose not exists.")
                continue
            accounts[account_number].view_transactions()
            

        elif choice=="6":
            account_number=input("Enter account number: ")
            if account_number not in accounts:
                print("Account number dose not exists.")
                continue
            accounts[account_number].get_balance()

        elif choice == "7":
            for account in accounts.values():
                print(account)
            print("Exiting.... Have a nice day!.")
            break
        else:
            print("Invalid choice. Please try again.")

if __name__=="__main__":
    main()



    
