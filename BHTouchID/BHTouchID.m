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

+ (void)touchIDWithConfig:(BHTouchIDConfig *)touchIDConfig completion:(void (^)(BHTouchResultModel *touchResultModel))completion {
	if (!touchIDConfig) {
		touchIDConfig = [BHTouchID checkTouchIDConfig:touchIDConfig];
	}
	
	LAContext *context = [LAContext new];
	
	NSInteger policy;
	if (touchIDConfig.maxToShowBiometrics) {
		policy = LAPolicyDeviceOwnerAuthenticationWithBiometrics;
	} else {
		policy = LAPolicyDeviceOwnerAuthentication;
	}
	
	[context evaluatePolicy:policy localizedReason:touchIDConfig.tipTitle reply:^(BOOL success, NSError * _Nullable error) {
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
					case LAErrorPasscodeNotSet:
						completion([BHTouchResultModel touchResultModelWithResultType:BHTouchResultTypePasswordNotSet]);
						break;
					case LAErrorTouchIDNotEnrolled:
						completion([BHTouchResultModel touchResultModelWithResultType:BHTouchResultTypeTouchIDNotSet]);
						break;
					case LAErrorTouchIDNotAvailable:
						completion([BHTouchResultModel touchResultModelWithResultType:BHTouchResultTypeTouchIDNotAvailable]);
						break;
					case LAErrorTouchIDLockout:
						completion([BHTouchResultModel touchResultModelWithResultType:BHTouchResultTypeTouchIDLockout]);
						break;
					case LAErrorAppCancel:
						completion([BHTouchResultModel touchResultModelWithResultType:BHTouchResultTypeAppCancel]);
						break;
					case LAErrorInvalidContext:
						completion([BHTouchResultModel touchResultModelWithResultType:BHTouchResultTypeInvalidContext]);
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
