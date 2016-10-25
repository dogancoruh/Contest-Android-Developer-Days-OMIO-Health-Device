//
//  DatabaseAdapter.m
//  OMIO
//
//  Created by aybars yalcin on 11/6/14.
//  Copyright (c) 2014 Quasar. All rights reserved.
//

#import "DatabaseAdapter.h"
#import "FMDatabase.h"
#import "MeasurementSession.h"
@implementation DatabaseAdapter


+(void)addMeasurementSession:(MeasurementSession*)measurementSession
{

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    
    NSString *dbPath = [documentsDirectory stringByAppendingString:@"/Omio.sqlite"];
    FMDatabase *db = [FMDatabase databaseWithPath:dbPath];
    [db open];
    
    NSMutableDictionary *argsDict = [[NSMutableDictionary alloc]init];
    [argsDict setObject:measurementSession.startDate forKey:@"startDate"];
    [argsDict setObject:measurementSession.endDate forKey:@"endDate"];
    [argsDict setObject:measurementSession.name forKey:@"name"];
    
    
    [db executeUpdate:@"INSERT INTO MeasurementSessions (startDate,endDate,name) VALUES (:startDate,:endDate,:name)" withParameterDictionary:argsDict];

    [db close];
    
}
+(NSMutableArray*)getMeasurementSessions
{
   
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    
    NSString *dbPath = [documentsDirectory stringByAppendingString:@"/Omio.sqlite"];
    FMDatabase *db = [FMDatabase databaseWithPath:dbPath];
    [db open];
    
    NSMutableArray *measurementSessions = [[NSMutableArray alloc]init];
    FMResultSet *s = [db executeQuery:@"SELECT * FROM MeasurementSessions"];
    while ([s next]) {
        
        MeasurementSession *measurementSession = [[MeasurementSession alloc]init];
        //retrieve values for each record
        measurementSession.id_ = [s intForColumnIndex:0];
        measurementSession.startDate = [s dateForColumnIndex:1];
        measurementSession.endDate = [s dateForColumnIndex:2];
        measurementSession.name = [s stringForColumnIndex:3];
        
        [measurementSessions addObject:measurementSession];
        
    }

    return measurementSessions;
}



+(void)setMeasurementDeviceUUID:(NSString*)uuid
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    
    NSString *dbPath = [documentsDirectory stringByAppendingString:@"/Omio.sqlite"];
    FMDatabase *db = [FMDatabase databaseWithPath:dbPath];
    [db open];
    
    NSMutableDictionary *argsDict = [[NSMutableDictionary alloc]init];
    [argsDict setObject:uuid forKey:@"uuid"];
    
    
    [db executeUpdate:@"INSERT INTO MeasurementDevices (uuid) VALUES (:uuid)" withParameterDictionary:argsDict];
    
    [db close];
    
}
+(NSString*)getMeasurementDeviceUUID
{
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    
    NSString *dbPath = [documentsDirectory stringByAppendingString:@"/Omio.sqlite"];
    FMDatabase *db = [FMDatabase databaseWithPath:dbPath];
    [db open];
    
    FMResultSet *s = [db executeQuery:@"SELECT * FROM MeasurementSessions"];
    while ([s next]) {
        //retrieve values for each record
        int _id = [s intForColumnIndex:0];
        NSString *uuid = [s stringForColumnIndex:1];
        NSLog(@"%d -- %@",_id,uuid);
        [db close];
        
        return uuid;
    }

    return nil;
}





+(void)addMeasurementLog:(MeasurementLog*)measurementLog
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    
    NSString *dbPath = [documentsDirectory stringByAppendingString:@"/Omio.sqlite"];
    FMDatabase *db = [FMDatabase databaseWithPath:dbPath];
    [db open];
    
    NSMutableDictionary *argsDict = [[NSMutableDictionary alloc]init];
    [argsDict setObject:[NSNumber numberWithInt:measurementLog.sessionId] forKey:@"sessionId"];
    [argsDict setObject:[NSNumber numberWithFloat:measurementLog.value] forKey:@"value"];
    [argsDict setObject:[NSDate date] forKey:@"logDate"];
    [db executeUpdate:@"INSERT INTO MeasurementLogs (sessionId,value,logDate) VALUES (:sessionId,:value,:logDate)" withParameterDictionary:argsDict];
    
    [db close];

}


+(NSMutableArray*)getMeasurementLogs
{
    return nil;
}

+(void)addMeasurementSetting:(float)warningValue doctorEmailAddress:(NSString*)doctorEmailAddress
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    
    NSString *dbPath = [documentsDirectory stringByAppendingString:@"/Omio.sqlite"];
    FMDatabase *db = [FMDatabase databaseWithPath:dbPath];
    [db open];
    
    NSMutableDictionary *argsDict = [[NSMutableDictionary alloc]init];
    [argsDict setObject:[NSNumber numberWithFloat:warningValue] forKey:@"warningValue"];
    [argsDict setObject:doctorEmailAddress forKey:@"doctorEmailAddress"];

    [db executeUpdate:@"INSERT INTO MeasurementSettings (warningValue,doctorEmailAddress) VALUES (:warningValue,:doctorEmailAddress)" withParameterDictionary:argsDict];
    
    [db close];
}
+(NSMutableArray*)getMeasurementSettings
{
    return nil;
}

@end
