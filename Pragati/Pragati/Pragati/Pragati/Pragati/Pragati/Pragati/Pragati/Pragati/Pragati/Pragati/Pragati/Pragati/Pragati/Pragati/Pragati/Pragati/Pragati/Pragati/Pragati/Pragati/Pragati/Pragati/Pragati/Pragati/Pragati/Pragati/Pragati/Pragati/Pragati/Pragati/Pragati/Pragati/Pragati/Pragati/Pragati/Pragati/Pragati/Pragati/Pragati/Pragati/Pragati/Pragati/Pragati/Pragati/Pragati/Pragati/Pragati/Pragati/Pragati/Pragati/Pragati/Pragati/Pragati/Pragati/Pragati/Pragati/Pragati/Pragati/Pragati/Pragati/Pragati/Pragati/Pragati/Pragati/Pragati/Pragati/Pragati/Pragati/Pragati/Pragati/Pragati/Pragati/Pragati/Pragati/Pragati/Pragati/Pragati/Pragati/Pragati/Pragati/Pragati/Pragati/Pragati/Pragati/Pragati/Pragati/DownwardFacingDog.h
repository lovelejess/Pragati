//
//  DownwardFacingDog.h
//  Pragati
//
//  Created by Jessica Le on 3/26/15.
//  Copyright (c) 2015 LoveLeJess. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface DownwardFacingDog : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) id photo;

@end
