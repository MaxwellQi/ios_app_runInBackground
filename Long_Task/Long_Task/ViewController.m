//
//  ViewController.m
//  Long_Task
//
//  Created by qi on 05/02/2018.
//  Copyright © 2018 tvu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//@property (nonatomic,strong)NSTimer *executeTimer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
//    if (_executeTimer == nil) {
//        _executeTimer = [NSTimer scheduledTimerWithTimeInterval:1.0f
//                                                          target:self
//                                                        selector:@selector(info)
//                                                        userInfo:nil
//                                                         repeats:YES];
//    }
}

- (void)info
{
    NSLog(@"app running..");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
