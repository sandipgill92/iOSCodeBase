//
//  EnumConstants.swift
//  Nextillo
//
//  Created by Sandip Gill on 26/07/22.
//

import UIKit

typealias callback<T: Codable> = ((_ status: Bool,_ respondeModel: T?,_ error: Error?) -> Void)? 

enum ToastType {
    case error
    case validation
}
