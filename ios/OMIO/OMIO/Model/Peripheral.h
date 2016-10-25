//
//  Peripheral.h
//  OMIO
//
//  Created by aybars yalcin on 11/7/14.
//  Copyright (c) 2014 Quasar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SerialGATT.h"

@class CBPeripheral;

@interface Peripheral : NSObject
@property (strong, nonatomic) CBPeripheral *peripheral;
@property (strong, nonatomic) SerialGATT *sensor;
@end
