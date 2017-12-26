//
//  InfoViewController.m
//  TreasureMap
//
//  Created by Shantanu Gupta on 12/11/17.
//  Copyright © 2017 Shantanu Gupta. All rights reserved.
//

#import "InfoViewController.h"
#import "TreasureModel.h"

@interface InfoViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (nonatomic, readwrite)TreasureModel* treasureModel;
@property (weak, nonatomic) IBOutlet UILabel *locationNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *senderNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *receiverNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *instructionsLabel;


@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _treasureModel = [TreasureModel sharedModel];

    TreasureObject* t = [_treasureModel treasureObjectAtIndex:_selectedIndex];
    
    _locationNameLabel.text = t.locationName;
    _senderNameLabel.text = t.from;
    _receiverNameLabel.text = t.to;
    _instructionsLabel.text = t.instructions;
    if(t.image != nil)
    {
        _imageView.image = t.image;
    }
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
