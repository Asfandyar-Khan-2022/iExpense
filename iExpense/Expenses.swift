//
//  Expenses.swift
//  iExpense
//
//  Created by Mac User on 25/09/2023.
//

import Foundation

class Expense: ObservableObject {
    @Published var items = [ExpenseItem]()
}
