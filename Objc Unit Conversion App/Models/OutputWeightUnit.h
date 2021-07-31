//
//  OutputWeightUnit.h
//  Objc Unit Conversion App
//
//  Created by Ari He on 7/29/21.
//

#ifndef OutputWeightUnit_h
#define OutputWeightUnit_h

#import <Foundation/Foundation.h>

typedef enum {
    centimeter, meter, feet, mile
}OutputWeightUnitCase;

@interface OutputWeightUnit : NSObject

// MARK: - Properties

{
    OutputWeightUnitCase _unit;
}

// MARK: - Class Functions

+ (OutputWeightUnit*)cm;
+ (OutputWeightUnit*)meter;
+ (OutputWeightUnit*)feet;
+ (OutputWeightUnit*)mile;

// MARK: - Methods

- (id)initWith: (OutputWeightUnitCase)unit; 

- (NSString*)getUnitName;

- (double)convertFrom: (double)cm;

@end

#endif /* OutputWeightUnit_h */
