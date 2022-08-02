//
//  NSObject+Todo.h
//  TodObjc
//
//  Created by 최형우 on 2022/08/02.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Todo : NSObject

@property (strong, nonatomic) NSString *title;
@property (nonatomic) BOOL isCompleted;

- (instancetype) init:(NSString*)title;

@end

NS_ASSUME_NONNULL_END
