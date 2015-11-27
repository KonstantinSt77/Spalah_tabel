//
//  MyFirstTableViewCell.h
//  Lecture10TableView
//
//  Created by Yevhen Herasymenko on 24/11/2015.
//  Copyright © 2015 YevhenHerasymenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyFirstTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *avatarView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *magicLabel;

@end
