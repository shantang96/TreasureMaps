//
//  CustomTableViewCells.h
//  TreasureMap
//
//  Created by Shantanu Gupta on 12/8/17.
//  Copyright © 2017 Shantanu Gupta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCells : UITableViewCell
@property (strong, nonnull) IBOutlet UILabel *locationNameLabel;
@property (strong, nonnull) IBOutlet UILabel *senderNameLabel;
@property (weak, nonatomic) IBOutlet UIButton * _Nullable infoButton;
@property (weak, nonatomic) IBOutlet UIImageView *locIconImage;


@end
