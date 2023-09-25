//
//  ContentView.swift
//  iExpense
//
//  Created by Mac User on 25/09/2023.
//

import SwiftUI


struct ContentView: View {
    @StateObject var expenses = Expense()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                Section("Personal") {
                    Sec(expenses: expenses, type: "Personal").navigationTitle("test")
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
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
