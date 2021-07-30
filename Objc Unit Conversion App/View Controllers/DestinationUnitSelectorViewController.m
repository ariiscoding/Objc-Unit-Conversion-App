//
//  DestinationUnitSelectorViewController.m
//  Objc Unit Conversion App
//
//  Created by Ari He on 7/30/21.
//

#import "DestinationUnitSelectorViewController.h"
#import "OutputWeightUnit.h"

@implementation DestinationUnitSelectorViewController

// MARK: - Properties

NSArray *_destinationUnits;

// MARK: - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self injectAllAvailableUnits];
}

// MARK: - View Setup


// MARK: - Constraints

// MARK: - Helper Methods

- (void)injectAllAvailableUnits {
//    _destinationUnits = [NSArray arrayWithObjects:centimeter, meter, feet, mile, nil];
}

@end
