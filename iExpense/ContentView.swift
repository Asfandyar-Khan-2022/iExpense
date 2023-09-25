//
//  ContentView.swift
//  iExpense
//
//  Created by Mac User on 25/09/2023.
//

import SwiftUI

/// An expense sheet that shows your spending.
/// Split to show the areas you have spent in.
/// The expense and be added or removed.
struct ContentView: View {
    
    /// StateObject is used so that the view is refreshed when Published changes within the class
    @StateObject var expenses = Expense()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                Section("Personal") {
                    Sec(expenses: expenses, type: "Personal")
                }
                Section("Business") {
                    Sec(expenses: expenses, type: "Business")
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label : {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    
    /// Remove item from list
    /// - Parameter offsets: Index value of the item to be removed
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
