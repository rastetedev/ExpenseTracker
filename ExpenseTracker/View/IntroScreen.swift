//
//  IntroScreen.swift
//  ExpenseTracker
//
//  Created by Raul Emilio Astete Acuna on 22/12/23.
//

import SwiftUI

struct IntroScreen: View {
    //Visibility Status
    @AppStorage("isFirstTime") private var isFirstTime: Bool = true
    
    var body: some View {
        VStack(spacing: 15) {
            Text("What's New in the \nExpense Tracker?")
                .font(.largeTitle.bold())
                .multilineTextAlignment(.center)
                .padding(.top, 65)
                .padding(.bottom, 35)
            
            VStack(alignment: .leading, spacing: 25, content: {
                PointView(symbol: "dollarsign", 
                          title: "Transactions",
                          subtitle: "Keep track of your earnings and expenses.")
                PointView(symbol: "chart.bar.fill", 
                          title: "Visual Charts",
                          subtitle: "View your transactions using eye-catching graphic representations.")
                PointView(symbol: "magnifyingglass", 
                          title: "Advance Filters", 
                          subtitle: "Find the expenses ")
            })
            .frame(maxWidth : .infinity, alignment: .leading)
            .padding(.horizontal, 15)
            
            Spacer(minLength: 10)
            
            Button(action: {
                isFirstTime = false
            }, label: {
                Text("Continue")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.white)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .padding(.vertical, 14)
                    .background(appTint.gradient, in: .rect(cornerRadius: 12))
                    .contentShape(.rect)
                
            })
        }
        .padding(15)
        
    }
    
    //Point View
    @ViewBuilder
    func PointView(symbol: String, title: String, subtitle: String) -> some View {
        HStack(spacing: 20) {
            Image(systemName: symbol)
                .font(.largeTitle)
                .foregroundStyle(appTint.gradient)
                .frame(width: 45)
            
            VStack(alignment: .leading, spacing: 6, content: {
                
                Text(title)
                    .font(.title3)
                    .fontWeight(.semibold)
                
                Text(subtitle)
                    .foregroundStyle(.gray)
            })
        }
    }
}

#Preview {
    IntroScreen()
}
