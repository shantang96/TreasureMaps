//
//  TreasureModel.h
//  TreasureMap
//
//  The treasure model holds an NSMutableArray of TreasureObjects and can perform actions on it.
//  It is a shared singleton class used by 3 different ViewControllers.
//  Created by Shantanu Gupta on 12/9/17.
//  Copyright © 2017 Shantanu Gupta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TreasureObject.h"
#import <UIKit/UIKit.h>

@interface TreasureModel : NSObject

@property (nonatomic, strong) NSMutableArray* treasuresArray;
@property (nonatomic, strong) UIImage* image;
@property (readonly, nonatomic) NSUInteger currentIndex;

- (instancetype)init;
+ (instancetype) sharedModel;
- (NSUInteger) numberOfTreasureObjects;

- (TreasureObject *) treasureObjectAtIndex: (NSUInteger) index;

- (TreasureObject*) nextTreasureObject;
- (TreasureObject*) prevTreasureObject;

- (void) insertWithFrom: (NSString *) personA
                     to: (NSString *) personB
       withInstructions: (NSString *) instr
           LocationName:(NSString *)locName
                      X: (float) X
                      Y: (float) Y;

- (void) insertWithFrom: (NSString *) personA
                     to: (NSString *) personB
       withInstructions: (NSString *) instr
           LocationName:(NSString *)locName
                      X: (float) X
                      Y: (float) Y
                  Image: (UIImage *) image;

- (void) removeTreasureObjectAtIndex: (NSUInteger) index;
- (void) save;

@end
