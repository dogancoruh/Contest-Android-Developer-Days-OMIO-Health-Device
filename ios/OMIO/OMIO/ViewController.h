//
//  ViewController.h
//  OMIO
//
//  Created by aybars yalcin on 11/6/14.
//  Copyright (c) 2014 Quasar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SerialGATT.h"
@interface ViewController : UIViewController<BTSmartSensorDelegate>

@property (strong, nonatomic) SerialGATT *sensor;
@property (nonatomic, retain) NSMutableArray *peripheralViewControllerArray;

@end

