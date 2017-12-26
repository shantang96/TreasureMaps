//
//  CustomTableViewCells.m
//  TreasureMap
//
//  Created by Shantanu Gupta on 12/8/17.
//  Copyright © 2017 Shantanu Gupta. All rights reserved.
//

#import "CustomTableViewCells.h"

@implementation CustomTableViewCells

- (void)awakeFromNib {
    [super awakeFromNib];
    
    // Initialization code
}

-(UITableViewCell*) tableView: (UITableView *) tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    
    return nil;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)infoButtonTapped:(id)sender {
    NSLog(@"Info button tapped on cell");
}
@end
