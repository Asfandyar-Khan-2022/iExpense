//
//  ExpenseSection.swift
//  iExpense
//
//  Created by Mac User on 25/09/2023.
//

import SwiftUI

struct Sec: View {
    @ObservedObject var expenses: Expense
    var type : String
    
    var body: some View {
            ForEach(expenses.items) { item in
                if item.type == type {
                    HStack {
                        VStack {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        
                        Spacer()
                        
                        Text("\(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))")
                            .fontWeight((item.amount < 10) ? .regular : ((item.amount < 100) ? .medium : (.bold)))
                    }
                }
            }
            .onDelete(perform: removeItems)
    }
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}
