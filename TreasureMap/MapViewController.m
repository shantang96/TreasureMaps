//
//  MapViewController.m
//  TreasureMap
//  The main map screen of the app, has a TableView and a GMSMap, also implements CLLocationManager
//
//  Created by Shantanu Gupta on 12/8/17.
//  Copyright © 2017 Shantanu Gupta. All rights reserved.
//

#import "MapViewController.h"
#import "TreasureModel.h"
@import CoreLocation;
#import "AddTreasureObjectViewController.h"
#import "InfoViewController.h"

@interface MapViewController ()
- (IBAction)addNewLocationButtonTapped:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *editButton;
- (IBAction)editButtonTapped:(id)sender;
- (IBAction)infoButtonTapped:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *infoButton;

@property (nonatomic, strong) CLLocationManager* locationManager;
@property (nonatomic, readwrite)TreasureModel* treasureModel;
@property (weak, nonatomic) IBOutlet UIView *tableUIView;
@property (readwrite, nonatomic) BOOL editingAvailable;
@property (nonatomic, strong) GMSMarker *markerX;
@property (nonatomic, strong) NSMutableArray* markersArray;
@property (nonatomic, strong) NSMutableArray* cameraPositionsArray;



@end

@implementation MapViewController



- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    _markersArray = [[NSMutableArray alloc]init];
    _cameraPositionsArray = [[NSMutableArray alloc]init];

    
    _editButton.alpha = 0;
    _infoButton.alpha = 0;
    _editingAvailable = FALSE;

    _cardView.layer.borderWidth = 1;
    _cardView.layer.cornerRadius = 5;
    _cardView.layer.masksToBounds = TRUE;
    
    _locationManager = [[CLLocationManager alloc] init];
    //_locationManager.delegate = self;
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    _locationManager.distanceFilter = kCLHeadingFilterNone;
    
    
    GMSCameraPosition* camera = [GMSCameraPosition cameraWithLatitude:_locationManager.location.coordinate.latitude
                                                            longitude:_locationManager.location.coordinate.longitude zoom:15 bearing:0 viewingAngle:0];
    
    self.mapView = [GMSMapView mapWithFrame:self.view.bounds camera:camera];
    self.mapView.settings.compassButton = YES;
    self.mapView.settings.myLocationButton = YES;
    self.mapView.myLocationEnabled = YES;
    [self.view addSubview:self.mapView];
    [self.view sendSubviewToBack:self.mapView];
    [self.mapView setPadding:UIEdgeInsetsMake(300, 0, 150, 0)];
    [self.mapView setMinZoom:10 maxZoom:25];
    
    
    _treasureModel = [TreasureModel sharedModel];

    NSLog(@"Number of treasure objects in treasureModel === %lu", [_treasureModel numberOfTreasureObjects]);
    
    //Every time the MapViewController's view loads, it uses the TreasureModel singleton class
    //to add all the markers to the map and store them in the MarkersArray
    //Also adds all the GMSCameraPositions in the cameraPositionsArray
    
    for(int i=0; i< [_treasureModel numberOfTreasureObjects]; i++)
    {
        float X = [   [_treasureModel treasureObjectAtIndex:i] X].floatValue;
        float Y = [[[_treasureModel treasureObjectAtIndex:i] Y] floatValue];
        
        CLLocationCoordinate2D position = CLLocationCoordinate2DMake(X, Y);
        GMSMarker* marker = [GMSMarker markerWithPosition:position];
        marker.title = [[_treasureModel treasureObjectAtIndex:i] locationName];
        marker.map = self.mapView;
        marker.appearAnimation = TRUE;
        NSLog(@"Set marker %i complete!", i);
        [_markersArray insertObject:marker atIndex:i];
        
        GMSCameraPosition* camPos = [GMSCameraPosition cameraWithLatitude:X longitude:Y zoom:18];
        [_cameraPositionsArray insertObject:camPos atIndex:i];
        

    }
    
    
    
    
    
//    float X1 = [[_treasureModel treasureObjectAtIndex:0] X];
//    float Y1 =     [[_treasureModel treasureObjectAtIndex:0] Y];
//
//    float X2 = [[_treasureModel treasureObjectAtIndex:1] X];
//    float Y2 =     [[_treasureModel treasureObjectAtIndex:1] Y];
//
//    float X3 = [[_treasureModel treasureObjectAtIndex:2] X];
//    float Y3 =     [[_treasureModel treasureObjectAtIndex:2] Y];
//
//    CLLocationCoordinate2D position1 = CLLocationCoordinate2DMake(X1, Y1);
//    _marker1 = [GMSMarker markerWithPosition:position1];
//    _marker1.title = [[_treasureModel treasureObjectAtIndex:0] locationName];
//    _marker1.map = self.mapView;
//    _marker1.appearAnimation = TRUE;
//    NSLog(@"Set marker1 complete!");
//
//    CLLocationCoordinate2D position2 = CLLocationCoordinate2DMake(X2, Y2);
//    _marker2 = [GMSMarker markerWithPosition:position2];
//    _marker2.title = [[_treasureModel treasureObjectAtIndex:1] locationName];
//    _marker2.map = self.mapView;
//    _marker2.appearAnimation = TRUE;
//    NSLog(@"Set marker2 complete!");
//
//    CLLocationCoordinate2D position3 = CLLocationCoordinate2DMake(X3, Y3);
//    _marker3 = [GMSMarker markerWithPosition:position3];
//    _marker3.title = [[_treasureModel treasureObjectAtIndex:2] locationName];
//    _marker3.map = self.mapView;
//    _marker3.appearAnimation = TRUE;
//
//    _cp1 = [GMSCameraPosition cameraWithLatitude:X1 longitude:Y1 zoom:18];
//    _cp2 = [GMSCameraPosition cameraWithLatitude:X2 longitude:Y2 zoom:18];
//    _cp3 = [GMSCameraPosition cameraWithLatitude:X3 longitude:Y3 zoom:18];
//
//    NSLog(@"Set marker3 complete!");
//
//
//
    [[self.tableUIView.subviews objectAtIndex:0] setDelegate:self];
    // Do any additional setup after loading the view.
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) prefersStatusBarHidden
{
    return YES;
}

- (void) viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
}

- (void) setMarker
{
    CLLocationCoordinate2D position = CLLocationCoordinate2DMake(28.53, -81.36);
    GMSMarker *marker = [GMSMarker markerWithPosition:position];
    marker.title = @"Hello World";
    marker.map = self.mapView;
    
    marker.appearAnimation = TRUE;
    NSLog(@"Set marker complete!");
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{


    [_mapView animateToCameraPosition:[_cameraPositionsArray objectAtIndex:indexPath.row]];
    [_mapView setSelectedMarker: _markersArray[indexPath.row]];
    self.selectedIndex = indexPath.row ;
    _infoButton.alpha = 1;
    
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if([segue.identifier isEqualToString:@"AddNewTreasureSegue"])
    {
        AddTreasureObjectViewController* newATOVController = [segue destinationViewController];
        newATOVController.X = _markerX.position.latitude;
        newATOVController.Y = _markerX.position.longitude;
    }
    
    if([segue.identifier isEqualToString:@"InfoViewSegue"])
    {
        InfoViewController* newInfoController = [segue destinationViewController];
        newInfoController.selectedIndex = _selectedIndex;
    }
    
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


- (IBAction)addNewLocationButtonTapped:(id)sender
{
    if(_editingAvailable == NO)
    {
    
        
        float Y = _locationManager.location.coordinate.longitude;
        float X = _locationManager.location.coordinate.latitude;
    
        NSLog(@"Longitude = %f Latitude = %f", X, Y);
    
        _markerX = [GMSMarker markerWithPosition:_mapView.camera.target];
        _markerX.title = @"Drag to set new position";
        _markerX.map = self.mapView;
        _markerX.appearAnimation = TRUE;
        _markerX.draggable = YES;
//        GMSCameraPosition* cp1 = [GMSCameraPosition cameraWithLatitude:X longitude:Y zoom:15];

    
        _mapView.selectedMarker= _markerX;
//        [_mapView animateToCameraPosition:cp1];
    
    
        _editButton.alpha = 1;
        _editingAvailable = YES;
    }
    else
    {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Wait!"
                                                                       message:@"Save first new location before creating another one."
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
        
        
    }
    
    
}
- (IBAction)editButtonTapped:(id)sender
{
    
    _editingAvailable = false;
    
    
    
}

- (IBAction)infoButtonTapped:(id)sender
{
    
}
@end
