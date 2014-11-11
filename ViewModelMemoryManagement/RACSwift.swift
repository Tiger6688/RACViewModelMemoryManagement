//
//  RACSwift.swift
//  ViewModelMemoryManagement
//
//  Created by Emanuele Rudel on 10/11/14.
//  Copyright (c) 2014 BuddyHopp. All rights reserved.
//

struct RAC {
    var target: NSObject
    var keyPath: String
    var nilValue: AnyObject?
    
    init(_ target: NSObject, _ keyPath: String, _ nilValue: AnyObject? = nil) {
        self.target = target
        self.keyPath = keyPath
        self.nilValue = nilValue
    }
    
    func assignSignal(signal: RACSignal) {
        signal.setKeyPath(keyPath, onObject: target, nilValue: nilValue)
    }
}

infix operator ~> {}
func ~> (rac: RAC, signal: RACSignal) {
    rac.assignSignal(signal)
}

func RACObserve(target: NSObject, keyPath: String) -> RACSignal {
    return target.rac_valuesForKeyPath(keyPath, observer: target)
}