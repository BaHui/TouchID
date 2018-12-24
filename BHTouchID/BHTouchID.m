//
//  BHTouchID.m
//  BHDemo
//
//  Created by QBH on 2018/12/23.
//  Copyright © 2018 QiaoBaHui. All rights reserved.
//

#import "BHTouchID.h"

@implementation BHTouchID

+ (BOOL)isSupportTouchID {
	LAContext *context = [LAContext new];
	return [context canEvaluatePolicy:LAPolicyDeviceOwnerAuthentication error:nil];
}

+ (void)touchWithConfig:(BHTouchIDConfig *)config completion:(void (^)(BHTouchResultModel *touchResultModel))completion {
	if (!config) {
		config = [BHTouchID checkTouchIDConfig:config];
	}
	
	LAContext *context = [LAContext new];

	/**
	 * LAPolicyDeviceOwnerAuthentication 可输入手机密码的验证方式
	 * LAPolicyDeviceOwnerAuthenticationWithBiometrics 只有指纹的验证方式
	 */
	NSInteger policy;
	if (config.biometricsOnly) {
		policy = LAPolicyDeviceOwnerAuthenticationWithBiometrics;
	} else {
		policy = LAPolicyDeviceOwnerAuthentication;
	}
	
	[context evaluatePolicy:policy localizedReason:config.reasonTitle reply:^(BOOL success, NSError * _Nullable error) {
		dispatch_async(dispatch_get_main_queue(), ^{
			if (success) {
				completion([BHTouchResultModel touchResultModelWithResultType:BHTouchResultTypeSucceed]);
			} else {
				switch (error.code) {
					case LAErrorAuthenticationFailed:
						completion([BHTouchResultModel touchResultModelWithResultType:BHTouchResultTypeFailed]);
						break;
					case LAErrorUserCancel:
						completion([BHTouchResultModel touchResultModelWithResultType:BHTouchResultTypeUserCancel]);
						break;
					case LAErrorUserFallback:
						completion([BHTouchResultModel touchResultModelWithResultType:BHTouchResultTypeInputPassword]);
						break;
					case LAErrorSystemCancel:
						completion([BHTouchResultModel touchResultModelWithResultType:BHTouchResultTypeSystemCancel]);
						break;
					case LAErrorBiometryLockout:
						completion([BHTouchResultModel touchResultModelWithResultType:BHTouchResultTypeTouchIDLockout]);
						break;
					case LAErrorAppCancel:
						completion([BHTouchResultModel touchResultModelWithResultType:BHTouchResultTypeAppCancel]);
						break;
					case LAErrorInvalidContext:
						completion([BHTouchResultModel touchResultModelWithResultType:BHTouchResultTypeInvalidContext]);
						break;
						
					case LAErrorPasscodeNotSet:
						completion([BHTouchResultModel touchResultModelWithResultType:BHTouchResultTypePasswordNotSet]);
						break;
					case LAErrorTouchIDNotEnrolled:
						completion([BHTouchResultModel touchResultModelWithResultType:BHTouchResultTypeTouchIDNotSet]);
						break;
					case LAErrorTouchIDNotAvailable:
						completion([BHTouchResultModel touchResultModelWithResultType:BHTouchResultTypeTouchIDNotAvailable]);
						break;
						
					default:
						completion([BHTouchResultModel touchResultModelWithResultType:BHTouchResultTypeErrorUnknow]);
						break;
				}
			}
		});
	}];
}

#pragma mark - Private Methods

+ (BHTouchIDConfig *)checkTouchIDConfig:(BHTouchIDConfig *)touchConfig {
	BHTouchIDConfig *config = nil;
	
	if (!touchConfig) {
		config = [BHTouchIDConfig createDefaultConfig];
	} else {
		config = touchConfig;
	}
	
	return config;
};

@end
