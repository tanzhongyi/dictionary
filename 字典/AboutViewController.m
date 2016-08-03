//
//  AboutViewController.m
//  字典
//
//  Created by Ibokan on 16/7/19.
//  Copyright © 2016年 tanzhongyi. All rights reserved.
//

#import "AboutViewController.h"
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
@interface AboutViewController ()
{
     UIImageView *imageview;
}
@end

@implementation AboutViewController

- (void)viewDidLoad {
     [super viewDidLoad];
     [self addNaigation];
     [self addheading];
     
     
}
-(void)addheading{
     UIImageView *aimage=[[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-350)/2, 80, 350, 60)];
     aimage.image=[UIImage imageNamed:@"z"];
     [self.view addSubview:aimage];
     UILabel *alaber=[[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-230)/2, 80, 230, 60)];
     alaber.text=@"指掌无线";
     alaber.font=[UIFont systemFontOfSize:35];
     [self.view addSubview:alaber];
     
     
     UILabel *blaber=[[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-80), 130, 80, 55)];
     blaber.text=@"辞海";
     blaber.textColor=[UIColor grayColor];
     blaber.font=[UIFont systemFontOfSize:20];
     [self.view addSubview:blaber];
     
     UIImageView *bimage=[[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-150)/2, 200, 150, 150)];
     bimage.image=[UIImage imageNamed:@"zidian"];
     [self.view addSubview:bimage];
     
     UILabel *claber=[[UILabel alloc]initWithFrame:CGRectMake(30, 370, 360, 170)];
     claber.text=@"   Sesame Street's format includes skits featuring Jim Henson's Muppets as well as animation and short films to help its preschool audience prepare for school. ";
     claber.numberOfLines=0;
     claber.textColor=[UIColor grayColor];
     claber.font=[UIFont systemFontOfSize:20];
     [self.view addSubview:claber];
     
     UIImageView *cimage=[[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH -350)/2, 520, 350, 170)];
     cimage.image=[UIImage imageNamed:@"fankuikuang"];
     [self.view addSubview:cimage];
     
     
     UILabel *dlaber=[[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH -330)/2, 520, 330, 170)];
     dlaber.text=@"   Sesame Street's format includes skits featuring Jim Henson's Muppets as well as animation and short films  ";
     dlaber.numberOfLines=0;
     dlaber.font=[UIFont systemFontOfSize:20];
     [self.view addSubview:dlaber];

     
}
-(void)addNaigation{
     self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"return"]  style:UIBarButtonItemStylePlain target:self action:@selector(backAction:)];
     self.navigationItem.leftBarButtonItem.tintColor=[UIColor whiteColor];
     
     
     UILabel *laber=[[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-60)/2, 20, 60, 50)];
     laber.text=@"关于我们";
     laber.font=[UIFont systemFontOfSize:20];
     laber.textAlignment=NSTextAlignmentCenter;
     laber.textColor=[UIColor whiteColor];
     self.navigationItem.titleView=laber;
     
     self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:136/255.0 green:40/255.0 blue:40/255.0 alpha:1];
     
     self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"magnifier"]  style:UIBarButtonItemStylePlain target:self action:@selector(backAction:)];
     self.navigationItem.rightBarButtonItem.tintColor=[UIColor whiteColor];
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
