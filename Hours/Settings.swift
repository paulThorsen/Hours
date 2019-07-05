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
        VStack(spacing: 20) {
                Toggle(isOn: $userData.iCloudCalenderOn) {
                    Text("Show iCloud Events")
                }
                Divider()

                VStack(alignment: .leading) {

                Toggle(isOn: $userData.notificationsOn) {
                    Text("Notifications")
                }

                if userData.notificationsOn {
                    VStack(alignment: .leading) {
                        Text("Minutes before event")
                        SegmentedControl(selection: $userData.minutesBeforeNotification) {
                            ForEach(UserData.Time.allCases.identified(by: \.self)) { time in
                                Text(time.rawValue).tag(time)
                            }
                        }
                    }
                    .padding(.leading)
                }

            }
            Spacer()
        }
        .padding(.all)
        .navigationBarTitle(Text("Settings"), displayMode: .inline)
        
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