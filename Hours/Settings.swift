//
//  Settings.swift
//  Hours
//
//  Created by Paul Thorsen on 6/21/19.
//  Copyright © 2019 Paul Thorsen. All rights reserved.
//

import SwiftUI

struct Settings : View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("bg")
                
                VStack(spacing: 0) {
                    VStack {
                        Toggle(isOn: $userData.iCloudCalenderOn) {
                                Text("Show iCloud Events")
                        }
                        .padding(.all)
                    }
                    .background(Color("cellWhite"))
                    
                    HorizontalDivider(borderColor: Color("borderGray"))

                    VStack(alignment: .leading) {
                        VStack(spacing: 0) {
                            Toggle(isOn: $userData.notificationsOn) {
                                Text("Notifications")
                            }
                            
                            if self.userData.notificationsOn {
                                VStack {
                                    Text("Minutes before event")
                                        .foregroundColor(Color("textGray"))
                                    Picker("Minutes", selection: $userData.minutesBeforeNotification) {
                                        ForEach(UserData.Time.allCases, id: \.self) { time in
                                            Text(time.rawValue).tag(time)
                                        }
                                    }.pickerStyle(SegmentedPickerStyle())
                                }
                                .padding(.all)
                            }
                        }
                        .padding(.all)
                    }
                    .background(Color("cellWhite"))
                    HorizontalDivider(borderColor: Color("borderGray"))
                    Spacer()
                }
                .navigationBarTitle(Text("Settings"), displayMode: .inline)
            }
        }
    }
}

#if DEBUG
struct Settings_Previews : PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return Settings()
            .environmentObject(userData)
    }
}
#endif
