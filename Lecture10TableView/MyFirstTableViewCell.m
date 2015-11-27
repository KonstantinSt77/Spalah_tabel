//
//  MyFirstTableViewCell.m
//  Lecture10TableView
//
//  Created by Yevhen Herasymenko on 24/11/2015.
//  Copyright © 2015 YevhenHerasymenko. All rights reserved.
//

#import "MyFirstTableViewCell.h"

@implementation MyFirstTableViewCell

- (void)awakeFromNib {
    self.avatarView.layer.masksToBounds = YES;
    self.avatarView.layer.cornerRadius = CGRectGetHeight(self.avatarView.frame)/2;
}

- (void)prepareForReuse {
    self.magicLabel.text = @"";
}

@end
