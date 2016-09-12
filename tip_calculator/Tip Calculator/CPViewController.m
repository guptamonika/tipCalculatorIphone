//
//  CPViewController.m
//  Tip Calculator
//
//  Created by Monika Gupta on 9/11/16.
//  Copyright (c) 2016 codepath. All rights reserved.
//

#import "CPViewController.h"

@interface CPViewController ()
@property (weak, nonatomic) IBOutlet UILabel *tipAmount;
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *totalAmount;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercentatge;

@end

@implementation CPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.title = @"Tip Calculator";
    [self updateValues];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTipPercChange:(UISegmentedControl *)sender {
    [self updateValues];
}

- (IBAction)tapGesture:(UITapGestureRecognizer *)sender {
    [self.view endEditing: YES];
    [self updateValues];
}

- (void)updateValues {
    float billAmount = [self.billTextField.text floatValue];
    NSArray *tipValues = @[@(0.15), @(0.2), @(0.25)];
    float tipAmount = [tipValues[self.tipPercentatge.selectedSegmentIndex] floatValue] * billAmount;
    float totalAmount = billAmount + tipAmount;

    self.tipAmount.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalAmount.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"view will appear");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int defaultTipIndex = [defaults integerForKey:@"defaultTipIndex"];
    self.tipPercentatge.selectedSegmentIndex = defaultTipIndex;
    [self updateValues];
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"view did appear");
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"view will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"view did disappear");
}

@end
