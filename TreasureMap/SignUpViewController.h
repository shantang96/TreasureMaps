//
//  SignUpViewController.h
//  TreasureMap
//
//  Created by Shantanu Gupta on 12/8/17.
//  Copyright © 2017 Shantanu Gupta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;

- (IBAction)signUpButtonClicked:(id)sender;

@end
