//
//  ViewController.m
//  Objc Unit Conversion App
//
//  Created by Ari He on 7/29/21.
//

#import "ViewController.h"
#import "OutputWeightUnit.h"
#import "DestinationUnitSelectorViewController.h"

@interface ViewController ()

@end

@implementation ViewController

// MARK: - Properties

UITextField *_textField;
UILabel *_inchUnitLabel;
DestinationUnitSelectorViewController *_unitSelector;
UIButton *_updateButton;
UILabel *_outputValueLabel;

CGFloat _standardVerticalSpacing = 30;

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
    [self setUpInchUnitLabel];
    [self setUpUnitSelector];
    [self setUpUpdateButton];
    [self setupOutputValueLabel];
}

- (void)setUpTextField {
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 200, 300, 40)];
    _textField.tintColor = [UIColor darkGrayColor];
    _textField.layer.borderColor = [[UIColor darkGrayColor] CGColor];
    _textField.layer.borderWidth = 1.0;
    _textField.layer.cornerRadius = 5.0;
    _textField.placeholder = @" Enter measurement in inches";
    
    [self.view addSubview: _textField];
}

- (void)setUpInchUnitLabel {
    _inchUnitLabel = [[UILabel alloc] init];
    
    _inchUnitLabel.text = @"in inches";
    _inchUnitLabel.numberOfLines = 1;
    _inchUnitLabel.textColor = [UIColor blackColor];
    
    [self.view addSubview:_inchUnitLabel];
}

- (void)setUpUnitSelector {
    _unitSelector = [[DestinationUnitSelectorViewController alloc] init];
    
    [self.view addSubview:_unitSelector.view];
}

- (void)setUpUpdateButton {
    _updateButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_updateButton setTitle:@"update" forState:UIControlStateNormal];
    
    [_updateButton addTarget:self action:@selector(updateConvertedValue) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_updateButton];
}

- (void)setupOutputValueLabel {
    _outputValueLabel = [[UILabel alloc] init];
    _outputValueLabel.text = @"Click update to get a value";
    _outputValueLabel.numberOfLines = 0;
    _outputValueLabel.textColor = UIColor.blackColor;
    
    [self.view addSubview:_outputValueLabel];
}

// MARK: - Constraints

- (void)setUpConstraints {
    [self setUpTextFieldConstraints];
    [self setUpInchUnitLabelConstraints];
    [self setUpUnitSelectorConstraints];
    [self setUpUpdateButtonConstraints];
    [self setUpOutputValueLabelConstraints];
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

- (void)setUpInchUnitLabelConstraints {
    _inchUnitLabel.translatesAutoresizingMaskIntoConstraints = FALSE;
    
    // CenterX
    NSLayoutConstraint *centerX = [NSLayoutConstraint constraintWithItem:_inchUnitLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    
    // Top
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:_inchUnitLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_textField attribute:NSLayoutAttributeBottom multiplier:1.0 constant:_standardVerticalSpacing];
    
    NSArray *constraints = [NSArray arrayWithObjects:centerX, top, nil];

    [self.view addConstraints:constraints];
}

- (void)setUpUnitSelectorConstraints {
    UIView *selector = _unitSelector.view;
    
    selector.translatesAutoresizingMaskIntoConstraints = false;
    
    // Center X
    NSLayoutConstraint *centerX = [NSLayoutConstraint constraintWithItem:selector attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    
    // Top
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:selector attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_inchUnitLabel attribute:NSLayoutAttributeBottom multiplier:1.0 constant:_standardVerticalSpacing];
    
    NSArray *constraints = [NSArray arrayWithObjects:centerX, top, nil];
    
    [self.view addConstraints:constraints];
}

- (void)setUpUpdateButtonConstraints {
    _updateButton.translatesAutoresizingMaskIntoConstraints = false;
    
    // Center X
    NSLayoutConstraint *centerX = [NSLayoutConstraint constraintWithItem:_updateButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    
    // Top
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:_updateButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_unitSelector.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:_standardVerticalSpacing];
    
    NSArray *constraints = [NSArray arrayWithObjects:centerX, top, nil];
    
    [self.view addConstraints:constraints];
}

- (void)setUpOutputValueLabelConstraints {
    _outputValueLabel.translatesAutoresizingMaskIntoConstraints = FALSE;
    
    // Center X
    NSLayoutConstraint *centerX = [NSLayoutConstraint constraintWithItem:_outputValueLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    
    // Top
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:_outputValueLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_updateButton attribute:NSLayoutAttributeBottom multiplier:1.0 constant:_standardVerticalSpacing];
    
    NSArray *constraints = [NSArray arrayWithObjects:centerX, top, nil];
    
    [self.view addConstraints: constraints];
}

// MARK: - Input Value Processing and Conversion

- (void)updateConvertedValue {
    double currentValue = [self getTextFieldCurrentDoubleValue];
    
    OutputWeightUnit* unit = [_unitSelector getSelectedDestinationUnit];
    
    double convertedValue = [unit convertFrom:currentValue];
    
    NSString *convertedValueString = [NSString stringWithFormat:@"%.02f", convertedValue];
    
    NSString *valueWithUnit = [NSString stringWithFormat:@"%@%@%@%@", convertedValueString, @" ", [_unitSelector getCurrentlySelectedUnitString], @"(s)"];
    
    _outputValueLabel.text = valueWithUnit;
}

- (NSString*)getTextFieldCurrentValue {
    return _textField.text;
}

- (double)getTextFieldCurrentDoubleValue {
    return [[self getTextFieldCurrentValue] doubleValue];
}

@end
