//
//  ViewController.m
//  TableViewTest
//
//  Created by Christian Holzberger on 09.08.14.
//  Copyright (c) 2014 Christian Holzberger. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
UILabel *footer;
UIView *footerView;
CGSize s;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *t = [UITableViewCell new];
    t.textLabel.text = @"Demo";
    return t;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    footerView = [[UIView alloc] init];
    footer = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, tableView.frame.size.width-20, 120)];
    [footer setNumberOfLines:0];
    [footer setLineBreakMode:NSLineBreakByWordWrapping];
    [footer setText:NSLocalizedString(@"Read something about this app. Read something about this app. Read something about this app. Read something about this app. Read something about this app. Read something about this app. Read something about this app. Read something about this app.",nil)];
    
    [footerView addSubview:footer];
    s = [footer sizeThatFits: CGSizeMake(tableView.frame.size.width-20, 90)];
    return footerView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    NSString* text = @"Read something about this app. Read something about this app. Read something about this app. Read something about this app. Read something about this app. Read something about this app. Read something about this app. Read something about this app.";

    CGRect labelRect = [text
                        boundingRectWithSize:CGSizeMake(tableView.frame.size.width-20, 120)
                        options:NSStringDrawingUsesLineFragmentOrigin
                        attributes:@{
                                     NSFontAttributeName : [UIFont systemFontOfSize:14]
                                     }
                        context:nil];
    return labelRect.size.height;
}


@end
