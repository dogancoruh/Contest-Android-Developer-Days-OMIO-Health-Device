//
//  DatabaseAdapter.h
//  OMIO
//
//  Created by aybars yalcin on 11/6/14.
//  Copyright (c) 2014 Quasar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MeasurementSession.h"
#import "MeasurementLog.h"
@interface DatabaseAdapter : NSObject

+(void)addMeasurementSession:(MeasurementSession*)measurementSession;
+(NSMutableArray*)getMeasurementSessions;

+(void)setMeasurementDeviceUUID:(NSString*)uuid;
+(NSString*)getMeasurementDeviceUUID;

+(void)addMeasurementLog:(MeasurementLog*)measurementLog;
+(NSMutableArray*)getMeasurementLogs;

+(void)addMeasurementSetting:(float)warningValue doctorEmailAddress:(NSString*)doctorEmailAddress;
+(NSMutableArray*)getMeasurementSettings;
@end
