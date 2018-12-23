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
 验证方式
 * YES: 只有指纹的验证方式; NO: 指纹或者密码锁
 */
@property (nonatomic, assign) BOOL biometricsOnly;


+ (instancetype)createDefaultConfig;

@end

NS_ASSUME_NONNULL_END
