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

CGSize s;
static NSArray* labels;

+ (void)initialize {
          labels = [NSArray arrayWithObjects: @"1.", @"2.", @"Read something about this app. Read something about this app. Read something about this app. Read something about this app. Read something about this app. Read something about this app. Read something about this app. Read something about this app.",nil];
}

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
    return labels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *t = [UITableViewCell new];
    t.textLabel.text = @"Demo";
    return t;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel *footer;
    UIView *footerView;
    NSString* text = labels[section];

    CGRect labelRect = [text
                        boundingRectWithSize:CGSizeMake(tableView.frame.size.width-20, 500)
                        options:NSStringDrawingUsesLineFragmentOrigin
                        attributes:@{
                                     NSFontAttributeName : [UIFont systemFontOfSize:14]
                                     }
                        context:nil];
    
    footerView = [[UIView alloc] init];
    footer = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, labelRect.size.width, labelRect.size.height)];
    [footer setNumberOfLines:0];
    [footer setLineBreakMode:NSLineBreakByWordWrapping];
    [footer setText:NSLocalizedString(text,nil)];
    
    [footerView addSubview:footer];
    s = [footer sizeThatFits: CGSizeMake(tableView.frame.size.width-20, 90)];
    footer.font = [UIFont systemFontOfSize:14];
    return footerView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    NSString* text = labels[section];

    CGRect labelRect = [text
                        boundingRectWithSize:CGSizeMake(tableView.frame.size.width-20, 500)
                        options:NSStringDrawingUsesLineFragmentOrigin
                        attributes:@{
                                     NSFontAttributeName : [UIFont systemFontOfSize:14]
                                     }
                        context:nil];
    return labelRect.size.height;
}


@end
