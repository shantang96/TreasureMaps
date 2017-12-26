//
//  LogInViewController.h
//  TreasureMap
//
//  Created by Shantanu Gupta on 12/8/17.
//  Copyright © 2017 Shantanu Gupta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogInViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *userTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *signInButton;
- (IBAction)signInButtonTapped:(id)sender;

@end
