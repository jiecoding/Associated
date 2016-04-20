//
//  ViewController.m
//  TestAssociated(runtime关联)
//
//  Created by keep on 16/4/20.
//  Copyright © 2016年 keep. All rights reserved.
//http://blog.csdn.net/onlyou930/article/details/9299169 例子出处

#import "ViewController.h"
#import <objc/runtime.h>
@interface ViewController ()

@end
static char assKey;
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib. 测试下runtime的关联
    
    NSArray *arr = [NSArray array];
    
    NSString *associatedStr = @"syj";
    
    objc_setAssociatedObject(arr, &assKey, associatedStr, OBJC_ASSOCIATION_RETAIN);
    
    NSString *assocStr = objc_getAssociatedObject(arr, &assKey);
    
    NSLog(@"assocStr :%@",assocStr);
    
    //断开关联
    objc_setAssociatedObject(arr, &assKey, nil, OBJC_ASSOCIATION_ASSIGN);
    
     NSString *assocStr2 = objc_getAssociatedObject(arr, &assKey);
    
    NSLog(@"断开关联后 assocStr2 :%@",assocStr2);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
