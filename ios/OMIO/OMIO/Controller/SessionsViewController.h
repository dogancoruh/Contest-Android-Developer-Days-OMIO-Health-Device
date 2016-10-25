//
//  SessionsViewController.h
//  OMIO
//
//  Created by aybars yalcin on 11/7/14.
//  Copyright (c) 2014 Quasar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SerialGATT.h"
#import "Peripheral.h"
#define RSSI_THRESHOLD -60
#define WARNING_MESSAGE @"z"

@class CBPeripheral;
@class SerialGATT;

@interface SessionsViewController : UIViewController<BTSmartSensorDelegate>
{
    NSTimer *tempTimer;
}
@property(nonatomic,retain) Peripheral * peripheral;

@property (strong, nonatomic) NSMutableArray *rssi_container; // used for contain the indexers of the lower rssi value

@property (weak, nonatomic) IBOutlet UILabel *lblTemp;


- (IBAction)sendMsgToArduino:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *MsgToArduino;
@property (weak, nonatomic) IBOutlet UITextView *tvRecv;
@property (weak, nonatomic) IBOutlet UILabel *lbDevice;

@end
