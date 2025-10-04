walker init {
    has expenses: list;

    can add_expense, view_expenses, view_total, menu;

    take -> menu;
}

walker menu {
    can add_expense, view_expenses, view_total;

    take -> {
        std.out("\n=== Simple Expense Tracker (JAC) ===");
        std.out("1. Add Expense");
        std.out("2. View Expenses");
        std.out("3. View Total");
        std.out("4. Exit");
        std.out("Choose an option: ");

        has choice = std.in();

        if (choice == "1") {
            take -> add_expense;
        }
        elif (choice == "2") {
            take -> view_expenses;
        }
        elif (choice == "3") {
            take -> view_total;
        }
        elif (choice == "4") {
            std.out("Exiting... Goodbye!");
        }
        else {
            std.out("Invalid option, please try again.");
            take -> menu;
        }
    }
}

walker add_expense {
    take -> {
        std.out("Enter expense name: ");
        has item = std.in();
        std.out("Enter cost (in KES): ");
        has cost = std.float(std.in());

        root.expenses.append({"item": item, "cost": cost});
        std.out("✅ Added: " + item + " - KES " + std.str(cost));

        take -> menu;
    }
}

walker view_expenses {
    take -> {
        if (root.expenses.len() == 0) {
            std.out("No expenses recorded yet.");
        }
        else {
            std.out("\nYour Expenses:");
            for e in root.expenses {
                std.out(e["item"] + " - KES " + std.str(e["cost"]));
            }
        }
        take -> menu;
    }
}

walker view_total {
    take -> {
        has total = 0;
        for e in root.expenses {
            total += e["cost"];
        }
        std.out("\n💰 Total spent: KES " + std.str(total));
        take -> menu;
    }
}
