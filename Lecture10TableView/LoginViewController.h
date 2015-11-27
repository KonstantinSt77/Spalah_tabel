//
//  LoginViewController.h
//  Lecture10TableView
//
//  Created by Stolyarenko on 27.11.15.
//  Copyright © 2015 YevhenHerasymenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (strong,nonatomic) IBOutlet UITextField *Login;

-(IBAction)login:(id)sender;
@end
