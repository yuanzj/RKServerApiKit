//
//  RKViewController.m
//  RKServerApiKit
//
//  Created by yuanzhijian on 08/26/2016.
//  Copyright (c) 2016 yuanzhijian. All rights reserved.
//

#import "RKViewController.h"
#import <RKServerApiKit/UserService.h>

@interface RKViewController ()

@end

@implementation RKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //    [UserService getVeriCodeWithMobile:@"18626313098" type:@"FA" block:^(BaseResponse *_baseResp, NSError *error){
    //        NSLog(@"getVeriCodeWithMobile:%@ error:%@",_baseResp.description,error.localizedDescription);
    //    }];
    
    //    [UserService setPasswordWithMobile:@"18626313098" password:@"Yz753898" locPassword:nil veriCode:@"150061" block:^(BaseResponse *_baseResp, NSError *error){
    //        NSLog(@"setPasswordWithMobile:state:%d message:%@ data:%@ error:%@",_baseResp.state,_baseResp.message,_baseResp.description,error.localizedDescription);
    //    }];
    
    
    //    [UserService registerWithMobile:@"18626313098" password:@"qqqqqq" locPassword:nil veriCode:@"608747" block:^(BaseResponse *_baseResp, NSError *error){
    //        NSLog(@"registerWithMobile:state:%d message:%@ data:%@ error:%@",_baseResp.state,_baseResp.message,_baseResp.description,error.localizedDescription);
    //    }];
    
    [UserService loginWithMobile:@"18626313098" password:@"qqqqqq" block:^(UserResponse *_mUser, NSError *error){
        NSLog(@"loginWithMobile:state:%d message:%@ data:%@ error:%@",_mUser.state,_mUser.message,_mUser.description,error.localizedDescription);
    }];
    
//    [UserService changePwdWithOldPwd:@"Yz753898" newPwd:@"qqqqqq" type:nil block:^(BaseResponse *_baseResp, NSError *error){
//        NSLog(@"changePwdWithOldPwd:state:%d message:%@ data:%@ error:%@",_baseResp.state,_baseResp.message,_baseResp.description,error.localizedDescription);
//    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
