//
//  MeasurementSession.h
//  OMIO
//
//  Created by aybars yalcin on 11/6/14.
//  Copyright (c) 2014 Quasar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MeasurementSession : NSObject

@property(nonatomic,assign) int id_;
@property(nonatomic,retain) NSString * name;
@property(nonatomic,retain) NSDate * startDate;
@property(nonatomic,retain) NSDate * endDate;
@property(nonatomic,retain) NSMutableArray * logs;

@end
