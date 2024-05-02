//
//  WrapperViewManager.m
//  AwesomeProject
//
//  Created by Levi Bostian on 4/30/24.
//

#import <Foundation/Foundation.h>
#import <React/RCTViewManager.h>
#import "AwesomeProject-Swift.h"

@interface CoolViewManager : RCTViewManager
@end

@implementation CoolViewManager

RCT_EXPORT_MODULE(CoolView)

RCT_EXPORT_VIEW_PROPERTY(value, NSNumber)
RCT_EXPORT_VIEW_PROPERTY(leftButtonText, NSString)
RCT_EXPORT_VIEW_PROPERTY(rightButtonText, NSString)
RCT_EXPORT_VIEW_PROPERTY(onPressLeftButton, RCTDirectEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onPressRightButton, RCTDirectEventBlock)

- (UIView *)view
{
  return [[CoolView alloc] init];
}

@end
