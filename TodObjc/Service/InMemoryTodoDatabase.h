//
//  InMemoryTodoDatabase.h
//  TodObjc
//
//  Created by 최형우 on 2022/08/02.
//

#import <Foundation/Foundation.h>
#import "TodoDatabase.h"

NS_ASSUME_NONNULL_BEGIN

@interface InMemoryTodoDatabase : NSObject <TodoDatabase>

@property (nonatomic) NSMutableArray<Todo *> *items;

- (instancetype) init;

@end

NS_ASSUME_NONNULL_END
