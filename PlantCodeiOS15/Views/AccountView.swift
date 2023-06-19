//
//  AccountView.swift
//  PlantCodeiOS15
//
//  Created by Aeliana Shen on 6/5/23.
//

import SwiftUI

struct AccountView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    var body: some View {
        VStack{
            Image(systemName: "person.crop.circle")
                .resizable()
                .foregroundColor(ProjColor.SnowDrift)
                .frame(width: 200, height: 200)
                .padding()
            
            Text("Aeliana Shen")
                .font(.title)
                .foregroundColor(ProjColor.PrimaryGreen)
                .bold()
                .padding(.bottom, 50)
            
            Text("Back to Onboarding")
                .font(.title3)
                .bold()
                .frame(width: 280, height: 50)
                .background(ProjColor.Gumleaf)
                .foregroundColor(.white)
                .cornerRadius(10)
                .onTapGesture {
                    isOnboardingViewActive = !isOnboardingViewActive
                }
        }
        
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
