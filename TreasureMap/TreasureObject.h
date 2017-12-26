//
//  TreasureObject.h
//  TreasureMap
//
//  Created by Shantanu Gupta on 12/9/17.
//  Copyright © 2017 Shantanu Gupta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TreasureObject : NSObject<NSCoding>

@property (readonly, nonatomic) NSString* from;
@property (readonly, nonatomic) NSString* to; //can be "public"
@property (readwrite, nonatomic) BOOL hasPicture;
@property (readonly, nonatomic) NSString* instructions;
@property (readonly, nonatomic) NSString* locationName;
@property (readonly, nonatomic) NSNumber* X;
@property (readonly, nonatomic) NSNumber* Y;
@property (nonatomic, readwrite) UIImage* image;




//Location Object to store location

- (instancetype) initWithFrom : (NSString*) personA
                            to: (NSString*) personB
                  instructions: (NSString*) instructions;

- (instancetype) initWithFrom : (NSString*) personA
                            to: (NSString*) personB
                  instructions: (NSString*) instructions
                  locationName: (NSString*) locName;

- (instancetype) initWithFrom : (NSString*) personA
                            to: (NSString*) personB
                  instructions: (NSString*) instructions
                  locationName: (NSString*) locName
                             X: (float) X
                             Y: (float) Y;

- (instancetype) initWithFrom : (NSString*) personA
                            to: (NSString*) personB
                  instructions: (NSString*) instructions
                  locationName: (NSString*) locName
                             X: (float) X
                             Y: (float) Y
                         image: (UIImage *) image;

//For Data Persistence <NSCoding> delegate methods
- (void)encodeWithCoder:(nonnull NSCoder *)aCoder;

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder;

@end
