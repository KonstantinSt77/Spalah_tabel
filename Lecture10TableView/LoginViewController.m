//
//  LoginViewController.m
//  Lecture10TableView
//
//  Created by Stolyarenko on 27.11.15.
//  Copyright © 2015 YevhenHerasymenko. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController


-(IBAction)login:(id)sender
{
    NSString *userPassword = self.Login.text;
    
    NSString *useConstantLogin =[[NSUserDefaults standardUserDefaults] valueForKey:@"userPass"];
    if(useConstantLogin !=nil)
    {
        if ([userPassword isEqualToString:useConstantLogin])
        {
          
            [self performSegueWithIdentifier:@"login" sender:sender];
            NSLog(@"okay");
        }
        else
        {
            UIAlertController *alertController =
            [UIAlertController alertControllerWithTitle:@"Incorrect Login"
                                                message:@"Your password was entered incorrectly."
                                         preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Okay"
                                                                   style:UIAlertActionStyleCancel
                                                                 handler:^(UIAlertAction * _Nonnull action) {
                                                                     NSLog(@"User pressed Cancel");
                                                                 }];
            
            [alertController addAction:cancelAction];
            [self presentViewController:alertController animated:YES completion:^{
                NSLog(@"false");}];
        }
    }
    else{    [[NSUserDefaults standardUserDefaults] setValue:userPassword forKey:@"userPass"];
}

}




@end
