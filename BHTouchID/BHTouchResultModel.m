//
//  BHTouchResultModel.m
//  BHDemo
//
//  Created by QBH on 2018/12/23.
//  Copyright © 2018 QiaoBaHui. All rights reserved.
//

#import "BHTouchResultModel.h"

@implementation BHTouchResultModel

+ (instancetype)touchResultModelWithResultType:(BHTouchResultType)resultType {
	BHTouchResultModel *touchResultModel = [BHTouchResultModel new];
	touchResultModel.touchResultType = resultType;
	touchResultModel.resultMessage = [BHTouchResultModel resultMessageForTouchResultType:resultType];
	
	return touchResultModel;
}

#pragma mark - Private Methods

+ (NSString *)resultMessageForTouchResultType:(BHTouchResultType)resultType {
	NSString *message = @"";
	
	switch (resultType) {
		case BHTouchResultTypeSucceed:
			message = @"验证成功";
			break;
		case BHTouchResultTypeFailed:
			message = @"验证失败";
			break;
		case BHTouchResultTypeUserCancel:
			message = @"用户取消";
			break;
		case BHTouchResultTypeInputPassword:
			message = @"不使用TouchID, 选择输入密码";
			break;
		case BHTouchResultTypeSystemCancel:
			message = @"系统取消";
			break;
		case BHTouchResultTypePasswordNotSet:
			message = @"设备未设置密码";
			break;
		case BHTouchResultTypeTouchIDNotSet:
			message = @"设备未设置TouchID";
			break;
		case BHTouchResultTypeTouchIDNotAvailable:
			message = @"TouchID无效";
			break;
		case BHTouchResultTypeTouchIDLockout:
			message = @"TouchID 被锁定";
			break;
		case BHTouchResultTypeAppCancel:
			message = @"App被挂起并取消了授权";
			break;
		case BHTouchResultTypeInvalidContext:
			message = @"当前软件被挂起并取消了授权";
			break;
		case BHTouchResultTypeErrorUnknow:
			message = @"验证失败(未知错误)";
			break;
	}
	
	return message;
}

@end
