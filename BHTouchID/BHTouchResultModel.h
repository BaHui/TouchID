//
//  BHTouchResultModel.h
//  BHDemo
//
//  Created by QBH on 2018/12/23.
//  Copyright © 2018 QiaoBaHui. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, BHTouchResultType) {
	BHTouchResultTypeSucceed, 			 // 验证成功
	BHTouchResultTypeFailed,  			 // 验证失败
	BHTouchResultTypeUserCancel,  	 // 用户取消
	BHTouchResultTypeInputPassword,  // 不使用TouchID, 选择输入密码
	BHTouchResultTypeSystemCancel,   // 系统取消(如: 锁屏)
	BHTouchResultTypeTouchIDLockout, // TouchID 被锁定(连续多次验证TouchID失败, 需要用户手动输入密码)
	BHTouchResultTypeAppCancel,		   // App被挂起并取消了授权 (如: 进入后台)
	BHTouchResultTypeInvalidContext, // 当前软件被挂起并取消了授权 (LAContext对象无效)
	
	BHTouchResultTypePasswordNotSet, // 设备未设置密码
	BHTouchResultTypeTouchIDNotSet,  // 设备未设置TouchID
	BHTouchResultTypeTouchIDNotAvailable, // TouchID无效
	
	BHTouchResultTypeErrorUnknow     // 未知错误
};

@interface BHTouchResultModel : NSObject

@property (nonatomic, assign) BHTouchResultType touchResultType;
@property (nonatomic, copy) NSString *resultMessage;

+ (instancetype)touchResultModelWithResultType:(BHTouchResultType)resultType;

@end

NS_ASSUME_NONNULL_END
