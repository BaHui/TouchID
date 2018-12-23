//
//  BHTouchID.h
//  BHDemo
//
//  Created by QBH on 2018/12/23.
//  Copyright © 2018 QiaoBaHui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <LocalAuthentication/LocalAuthentication.h>
#import "BHTouchIDConfig.h"
#import "BHTouchResultModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BHTouchID : NSObject

/**
 检测设备是否支持Touch ID
 @return YES: 支持; NO: 不支持
 */
+ (BOOL)isSupportTouchID;
+ (void)touchIDWithConfig:(BHTouchIDConfig *)touchIDConfig completion:(void (^)(BHTouchResultModel *touchResultModel))completion;

@end

NS_ASSUME_NONNULL_END
