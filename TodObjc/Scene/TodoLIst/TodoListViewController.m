//
//  TodoListViewController.m
//  TodObjc
//
//  Created by 최형우 on 2022/08/02.
//

#import <UIKit/UIKit.h>
#import "TodoCell.h"
#import "Todo.h"
#import "InMemoryTodoDatabase.h"

@interface TodoListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *todoListTableView;
@property (nonatomic) InMemoryTodoDatabase *db;
@property (nonatomic) NSMutableArray<Todo*> *todoList;

- (void) todoListRefresh;

@end

@implementation TodoListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _db = [[InMemoryTodoDatabase alloc] init];
    _todoList = [NSMutableArray array];
    _todoListTableView.delegate = self;
    _todoListTableView.dataSource = self;
}
- (IBAction)addButtonDidTap:(UIBarButtonItem *)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"TODO" message:@"할 일을 입력해주세요" preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:nil];
    
    __weak typeof(self) weakSelf = self;
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"취소" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *addAction = [UIAlertAction actionWithTitle:@"추가" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [weakSelf.db saveTodo:[[Todo alloc] init:alert.textFields[0].text]];
        [weakSelf todoListRefresh];
    }];
    [alert addAction:cancelAction];
    [alert addAction:addAction];
    [self presentViewController:alert animated:true completion:nil];
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    TodoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TodoCell" forIndexPath:indexPath];
    Todo *todo = _todoList[indexPath.row];
    cell.isCompletedImageView.image = [UIImage systemImageNamed:todo.isCompleted ? @"checkmark.circle.fill" : @"checkmark.circle"];
    cell.todoLabel.text = todo.title;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _todoList.count;
}

- (UISwipeActionsConfiguration *)tableView:(UITableView *)tableView trailingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    __weak typeof(self) weakSelf = self;
    
    UIContextualAction *deleteAction = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleDestructive title:@"삭제" handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
        [weakSelf.db deleteAt:indexPath.row];
        [weakSelf todoListRefresh];
    }];
    deleteAction.backgroundColor = UIColor.redColor;
    
    return [UISwipeActionsConfiguration configurationWithActions:@[deleteAction]];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Todo *todo = _todoList[indexPath.row];
    todo.isCompleted = !todo.isCompleted;
    [_db updateAt:indexPath.row :todo];
    [self todoListRefresh];
}

- (void)todoListRefresh {
    _todoList = [NSMutableArray arrayWithArray:[_db readAll]];
    [_todoListTableView reloadData];
}

@end
