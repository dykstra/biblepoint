//
//  PrayerRequestViewController.m
//  BiblePoint
//
//  Created by Doug Dykstra on 6/21/14.
//  Copyright (c) 2014 dougdykstra. All rights reserved.
//

#import "PrayerRequestViewController.h"
#import "AppDelegate.h"
#import "PrayerRequests.h"

@interface PrayerRequestViewController ()

@end

@implementation PrayerRequestViewController
@synthesize recipientTextField;
@synthesize requestTextField;
@synthesize requestDetails;
@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

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
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    _managedObjectContext = [appDelegate managedObjectContext];

//Adds placeholder text on UITextView
    requestDetails.text = @"Optional";
    requestDetails.textColor = [UIColor lightGrayColor];
    requestDetails.delegate = self;
}

- (BOOL) textViewShouldBeginEditing:(UITextView *)textView
{
    requestDetails.text = @"";
    requestDetails.textColor = [UIColor blackColor];
    return YES;
}

-(void) textViewDidChange:(UITextView *)textView
{
    
    if(requestDetails.text.length == 0){
        requestDetails.textColor = [UIColor lightGrayColor];
        requestDetails.text = @"Optional";
        [requestDetails resignFirstResponder];
    }
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

- (IBAction)addPrayerRequest:(id)sender {

    NSString *recipientCheck = [self.recipientTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    if([recipientCheck length]==0) {
        UIAlertView *alertRecipient = [[UIAlertView alloc] initWithTitle:@"'For' is required"
                                                        message:@"You must provide a name"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alertRecipient show];
    } else {

            [self savePrayerRequests];
  }
}

-(void)savePrayerRequests {

//PrayerRequest is the DB entity name
    PrayerRequests *prayerRequests = [NSEntityDescription insertNewObjectForEntityForName:@"PrayerRequests" inManagedObjectContext:_managedObjectContext];
    [prayerRequests setRecipient:recipientTextField.text];
    [prayerRequests setRequest:requestTextField.text];
    
    //If dealing with an integer
    //[prayerRequests setRequest:[NSNumber numberWithInt:[requestTextField.text integerValue]]];
    
    NSError *error = nil;
    if (![_managedObjectContext save:&error]) {
        //Handle error
    }
    recipientTextField.text = NULL;
    requestTextField.text = NULL;
}

//Dismiss keyboard
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
