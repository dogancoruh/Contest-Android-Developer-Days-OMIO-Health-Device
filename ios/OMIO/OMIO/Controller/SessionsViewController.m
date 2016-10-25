//
//  SessionsViewController.m
//  OMIO
//
//  Created by aybars yalcin on 11/7/14.
//  Copyright (c) 2014 Quasar. All rights reserved.
//

#import "SessionsViewController.h"
#import "DatabaseAdapter.h"
@interface SessionsViewController ()

@end

@implementation SessionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    [self sendMessage:@"T"];
    
    [self startTimer];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.peripheral.sensor.delegate = self;

}
-(void)startTimer
{
    tempTimer = [NSTimer scheduledTimerWithTimeInterval:2
                                                 target:self
                                               selector:@selector(sendTimer:)
                                               userInfo:@"T"
                                                repeats:YES];
}
//recv data
-(void) serialGATTCharValueUpdated:(NSString *)UUID value:(NSData *)data
{
    NSString *value = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    
    self.lblTemp.text = [NSString stringWithFormat:@"temp %@",value];
    [tempTimer invalidate];
    tempTimer = [NSTimer scheduledTimerWithTimeInterval:2
                                                 target:self
                                               selector:@selector(sendTimer:)
                                               userInfo:@"T"
                                                repeats:YES];
    
    MeasurementLog *log = [[MeasurementLog alloc]init];
    log.sessionId = 1;
    log.value = [value floatValue];
    log.logDate = [NSDate date];
    [DatabaseAdapter addMeasurementLog:log];
    
}

-(void)sendTimer:(NSTimer*)timer
{
    NSLog(@"timer check");
    NSString *command = [timer userInfo];
    [self sendMessage:command];
}
//send data
-(void)sendMessage:(NSString*)text
{
    NSData *data = [text dataUsingEncoding:[NSString defaultCStringEncoding]];
    if(data.length > 20)
    {
        int i = 0;
        while ((i + 1) * 20 <= data.length) {
            NSData *dataSend = [data subdataWithRange:NSMakeRange(i * 20, 20)];
            [self.peripheral.sensor write:self.peripheral.sensor.activePeripheral data:dataSend];
            i++;
        }
        i = data.length % 20;
        if(i > 0)
        {
            NSData *dataSend = [data subdataWithRange:NSMakeRange(data.length - i, i)];
            [self.peripheral.sensor write:self.peripheral.sensor.activePeripheral data:dataSend];
        }
        
    }else
    {
        //NSData *data = [MsgToArduino.text dataUsingEncoding:[NSString defaultCStringEncoding]];
        [self.peripheral.sensor write:self.peripheral.sensor.activePeripheral data:data];
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setConnect
{
    CFStringRef s = CFUUIDCreateString(kCFAllocatorDefault, (__bridge CFUUIDRef )self.peripheral.sensor.activePeripheral.identifier);
    //HMSoftUUID.text = (__bridge NSString*)s;
    //tvRecv.text = @"OK+CONN";
}

-(void)setDisconnect
{
    //tvRecv.text= [tvRecv.text stringByAppendingString:@"OK+LOST"];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
