//
//  SplashViewController.m
//  OMIO
//
//  Created by aybars yalcin on 11/7/14.
//  Copyright (c) 2014 Quasar. All rights reserved.
//

#import "SplashViewController.h"
#import "DatabaseAdapter.h"
#import "DevicesViewController.h"
#import "SessionsViewController.h"
@interface SplashViewController ()

@end

@implementation SplashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(changeViewController:) userInfo:nil repeats:NO];

    // Do any additional setup after loading the view.
}
-(void)changeViewController:(NSTimer*)timer
{
    UIStoryboard *storyboard1 = [UIStoryboard storyboardWithName:@"Main" bundle:nil];

    if ([DatabaseAdapter getMeasurementDeviceUUID] == nil) {
        //listeyi ac
        
        DevicesViewController * devicesViewController= [storyboard1 instantiateViewControllerWithIdentifier:@"DevicesViewController"];
        
        [self presentViewController:devicesViewController animated:YES completion:nil];
        
        
        
    }
    else //session sayfasini ac
    {
        SessionsViewController * sessionsViewController= [storyboard1 instantiateViewControllerWithIdentifier:@"SessionsViewController"];
    
        [self presentViewController:sessionsViewController animated:YES completion:nil];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
