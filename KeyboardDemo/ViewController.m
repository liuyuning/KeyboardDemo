//
//  ViewController.m
//  KeyboardDemo
//
//  Created by liuyuning on 15/10/20.
//  Copyright © 2015年 liuyuning. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionHide:(id)sender{
    
    NSLog(@"%@",[NSBundle mainBundle].infoDictionary);
    
    
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}

@end
