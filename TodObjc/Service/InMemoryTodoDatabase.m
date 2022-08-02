//
//  InMemoryTodoDatabase.m
//  TodObjc
//
//  Created by 최형우 on 2022/08/02.
//

#import "InMemoryTodoDatabase.h"

@implementation InMemoryTodoDatabase

- (instancetype)init {
    self = [super init];
    if (self != nil) {
        _items = [NSMutableArray arrayWithArray:@[]];
    }
    return self;
}

- (void)saveTodo:(nonnull Todo *)todo {
    [_items addObject:todo];
}

- (nonnull NSArray *)readAll {
    return _items;
}

- (void)updateAt:(nonnull NSInteger *)at :(nonnull Todo *)todo {
    [_items replaceObjectAtIndex:(NSUInteger)at withObject:todo];
}

- (void)deleteAt:(nonnull NSInteger *)at {
    [_items removeObjectAtIndex:(NSUInteger)at];
}

- (void)deleteTodo:(nonnull Todo *)todo {
    [_items removeObject:todo];
}

@end
