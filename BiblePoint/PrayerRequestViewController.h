//
//  PrayerRequestViewController.h
//  BiblePoint
//
//  Created by Doug Dykstra on 6/21/14.
//  Copyright (c) 2014 dougdykstra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PrayerRequestViewController : UIViewController <UITextFieldDelegate, UIAlertViewDelegate, UITextViewDelegate>

@property (strong, nonatomic) IBOutlet UITextField *recipientTextField;
@property (strong, nonatomic) IBOutlet UITextField *requestTextField;
@property (weak, nonatomic) IBOutlet UITextView *requestDetails;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (IBAction)addPrayerRequest:(id)sender;

@end
