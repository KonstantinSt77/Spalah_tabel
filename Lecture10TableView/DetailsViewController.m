//
//  DetailsViewController.m
//  Lecture10TableView
//
//  Created by Yevhen Herasymenko on 24/11/2015.
//  Copyright © 2015 YevhenHerasymenko. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLabel.text = self.titleString;
}

@end
