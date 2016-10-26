//
//  ViewController.m
//  INCHAlbum
//
//  Created by Yazhong Luo on 10/25/16.
//  Copyright © 2016 Yazhong Luo. All rights reserved.
//

#import "ViewController.h"
#import "NXOAuth2.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *logoutButton;
@property (weak, nonatomic) IBOutlet UIButton *refreshButton;
@property (weak, nonatomic) IBOutlet UIImageView *ImageView;




@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.logoutButton.enabled = false;
//    self.refreshButton.enabled = false;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)loginButton:(id)sender {
    [[NXOAuth2AccountStore sharedStore] requestAccessToAccountWithType:@"Instagram"];
//    self.loginButton.enabled = false;
//    self.logoutButton.enabled = true;
//    self.refreshButton.enabled = true;
}
- (IBAction)logoutButton:(id)sender {

}
- (IBAction)refreshButton:(id)sender {
}


@end
