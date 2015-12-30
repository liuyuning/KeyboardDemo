//
//  KeyboardViewController.m
//  MyKeyboard
//
//  Created by liuyuning on 15/10/20.
//  Copyright © 2015年 liuyuning. All rights reserved.
//

#import "KeyboardViewController.h"
#import <objc/runtime.h>


@interface KeyboardViewController (){
    
    CGFloat _expandedHeight;
    NSLayoutConstraint *_heightConstraint;
    
}
@property (nonatomic, strong) UIButton *nextKeyboardButton;

@end

@implementation KeyboardViewController

- (void)updateViewConstraints {
    [super updateViewConstraints];
    
    // Add custom view sizing constraints here
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Perform custom UI setup here
    self.nextKeyboardButton = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [self.nextKeyboardButton setTitle:NSLocalizedString(@"Next Keyboard", @"Title for 'Next Keyboard' button") forState:UIControlStateNormal];
    [self.nextKeyboardButton sizeToFit];
    self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.nextKeyboardButton addTarget:self action:@selector(advanceToNextInputMode) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.nextKeyboardButton];
    
    NSLayoutConstraint *nextKeyboardButtonLeftSideConstraint = [NSLayoutConstraint constraintWithItem:self.nextKeyboardButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0];
    NSLayoutConstraint *nextKeyboardButtonBottomConstraint = [NSLayoutConstraint constraintWithItem:self.nextKeyboardButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
    [self.view addConstraints:@[nextKeyboardButtonLeftSideConstraint, nextKeyboardButtonBottomConstraint]];
    
    
    UIButton *buttonInsert = [UIButton buttonWithType:UIButtonTypeSystem];
    buttonInsert.backgroundColor = [UIColor lightGrayColor];
    buttonInsert.frame = CGRectMake(10, 20, 60, 30);
    [buttonInsert setTitle:@"Insert" forState:UIControlStateNormal];
    [buttonInsert addTarget:self action:@selector(actionInsert:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonInsert];
    
    
    UIButton *buttonDelete = [UIButton buttonWithType:UIButtonTypeSystem];
    buttonDelete.backgroundColor = [UIColor lightGrayColor];
    buttonDelete.frame = CGRectMake(75, 20, 60, 30);
    [buttonDelete setTitle:@"Delete" forState:UIControlStateNormal];
    [buttonDelete addTarget:self action:@selector(actionDelete:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonDelete];
    
    
    UIButton *buttonDismiss = [UIButton buttonWithType:UIButtonTypeSystem];
    buttonDismiss.backgroundColor = [UIColor lightGrayColor];
    buttonDismiss.frame = CGRectMake(140, 20, 60, 30);
    [buttonDismiss setTitle:@"Dismiss" forState:UIControlStateNormal];
    [buttonDismiss addTarget:self action:@selector(actionDismiss:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonDismiss];
    
    UIButton *buttonHeight = [UIButton buttonWithType:UIButtonTypeSystem];
    buttonHeight.backgroundColor = [UIColor lightGrayColor];
    buttonHeight.frame = CGRectMake(205, 20, 60, 30);
    [buttonHeight setTitle:@"Height" forState:UIControlStateNormal];
    [buttonHeight addTarget:self action:@selector(actionHeight:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonHeight];
    
    
    
    UIButton *buttonTest = [UIButton buttonWithType:UIButtonTypeSystem];
    buttonTest.backgroundColor = [UIColor lightGrayColor];
    buttonTest.frame = CGRectMake(10, 60, 60, 30);
    [buttonTest setTitle:@"Test" forState:UIControlStateNormal];
    [buttonTest addTarget:self action:@selector(actionTest:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonTest];
    
    
    _expandedHeight = 300;
    _heightConstraint =[NSLayoutConstraint constraintWithItem: self.view
                                                    attribute: NSLayoutAttributeHeight
                                                    relatedBy: NSLayoutRelationEqual
                                                       toItem: nil
                                                    attribute: NSLayoutAttributeNotAnAttribute
                                                   multiplier: 0.0
                                                     constant: _expandedHeight];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.view removeConstraint:_heightConstraint];
    [self.view addConstraint:_heightConstraint];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated
}

- (void)textWillChange:(id<UITextInput>)textInput {
    // The app is about to change the document's contents. Perform any preparation here.
}

- (void)textDidChange:(id<UITextInput>)textInput {
    // The app has just changed the document's contents, the document context has been updated.
    
    UIColor *textColor = nil;
    if (self.textDocumentProxy.keyboardAppearance == UIKeyboardAppearanceDark) {
        textColor = [UIColor whiteColor];
    } else {
        textColor = [UIColor blackColor];
    }
    [self.nextKeyboardButton setTitleColor:textColor forState:UIControlStateNormal];
}

- (void)actionInsert:(UIButton *)sender{
    [self.textDocumentProxy insertText:@"a"];
}

- (void)actionDelete:(UIButton *)sender{
    [self.textDocumentProxy deleteBackward];
}

- (void)actionDismiss:(UIButton *)sender{
    [self dismissKeyboard];
}

- (void)actionHeight:(UIButton *)sender{
    
    _expandedHeight += 5;
    _heightConstraint.constant = _expandedHeight;
}

- (void)actionTest:(UIButton *)sender{
    
    //Get host app BundleID, Private func.  _UIViewServiceViewControllerOperator.h
    NSLog(@"%@",self.view.window.rootViewController);//<_UIViewServiceViewControllerOperator: 0x15c810e00>
    
    Ivar ponyIvar = class_getInstanceVariable ([self.view.window.rootViewController class], "_hostBundleID");
    NSString *_hostBundleID = object_getIvar (self.view.window.rootViewController, ponyIvar);
    NSLog(@"%@",_hostBundleID);//com.apple.Maps
    
}

@end
