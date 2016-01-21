//
//  PPViewController.m
//  PromisePay
//
//  Created by KevinHakans on 01/21/2016.
//  Copyright (c) 2016 KevinHakans. All rights reserved.
//

#import "PPViewController.h"
#import "PromisePay.h"

@interface PPViewController ()

@end

@implementation PPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Initialize the PromisePay with the Environment and PublickKey
    PromisePay *promisePay = [[PromisePay alloc] initWithEnvironment:@"prelive" publicKey:@"cbd748a608eda8635e1f325d914080b4"];
    
    // Create the Card
    PPCard *card = [[PPCard alloc] initWithNumber:@"4111111111111111"
                                         fullName:@"Bobby Buyer"
                                      expiryMonth:@"12"
                                       expiryYear:@"2020"
                                              cvv:@"123"];
    [promisePay createCardAccount:@"460b3a207121352b1d48aa0724734e4b" card:card callBack:^(id  result, NSError * error) {
        // TODO: process with the callback
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
