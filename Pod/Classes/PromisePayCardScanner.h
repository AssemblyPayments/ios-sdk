//
//  PromisePayCardScanner.h
//  Pods
//
//  Created by Matthew Martin on 2/06/2016.
//
//

#import <Foundation/Foundation.h>

#import "PPCard.h"
#import "CardIO.h"

/// The receiver will be notified when the PromisePayCardScanning flow completes, due to either success or user-cancellation.
///
/// Exactly one of these delegate methods will be called.
@protocol PromisePayCardScannerDelegate<NSObject>

@required

/// This method will be called if the user cancels the scan.
- (void)userDidCancelCardScanning;

/// This method will be called when there is a successful scan (or manual entry).
/// @param card The initialised PromisePay card object resulting from the scan.
- (void)userDidScanCard:(PPCard *)card;

@end

@interface PromisePayCardScanner : NSObject <CardIOPaymentViewControllerDelegate>

@property (nonatomic, weak) id<PromisePayCardScannerDelegate> delegate;

- (void)scanCardFromViewController:(UIViewController*)viewController;

@end
