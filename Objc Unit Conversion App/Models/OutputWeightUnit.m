//
//  OutputWeightUnit.m
//  Objc Unit Conversion App
//
//  Created by Ari He on 7/30/21.
//

#import "OutputWeightUnit.h"

@implementation OutputWeightUnit

- (id)initWith: (OutputWeightUnitCase)unit {
    self = [super init];
    
    _unit = unit;
    
    return self;
}

- (NSString*)getUnitName {
    switch (_unit) {
    case centimeter:
        return @"centimeter";
    case meter:
        return @"meter";
    case feet:
        return @"feet";
    case mile:
        return @"mile";
    }
}

+ (OutputWeightUnit*)cm {
    return [[OutputWeightUnit alloc] initWith:centimeter];
}

+ (OutputWeightUnit*)meter {
    return [[OutputWeightUnit alloc] initWith:meter];
}

+ (OutputWeightUnit*)feet {
    return [[OutputWeightUnit alloc] initWith:feet];
}

+ (OutputWeightUnit*)mile {
    return [[OutputWeightUnit alloc] initWith:centimeter];
}

@end
