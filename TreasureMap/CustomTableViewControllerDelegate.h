//
//  CustomTableViewControllerDelegate.h
//  TreasureMap
//
//  Created by Shantanu Gupta on 12/9/17.
//  Copyright © 2017 Shantanu Gupta. All rights reserved.
//

#ifndef CustomTableViewControllerDelegate_h
#define CustomTableViewControllerDelegate_h

//Defines the delegate class for TreasureTableViewController

@class TreasureTableViewController;
@protocol CustomTableViewControllerDelegate <NSObject>
@required
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
@end


#endif /* CustomTableViewControllerDelegate_h */
