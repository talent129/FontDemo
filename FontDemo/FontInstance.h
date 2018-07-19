//
//  FontInstance.h
//  FontDemo
//
//  Created by luckyCoderCai on 2018/7/18.
//  Copyright © 2018年 Cai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Define.h"

//单例
@interface FontInstance : NSObject

AS_SINGLETON(FontInstance)

//是否改变了字体大小 YES: 改变 NO: 未改变或已恢复
@property (nonatomic, assign) BOOL fontValueBOOL;

@end
