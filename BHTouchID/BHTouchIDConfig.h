//
//  BHTouchIDConfig.h
//  BHDemo
//
//  Created by QBH on 2018/12/23.
//  Copyright © 2018 QiaoBaHui. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BHTouchIDConfig : NSObject

/**
 副标题
 */
@property (nonatomic, copy) NSString *tipTitle;

/**
 取消按钮标题
 */
@property (nonatomic, copy) NSString *cancelTitle;

/**
 指纹验证错误时, 显示的输入密码按钮标题
 */
@property (nonatomic, copy) NSString *inputPasswordTitle;

/**
 指纹验证达到最大数量时, 是否显示系统密码
 */
@property (nonatomic, assign) BOOL maxToShowBiometrics;

+ (instancetype)createDefaultConfig;

@end

NS_ASSUME_NONNULL_END
