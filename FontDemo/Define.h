//
//  Define.h
//  FontDemo
//
//  Created by luckyCoderCai on 2018/7/18.
//  Copyright © 2018年 Cai. All rights reserved.
//

#ifndef Define_h
#define Define_h

#import <UIKit/UIKit.h>

#define Font(X) [UIFont systemFontOfSize:X]
#define kScreenWidth [UIScreen mainScreen].bounds.size.width

//常用值
static CGFloat const fontSize_12 = 12;
static CGFloat const fontSize_16 = 16;
static CGFloat const fontSize_20 = 20;

//宏定义
//变化值key
#define kFontSizeValue @"FontSizeValue"

// 单例
#undef    AS_SINGLETON
#define AS_SINGLETON( __class ) \
+ (__class *)sharedInstance;

#undef    DEF_SINGLETON
#define DEF_SINGLETON( __class ) \
+ (__class *)sharedInstance \
{ \
static dispatch_once_t once; \
static __class * __singleton__ = nil; \
dispatch_once( &once, ^{ __singleton__ = [[__class alloc] init]; } ); \
return __singleton__; \
}

#endif /* Define_h */
