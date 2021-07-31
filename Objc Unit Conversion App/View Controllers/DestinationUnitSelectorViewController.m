//
//  DestinationUnitSelectorViewController.m
//  Objc Unit Conversion App
//
//  Created by Ari He on 7/30/21.
//

#import "DestinationUnitSelectorViewController.h"

@implementation DestinationUnitSelectorViewController

// MARK: - Properties

NSArray *_destinationUnits;
UISegmentedControl *_segmentedControl;

// MARK: - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self injectAllAvailableUnits];
    [self setUpSegmentedControl];
    [self setUpConstraints];
    
    [self.view sizeToFit];
}

// MARK: - View Setup
- (void)setUpSegmentedControl {
    _segmentedControl = [[UISegmentedControl alloc] initWithItems: [self getAvailableUnitsStringArray]];
    
    _segmentedControl.selectedSegmentIndex = 0;
    
    [self.view addSubview:_segmentedControl];
}

// MARK: - Constraints

- (void)setUpConstraints {
    _segmentedControl.translatesAutoresizingMaskIntoConstraints = FALSE;
    
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:_segmentedControl attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:_segmentedControl attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:_segmentedControl attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
    
    NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:_segmentedControl attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
    
    NSArray *constraints = [NSArray arrayWithObjects:top, bottom, leading, trailing, nil];
    [self.view addConstraints:constraints];
}

// MARK: - Helper Methods

- (void)injectAllAvailableUnits {
    OutputWeightUnit *cm = OutputWeightUnit.cm;
    OutputWeightUnit *meter = OutputWeightUnit.meter;
    OutputWeightUnit *feet = OutputWeightUnit.feet;
    OutputWeightUnit *mile = OutputWeightUnit.mile;
    
    _destinationUnits = [NSArray arrayWithObjects:cm, meter, feet, mile, nil];
}

- (NSArray*)getAvailableUnitsStringArray {
    NSMutableArray *array = [NSMutableArray new];
    
    for (int i = 0; i < _destinationUnits.count; i++) {
        OutputWeightUnit *unit = [_destinationUnits objectAtIndex: i];
        
        NSString* unitString = [unit getUnitName];
        
        [array addObject:unitString];
    }
    
    return [[NSArray alloc] initWithArray:array];
}

- (NSInteger)getSelectedSegmentIndex {
    return _segmentedControl.selectedSegmentIndex;
}

- (OutputWeightUnit*)getSelectedDestinationUnit {
    return _destinationUnits[[self getSelectedSegmentIndex]];
}

- (NSString*)getCurrentlySelectedUnitString {
    OutputWeightUnit *unit = [self getSelectedDestinationUnit];
    
    return [unit getUnitName];
}

@end
