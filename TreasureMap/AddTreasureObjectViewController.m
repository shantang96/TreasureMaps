//
//  AddTreasureObjectViewController.m
//  TreasureMap
//
//  Created by Shantanu Gupta on 12/9/17.
//  Copyright © 2017 Shantanu Gupta. All rights reserved.
//

#import "AddTreasureObjectViewController.h"

@interface AddTreasureObjectViewController ()

@end

@implementation AddTreasureObjectViewController
- (IBAction)cameraButtonTapped:(id)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
    //ALTERNATIVELY, call takePhoto
    //[self takePhoto];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _treasureModel = [TreasureModel sharedModel];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

//Adds the new treasureObject to the treasureModel before segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    NSString* senderName = _senderNameTextField.text;
    NSString* receiverName = _receiverNameTextFied.text;
    NSString* locationName = _locationNameTextField.text;
    NSString* instructionsText = _instructionsTextView.text;
    
    if(![senderName isEqualToString:@""] && ![receiverName isEqualToString:@""] && ![locationName isEqualToString:@""])
    {
        if(_imageSet)
        {
            [_treasureModel insertWithFrom:senderName to:receiverName withInstructions:instructionsText LocationName:locationName X:_X Y:_Y Image:_image];
        }
        else
        {
        //        TreasureObject* t1 = [[TreasureObject alloc] initWithFrom:senderName to:receiverName instructions:instructionsText locationName:locationName X:_X Y:_Y];
        [_treasureModel insertWithFrom:senderName to:receiverName withInstructions:instructionsText LocationName:locationName X:_X Y:_Y];
        }
    }
    else
    {
        //UIAlert
    }

    
    
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.image = chosenImage;
    _imageSet = YES;
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)takePhoto {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
}

- (IBAction)saveButtonTapped:(id)sender
{
    

    
    
}
@end
