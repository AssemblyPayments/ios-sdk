//
//  PromisePayCardScanner.m
//  Pods
//
//  Created by Matthew Martin on 2/06/2016.
//
//

#import "PromisePayCardScanner.h"

@implementation PromisePayCardScanner

- (id)init {
    self = [super init];

    if(self){
        [CardIOUtilities preload];
    }

    return self;
}

- (void)scanCardFromViewController:(UIViewController*)viewController {
    CardIOPaymentViewController *scanViewController = [[CardIOPaymentViewController alloc] initWithPaymentDelegate:self];
    scanViewController.hideCardIOLogo = YES;
    scanViewController.collectCardholderName = YES;
    [viewController presentViewController:scanViewController animated:YES completion:nil];

}

#pragma mark - CardIODelegate methods

- (void)userDidCancelPaymentViewController:(CardIOPaymentViewController *)scanViewController {
    [scanViewController dismissViewControllerAnimated:YES completion:nil];
    [self.delegate userDidCancelCardScanning];
}

- (void)userDidProvideCreditCardInfo:(CardIOCreditCardInfo *)info inPaymentViewController:(CardIOPaymentViewController *)scanViewController {
    // The full card number is available as info.cardNumber, but don't log that!
    // NSLog(@"Received card info. Number: %@, expiry: %02ld/%ld, cvv: %@.", info.redactedCardNumber, info.expiryMonth, info.expiryYear, info.cvv);
    PPCard *card = [[PPCard alloc] initWithNumber:info.cardNumber
                                         fullName:info.cardholderName
                                      expiryMonth:[NSString stringWithFormat:@"%ld", info.expiryMonth]
                                       expiryYear:[NSString stringWithFormat:@"%ld", info.expiryYear]
                                              cvv:info.cvv];
    [scanViewController dismissViewControllerAnimated:YES completion:nil];
    [self.delegate userDidScanCard:card];
}

@end
