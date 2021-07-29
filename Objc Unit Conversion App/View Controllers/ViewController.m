//
//  ViewController.m
//  Objc Unit Conversion App
//
//  Created by Ari He on 7/29/21.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

// MARK: - Properties

UITextField *_textField;

// MARK: - Lifecycles

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpSubviews];
    [self setUpConstraints];
}


// MARK: - UI Setups

- (void)setUpSubviews {
    [self setUpTextField];
}

- (void)setUpTextField {
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 200, 300, 40)];
    _textField.tintColor = [UIColor darkGrayColor];
    _textField.layer.borderColor = [[UIColor darkGrayColor] CGColor];
    _textField.layer.borderWidth = 1.0;
    _textField.layer.cornerRadius = 5.0;
    _textField.placeholder = @"Enter measurement in inches";
    
    [self.view addSubview: _textField];
}

// MARK: - Constraints

- (void)setUpConstraints {
    [self setUpTextFieldConstraints];
}

- (void)setUpTextFieldConstraints {
    _textField.translatesAutoresizingMaskIntoConstraints = FALSE;
    
    // Width
    [_textField.heightAnchor constraintEqualToConstant: 60].active = YES;
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat multiplier = 0.15;
    CGFloat horizontalPadding = screenWidth * multiplier;
    
    //Trailing
    NSLayoutConstraint *trailing = [NSLayoutConstraint
                                    constraintWithItem: _textField
                                    attribute:NSLayoutAttributeTrailing
                                    relatedBy:NSLayoutRelationEqual
                                    toItem: self.view
                                    attribute:NSLayoutAttributeTrailing
                                    multiplier: 1.0
                                    constant: -horizontalPadding];
    
    // Leading
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:_textField attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant: horizontalPadding];
    
    // Top
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:_textField attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:100];
    
    // Add constraints to parent view
    NSArray *constraints = [NSArray arrayWithObjects:trailing, leading, top, nil];
    
    [self.view addConstraints: constraints];
}

// MARK: - Input Value Processing and Conversion

- (NSString*)getTextFieldCurrentValue {
    return _textField.text;
}

- (double)getTextFieldCurrentDoubleValue {
    return [[self getTextFieldCurrentValue] doubleValue];
}

- (double)convertToCmFrom: (double)inches {
    double conversionRate = 2.54;
    
    return inches * conversionRate;
}

//- (NSString*)getConvertedValueInCm {
//    double inchesDouble = [self getTextFieldCurrentDoubleValue];
//    double cmDouble = [self convertToCmFrom:inchesDouble];
//    
//    return [[NSString alloc] initWithFormat:@".2f", cmDouble];
//}

@end
