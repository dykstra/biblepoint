//
//  MarriageViewController.m
//  BiblePoint
//
//  Created by Doug Dykstra on 6/21/14.
//  Copyright (c) 2014 dougdykstra. All rights reserved.
//

#import "MarriageViewController.h"

@interface MarriageViewController ()

@end

@implementation MarriageViewController
@synthesize marriageWebView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [marriageWebView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"marriage" ofType:@"html"] isDirectory:NO]]];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [self performSegueWithIdentifier:@"marriage" sender:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
