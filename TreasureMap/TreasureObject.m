//
//  TreasureObject.m
//  TreasureMap
//
//  Created by Shantanu Gupta on 12/9/17.
//  Copyright © 2017 Shantanu Gupta. All rights reserved.
//

#import "TreasureObject.h"

@implementation TreasureObject

- (instancetype) initWithFrom : (NSString*) personA
                            to: (NSString*) personB
                  instructions: (NSString*) instructions
{
    _from = personA;
    _to = personB;
    _instructions = instructions;
    return self;
}

- (instancetype) initWithFrom : (NSString*) personA
                            to: (NSString*) personB
                  instructions: (NSString*) instructions
                  locationName:(NSString *)locName
{
    _from = personA;
    _to = personB;
    _instructions = instructions;
    _locationName = locName;
    return self;
}

- (instancetype) initWithFrom : (NSString*) personA
                            to: (NSString*) personB
                  instructions: (NSString*) instructions
                  locationName: (NSString*) locName
                             X: (float) X
                             Y: (float) Y
{
    _from = personA;
    _to = personB;
    _instructions = instructions;
    _locationName = locName;
    _X = [NSNumber numberWithFloat:X];
    _Y = [NSNumber numberWithFloat:Y];
    return self;
}

- (instancetype) initWithFrom : (NSString*) personA
                            to: (NSString*) personB
                  instructions: (NSString*) instructions
                  locationName: (NSString*) locName
                             X: (float) X
                             Y: (float) Y
                         image:(UIImage *)image
{
    _from = personA;
    _to = personB;
    _instructions = instructions;
    _locationName = locName;
    _X = [NSNumber numberWithFloat:X];
    _Y = [NSNumber numberWithFloat:Y];
    _image = image;
    return self;
}

- (void)encodeWithCoder:(nonnull NSCoder *)aCoder
{
    [aCoder encodeObject:_from forKey:@"from"];
    [aCoder encodeObject:_to forKey:@"to"];
    [aCoder encodeObject:_instructions forKey:@"instructions"];
    [aCoder encodeObject:_locationName forKey:@"locationName"];
    [aCoder encodeObject:_X forKey:@"X"];
    [aCoder encodeObject:_Y forKey:@"Y"];
    [aCoder encodeObject:_image forKey:@"image"];
}
- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder
{
    self = [super init];
    if (self != NULL)
    {
        _from = [aDecoder decodeObjectForKey:@"from"];
        _to = [aDecoder decodeObjectForKey:@"to"];
        _instructions = [aDecoder decodeObjectForKey:@"instructions"];
        _locationName = [aDecoder decodeObjectForKey:@"locationName"];
        _X = [aDecoder decodeObjectForKey:@"X"];
        _Y = [aDecoder decodeObjectForKey:@"Y"];
        _image = [aDecoder decodeObjectForKey:@"image"];

    }
    return self;
}



@end
