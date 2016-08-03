//
//  SharingViewController.m
//  字典
//
//  Created by Ibokan on 16/7/19.
//  Copyright © 2016年 tanzhongyi. All rights reserved.
//

#import "SharingViewController.h"

@interface SharingViewController ()
{
     UIImageView *imageview;
}
@end

@implementation SharingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     [self addNaigation];
}
-(void)addNaigation{
     self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"return"]  style:UIBarButtonItemStylePlain target:self action:@selector(backAction:)];
     self.navigationItem.leftBarButtonItem.tintColor=[UIColor whiteColor];
     self.navigationItem.rightBarButtonItem.tintColor=[UIColor whiteColor];
     self.navigationItem.title=@"关于我们";
     self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:136/255.0 green:40/255.0 blue:40/255.0 alpha:1];
     imageview=[[UIImageView alloc]initWithFrame:self.view.frame];
     imageview.image=[UIImage imageNamed:@"beijing"];
     [self.view addSubview:imageview];
}
-(void)backAction:(UIButton *)sender{
     [self.navigationController popViewControllerAnimated:YES];
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
