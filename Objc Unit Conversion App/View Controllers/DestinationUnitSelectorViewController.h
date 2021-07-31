//
//  DestinationUnitSelectorViewController.h
//  Objc Unit Conversion App
//
//  Created by Ari He on 7/30/21.
//

#ifndef DestinationUnitSelectorViewController_h
#define DestinationUnitSelectorViewController_h

#import <UIKit/UIKit.h>
#import "OutputWeightUnit.h"

@interface DestinationUnitSelectorViewController : UIViewController

- (NSInteger)getSelectedSegmentIndex;

- (OutputWeightUnit*)getSelectedDestinationUnit;

- (NSString*)getCurrentlySelectedUnitString;

@end


#endif /* DestinationUnitSelectorViewController_h */
