//
//  PrayerRequests.h
//  BiblePoint
//
//  Created by Doug Dykstra on 6/21/14.
//  Copyright (c) 2014 dougdykstra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface PrayerRequests : NSManagedObject

@property (nonatomic, retain) NSString * recipient;
@property (nonatomic, retain) NSString * request;
@property (nonatomic, retain) NSData * recipientImage;

@end
