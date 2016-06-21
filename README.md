# PromisePay - iOS SDK

[![CI Status](http://img.shields.io/travis/KevinHakans/PromisePay.svg?style=flat)](https://travis-ci.org/KevinHakans/PromisePay)
[![Version](https://img.shields.io/cocoapods/v/PromisePay.svg?style=flat)](http://cocoapods.org/pods/PromisePay)
[![License](https://img.shields.io/cocoapods/l/PromisePay.svg?style=flat)](http://cocoapods.org/pods/PromisePay)
[![Platform](https://img.shields.io/cocoapods/p/PromisePay.svg?style=flat)](http://cocoapods.org/pods/PromisePay)

#1. Installation

## Manual

Download the latest release from GitHub, then add the PromisePay holder to your relevant xcode project.

## CocoaPods

PromisePay is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "PromisePay"
```

#2. Usage
Import the header and create PromisePay object.
```Objective-C
#import "PromisePay.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

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

```

###Using the card scanner

Declare conformity to the `PromisePayCardScannerDelegate` protocol.
```Objective-C
#import "PromisePayCardScanner.h"

@interface ViewController : UIViewController <PromisePayCardScannerDelegate>

@end
```

Implement the delegate methods in your view controller.
```Objective-C
#import "PromisePay.h"

@interface ViewController ()

@property (nonatomic, strong) PromisePay *promisePay;
@property (nonatomic, strong) PromisePayCardScanner *promisePayCardScanner;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Initialize the PromisePay with the Environment and PublickKey
    PromisePay *promisePay = [[PromisePay alloc] initWithEnvironment:@"prelive" publicKey:@"cbd748a608eda8635e1f325d914080b4"];

    // Initialize the PromisePayCardScanner
    self.promisePayCardScanner = [[PromisePayCardScanner alloc] init];
    self.promisePayCardScanner.delegate = self;

}

#pragma mark - PromisePayCardScannerDelegate methods

- (void)userDidScanCard:(PPCard *)card {
    [self.promisePay createCardAccount:@"460b3a207121352b1d48aa0724734e4b" card:card callBack:^(id  result, NSError * error) {
        // TODO: process with the callback
    }];
}

- (void)userDidCancelCardScanning {
    NSLog(@"user cancelled");
}

@end
```

Start the card scanner
```Objective-C
[self.promisePayCardScanner scanCardFromViewController:self];
```

#3. Examples
##Configuration
Initialize PromisePay using as following.
```Objective-C
PromisePay *promisePay = [[PromisePay alloc] initWithEnvironment:@"prelive" publicKey:@"PUBLIC_KEY"];
```


##Create Card Account
Create the PPCard object with the information of card like this.
```ObjectiveC
PPCard *card = [[PPCard alloc] initWithNumber:@"4111111111111111"
                                     fullName:@"Bobby Buyer"
                                  expiryMonth:@"12"
                                   expiryYear:@"2020"
                                          cvv:@"123"];
```

Now calling the createCardAccount method, you can get the callback of result.
````ObjectiveC
[promisePay createCardAccount:@"CARD_TOKEN" card:card callBack:^(id  _Nonnull result, NSError * _Nonnull error) {
    if(error != nil) {
        NSLog(@"error = %@", error);
    }
    else {
        NSLog(@"Succeed to create card account, result=%@", result);
    }
}];
```

Alternatively use the card scanner to return a PPCard object by implementing the delegate methods.
```ObjectiveC
- (void)userDidScanCard:(PPCard *)card {
    [self.promisePay createCardAccount:@"460b3a207121352b1d48aa0724734e4b" card:card callBack:^(id  result, NSError * error) {
        // TODO: process with the callback
    }];
}

- (void)userDidCancelCardScanning {
    NSLog(@"user cancelled");
}
```

Start the card scanner
```Objective-C
[self.promisePayCardScanner scanCardFromViewController:self];
```

#4. License

PromisePay is available under the MIT license. See the LICENSE file for more info.

#5. Requirements

Third-party open source libraries used within PromisePay:

1. [CardIO](https://github.com/card-io/card.io-iOS-SDK) - Credit card scanning
