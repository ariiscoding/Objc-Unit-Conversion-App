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
    OutputWeightUnit *cm = OutputWeightUnit.cm;
    OutputWeightUnit *meter = OutputWeightUnit.meter;
    OutputWeightUnit *feet = OutputWeightUnit.feet;
    OutputWeightUnit *mile = OutputWeightUnit.mile;
    
    _destinationUnits = [NSArray arrayWithObjects:cm, meter, feet, mile, nil];
}

@end
