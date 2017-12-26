//
//  TreasureTableViewController.h
//  TreasureMap
//
//  Created by Shantanu Gupta on 12/9/17.
//  Copyright © 2017 Shantanu Gupta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TreasureModel.h"
#import "CustomTableViewCells.h"
#import "MapViewController.h"
#import "CustomTableViewControllerDelegate.h"

//Creates a custom Delegate called CustomTableViewContorllerDelegate

@interface TreasureTableViewController : UITableViewController
{
    id <CustomTableViewControllerDelegate> delegate;
}

@property (nonatomic, assign) id <CustomTableViewControllerDelegate> delegate;


@end
