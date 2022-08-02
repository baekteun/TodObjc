//
//  NSObject+Todo.m
//  TodObjc
//
//  Created by 최형우 on 2022/08/02.
//

#import "Todo.h"

@implementation Todo

- (instancetype)init:(NSString*)title {
    self = [super init];
    if (self != nil) {
        _title = title;
        _isCompleted = false;
    }
    return self;
}

@end
