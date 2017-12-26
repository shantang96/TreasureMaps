//
//  TreasureModel.m
//  TreasureMap
//
//  Created by Shantanu Gupta on 12/9/17.
//  Copyright © 2017 Shantanu Gupta. All rights reserved.
//

#import "TreasureModel.h"

static NSString *kTreasureKey = @"TheTreasureMapDataArray";


@implementation TreasureModel

-(instancetype)init
{
    _treasuresArray = [[NSMutableArray alloc]init];
//    TreasureObject* t1 = [[TreasureObject alloc] initWithFrom:@"Bennett Lee" to:@"Trina Gregory" instructions:@"Look under the first bench! ;)" locationName:@"Viterbi E-Quad" X:34.020554 Y:-118.288710];
//    TreasureObject* t2 = [[TreasureObject alloc] initWithFrom:@"Tommy Trojan" to:@"George Tirebiter" instructions:@"Dig into the sandpit to find it!" locationName:@"Cromwell Field" X:34.022107 Y: -118.287844 ];
//    TreasureObject* t3 = [[TreasureObject alloc] initWithFrom:@"Adam Moffet" to:@"Jason Zheng" instructions:@"It's behind SAL, X marks the spot!" locationName:@"SAL" X:34.019743 Y: -118.289463];
//
//    [_treasuresArray insertObject:t1 atIndex:0];
//    [_treasuresArray insertObject:t2 atIndex:1];
//    [_treasuresArray insertObject:t3 atIndex:2];

    //Data Persistence here, to load from Documents
    
    NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray* data = [currentDefaults objectForKey:kTreasureKey];
    
    for( int i=0; i<data.count; i++)
    {
        NSData* tempDataObject = data[i];
        TreasureObject* t = [NSKeyedUnarchiver unarchiveObjectWithData:tempDataObject];
        [_treasuresArray addObject:t];
    }
    
    
    
    return self;
}


+ (instancetype) sharedModel
{
    static TreasureModel *_sharedModel = nil;
    
    if(_sharedModel == nil)
    {
        _sharedModel = [[self alloc] init];
    }
    return _sharedModel;
}

- (NSUInteger) numberOfTreasureObjects
{
    NSUInteger n = [_treasuresArray count];
    return n;
}

- (TreasureObject *) treasureObjectAtIndex: (NSUInteger) index
{
    if(index < [self numberOfTreasureObjects])
    {
        return [_treasuresArray objectAtIndex:index];
    }
    else
    {
        return nil;
    }
}

- (TreasureObject *) nextTreasureObject
{
    if(_currentIndex+1 < [self numberOfTreasureObjects] )
    {
        TreasureObject* f1 =  [_treasuresArray objectAtIndex:_currentIndex+1];
        _currentIndex += 1;
        return f1;
    }
    else
    {
        return nil;
    }
}

- (TreasureObject *) prevTreasureObject
{
    if(_currentIndex != 0)
    {
        
        TreasureObject* f1 =  [_treasuresArray objectAtIndex:_currentIndex-1];
        _currentIndex -= 1;
        return f1;
    }
    else
    {
        return nil;
    }
}

- (void) removeTreasureObjectAtIndex: (NSUInteger) index
{
    if( index < [self numberOfTreasureObjects])
    {
        [_treasuresArray removeObjectAtIndex:index];
    }
}

- (void) insertWithFrom: (NSString *) personA
              to: (NSString *) personB
withInstructions: (NSString *) instr
    LocationName:(NSString *)locName
                      X: (float) X
                      Y: (float) Y
{
    TreasureObject* t1 = [[TreasureObject alloc] initWithFrom:personA to:personB instructions:instr locationName:locName X:X Y:Y];
    [_treasuresArray insertObject:t1 atIndex:[self numberOfTreasureObjects]];
    [self save];
}

- (void) insertWithFrom: (NSString *) personA
                     to: (NSString *) personB
       withInstructions: (NSString *) instr
           LocationName:(NSString *)locName
                      X: (float) X
                      Y: (float) Y
                  Image:(UIImage *)image
{
    TreasureObject* t1 = [[TreasureObject alloc] initWithFrom:personA to:personB instructions:instr locationName:locName X:X Y:Y image:image];
    [_treasuresArray insertObject:t1 atIndex:[self numberOfTreasureObjects]];
    [self save];
}


//Saves the treasureArray to UserDefaults. Only called in insertWithFrom (extended)
- (void) save
{
    //Convert treasuresAourray to dataArray
    NSMutableArray *dataArray = [NSMutableArray arrayWithCapacity:_treasuresArray.count];
    
    for(int i=0; i<_treasuresArray.count; i++)
    {
        NSData *treasureDataObject = [NSKeyedArchiver archivedDataWithRootObject:_treasuresArray[i]];
        [dataArray addObject:treasureDataObject];
    }
    
    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
    [standardDefaults setObject:dataArray forKey:kTreasureKey];
    [standardDefaults synchronize];
}

@end
