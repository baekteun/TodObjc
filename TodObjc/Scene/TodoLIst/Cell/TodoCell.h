//
//  TodoCell.h
//  TodObjc
//
//  Created by 최형우 on 2022/08/02.
//

#import <UIKit/UIKit.h>

@interface TodoCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *isCompletedImageView;
@property (weak, nonatomic) IBOutlet UILabel *todoLabel;

@end
