//
//  MovieActorsView.swift
//  Movie Adviser
//
//  Created by Can Özgür on 9.07.2024.
//

import SwiftUI

struct MovieActorsView: View {
    var name : String
    var surname : String
    var job : String
    var body: some View {
        VStack(alignment:.center){
            ZStack{
                Image("michelleRodriguez")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(Circle())
            }
           
                .frame(height: 90)
                .foregroundColor(.white)
            // jobs
            Text("\(job)")
                .foregroundStyle(.white)
                .fontWeight(.semibold)
                .padding(.bottom,5)
                .font(.system(size: 14))
            Text("\(name)")
                .frame(width: 100)
                .foregroundColor(.white)
            Text("\(surname)")
                .frame(width: 100)
                .foregroundColor(.white)
        }//.padding(.bottom)
    }
}

#Preview {
    MovieActorsView(name: "can", surname: "ozgur", job: "iOS Dev").preferredColorScheme(.dark)
}
