//
//  BHExampleViewController.m
//  BHDemo
//
//  Created by QiaoBaHui on 2018/9/18.
//  Copyright © 2018年 QiaoBaHui. All rights reserved.
//

#import "BHExampleViewController.h"
#import "BHTouchID.h"

@interface BHExampleViewController ()

@end

static NSString *const DEMO_VIEWS_STORYBOARD_NAME = @"DemoViews";


@implementation BHExampleViewController

+ (instancetype)create {
  UIStoryboard *demoViewsStoryboard = [UIStoryboard storyboardWithName:DEMO_VIEWS_STORYBOARD_NAME bundle:nil];
  return [demoViewsStoryboard instantiateViewControllerWithIdentifier:NSStringFromClass([BHExampleViewController class])];
}

#pragma mark - ViewController LifeCycle

- (void)viewDidLoad {
  [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
	BHTouchIDConfig *config = [BHTouchIDConfig createDefaultConfig];
	[BHTouchID touchIDWithConfig:config completion:^(BHTouchResultModel * _Nonnull touchResultModel) {
		NSLog(@"touchResultModel.type: %ld == message: %@", (long)touchResultModel.touchResultType, touchResultModel.resultMessage);
	}];
}

@end
