//
//  MapViewController.h
//  TreasureMap
//
//  Created by Shantanu Gupta on 12/8/17.
//  Copyright © 2017 Shantanu Gupta. All rights reserved.
//

#import "ViewController.h"
@import GoogleMaps;
#import "TreasureTableViewController.h"
#import "CustomTableViewControllerDelegate.h"

@interface MapViewController : ViewController <CustomTableViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIView *cardView;
@property (nonatomic, strong) GMSMapView* mapView;
@property (nonatomic, strong) TreasureTableViewController* treasureTableViewController;
@property (nonatomic, strong) GMSMarker *marker1;
@property (nonatomic, strong) GMSMarker *marker2;
@property (nonatomic, strong) GMSMarker *marker3;
@property (nonatomic, readwrite) int selectedIndex;

@property (nonatomic, strong) GMSCameraPosition *cp1;
@property (nonatomic, strong) GMSCameraPosition *cp2;
@property (nonatomic, strong) GMSCameraPosition *cp3;

- (void) setMarker;

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;


@end
