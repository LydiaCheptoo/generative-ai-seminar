def show_menu():
    print("\n=== Simple Expense Tracker ===")
    print("1. Add Expense")
    print("2. View Expenses")
    print("3. View Total")
    print("4. Exit")

def add_expense(expenses):
    item = input("Enter expense name: ")
    cost = float(input("Enter cost (in KES): "))
    expenses.append({"item": item, "cost": cost})
    print(f"✅ Added: {item} - KES {cost:.2f}")

def view_expenses(expenses):
    if not expenses:
        print("No expenses recorded yet.")
    else:
        print("\nYour Expenses:")
        for i, expense in enumerate(expenses, 1):
            print(f"{i}. {expense['item']} - KES {expense['cost']:.2f}")

def view_total(expenses):
    total = sum(e["cost"] for e in expenses)
    print(f"\n💰 Total spent: KES {total:.2f}")

def main():
    expenses = []  # stores all expense records in memory
    while True:
        show_menu()
        choice = input("Choose an option: ")

        if choice == "1":
            add_expense(expenses)
        elif choice == "2":
            view_expenses(expenses)
        elif choice == "3":
            view_total(expenses)
        elif choice == "4":
            print("Exiting... Goodbye!")
            break
        else:
            print("Invalid option, please try again.")

if __name__ == "__main__":
    main()
