//
//  ViewController.m
//  Lecture10TableView
//
//  Created by Yevhen Herasymenko on 07/11/2015.
//  Copyright © 2015 YevhenHerasymenko. All rights reserved.
//

#import "ViewController.h"
#import "MyFirstTableViewCell.h"
#import "DetailsViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *objects;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *names = @[@"Vasia", @"Petia", @"Kolia", @"Anna", @"Nina", @"Olga", @"Nico"];
    NSArray *places = @[@"cinema", @"park"];
    
    NSDictionary *placesDictionary = @{
                                     @"objects" : places,
                                     @"name" : @"Places"
                                     };
    NSDictionary *namesDictionary = @{
                                       @"objects" : names,
                                       @"name" : @"Names"
                                       };
    
    self.objects = @[placesDictionary, namesDictionary];
    
    
    [self.tableView reloadData];
}

#pragma mark - TableView
#pragma mark DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.objects.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *array = [self.objects[section] valueForKey:@"objects"];
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyFirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    NSArray *array = [self.objects[indexPath.section] valueForKey:@"objects"];
    cell.titleLabel.text = array[indexPath.row];
    if (indexPath.section == 0 && indexPath.row == 1) {
        cell.magicLabel.text = @"BOOM";
    }
    
    
  /*  UITableViewCell *someCell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
   // someCell.textLabel.text = ...
   // someCell.detailTextLabel.text = ...
   // someCell.imageView.image = [UIImage imageNamed:@""];*/
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self.objects[section] valueForKey:@"name"];
}

#pragma mark Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
CGFloat height = 0;
    switch (indexPath.section) {
        case 0:
            height = [self tableView:tableView heightForRowsAtPlacesIndex:indexPath.row];
            break;
        default:
            height = 100;
            break;
    }
    return height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowsAtPlacesIndex:(NSInteger)index {
    CGFloat height = 0;
    switch (index) {
        case 0:
            height = 50;
            break;
            
        default:
            height = 300;
            break;
    }
    return height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    /*
    NSDictionary *objDictionary = self.objects[indexPath.section];
    NSArray *arr = objDictionary[@"objects"];
    */
    NSArray *array = [self.objects[indexPath.section] valueForKey:@"objects"];
    NSString *title = array[indexPath.row];
    
    [self performSegueWithIdentifier:@"detailsSegue" sender:title];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"detailsSegue"]) {
        DetailsViewController *detailsVC = (DetailsViewController *)segue.destinationViewController;
        detailsVC.titleString = sender;
    }
}

@end
