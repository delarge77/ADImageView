//
//  ViewController.m
//  ADImageView
//
//  Created by Alessandro dos santos pinto on 4/12/15.
//  Copyright (c) 2015 Alessandro dos santos pinto. All rights reserved.
//

#import "ViewController.h"
#import "ADCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *cellIdentifier = @"cellIdentifier";
    
    ADCell *cell = (ADCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ADCell" owner:self options:nil]objectAtIndex:0];
    }
    
    cell.cellImg.url = @"http://agenciapxp.com/site/wp-content/uploads/2015/01/Apple-Think_Different-Apple-Logo.jpg";
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 140;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
