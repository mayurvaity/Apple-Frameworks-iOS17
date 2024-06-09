//
//  FrameworkGridViewModel.swift
//  Apple-Frameworks-iOS17
//
//  Created by Mayur Vaity on 07/06/24.
//

import SwiftUI

//if u r not gonna subclass ur class, make it final
//conform to ObservableObject to broadcast its changes
final class FrameworkGridViewModel: ObservableObject {
    
    //.flexible - to make sure it adopts to any grid dimensions
    //no if GridItem specified in the array determine no of columns (in this case 3)
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
}
