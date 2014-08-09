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
    return labels.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    int row = [indexPath row];
    int section = [indexPath section];
        
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
    footer = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, labelRect.size.width, labelRect.size.height)];
    [footer setNumberOfLines:0];
    [footer setLineBreakMode:NSLineBreakByWordWrapping];
    [footer setText:NSLocalizedString(text,nil)];
    
    [footerView addSubview:footer];
    footer.font = [UIFont systemFontOfSize:14];
    
    footer.textColor = [UIColor whiteColor];
    footer.backgroundColor = [UIColor greenColor];
    footerView.backgroundColor = [UIColor blackColor];
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
    return labelRect.size.height + 10;
}


@end
