//
//  BHTouchIDConfig.m
//  BHDemo
//
//  Created by QBH on 2018/12/23.
//  Copyright © 2018 QiaoBaHui. All rights reserved.
//

#import "BHTouchIDConfig.h"

@implementation BHTouchIDConfig

+ (instancetype)createDefaultConfig {
	BHTouchIDConfig *touchIDConfig = [BHTouchIDConfig new];
	touchIDConfig.tipTitle = @"通过Home键验证已有手机指纹";
	touchIDConfig.cancelTitle = @"取消";
	touchIDConfig.inputPasswordTitle = @"输入密码";
	touchIDConfig.maxToShowBiometrics = NO;
	
	return touchIDConfig;
}

@end
