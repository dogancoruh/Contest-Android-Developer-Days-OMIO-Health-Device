//
//  MeasurementLog.h
//  OMIO
//
//  Created by aybars yalcin on 11/6/14.
//  Copyright (c) 2014 Quasar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MeasurementLog : NSObject

@property(nonatomic,assign) int sessionId;
@property(nonatomic,retain) NSDate * logDate;
@property(nonatomic,assign) float value;

@end
