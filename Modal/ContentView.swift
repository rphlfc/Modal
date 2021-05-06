//
//  ContentView.swift
//  Modal
//
//  Created by Raphael Cerqueira on 06/05/21.
//

import SwiftUI

struct ContentView: View {
    @State var isModalVisible = false
    
    var body: some View {
        ZStack {
            Button(action: {
                isModalVisible.toggle()
            }, label: {
                Text("Show modal")
                    .frame(width: 120, height: 60)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            })
            
            if isModalVisible {
                ModalView(isVisible: $isModalVisible)
            }
        }
    }
}

struct ModalView: View {
    @Binding var isVisible: Bool
    
    var body: some View {
        ZStack {
            Color.primary.opacity(0.3)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                HStack {
                    Spacer()
                    
                    Button(action: {
                        toggleVisible()
                    }, label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.primary)
                            .padding(8)
                            .background(Color(UIColor.systemBackground))
                            .clipShape(Circle())
                            .shadow(radius: 3)
                    })
                }
                
                Image(systemName: "hand.thumbsup")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50)
                
                Text("Payment\ncompleted")
                    .font(.title3)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Text("Congratulations! Your payment has been successfully completed.")
                    .multilineTextAlignment(.center)
                
                Button(action: {
                    toggleVisible()
                }, label: {
                    Text("Finish")
                        .foregroundColor(Color(UIColor.systemBackground))
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(Color.primary)
                        .cornerRadius(15)
                })
            }
            .padding()
            .background(Color(UIColor.systemBackground))
            .cornerRadius(15)
            .padding()
        }
    }
    
    func toggleVisible() {
        isVisible.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
