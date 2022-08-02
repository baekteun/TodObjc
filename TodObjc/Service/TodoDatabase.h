//
//  TodoDatabase.h
//  TodObjc
//
//  Created by 최형우 on 2022/08/02.
//

#import <Foundation/Foundation.h>
#import "Todo.h"

NS_ASSUME_NONNULL_BEGIN

@protocol TodoDatabase <NSObject>

@required
- (void) saveTodo:(Todo*)todo;
- (NSArray*) readAll;
- (void) updateAt:(NSInteger*)at :(Todo*)todo;
- (void) deleteTodo:(Todo*)todo;
- (void) deleteAt:(NSInteger*)at;

@end

NS_ASSUME_NONNULL_END
