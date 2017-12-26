//
//  AddTreasureObjectViewController.h
//  TreasureMap
//
//  Created by Shantanu Gupta on 12/9/17.
//  Copyright © 2017 Shantanu Gupta. All rights reserved.
//

#import "ViewController.h"
#import "TreasureModel.h"


@interface AddTreasureObjectViewController : ViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, readwrite) float X;
@property (nonatomic, readwrite) float Y;
@property (weak, nonatomic) IBOutlet UITextField *senderNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *receiverNameTextFied;
@property (weak, nonatomic) IBOutlet UITextField *locationNameTextField;
@property (weak, nonatomic) IBOutlet UITextView *instructionsTextView;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
- (IBAction)saveButtonTapped:(id)sender;
@property (nonatomic, readwrite)TreasureModel* treasureModel;
@property (nonatomic, readwrite) UIImage* image;
@property (nonatomic, readwrite) BOOL imageSet;




@end
