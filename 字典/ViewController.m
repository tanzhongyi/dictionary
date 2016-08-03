//
//  ViewController.m
//  字典
//
//  Created by Ibokan on 16/7/18.
//  Copyright © 2016年 tanzhongyi. All rights reserved.
//

#import "ViewController.h"
#import "moreViewController.h"
#import "bsViewController.h"
#import "piViewController.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
@interface ViewController ()

{
     int index;
     int pinumber;
     UIImageView *imageview;
     UIImageView *cimage;
     UIImageView *bimage;
     UIImageView *dimage;
     NSArray *arr2;
     UILabel *blaber;
}
@end

@implementation ViewController

- (void)viewDidLoad {
     
     [super viewDidLoad];
     

     [self addNaigation];
     [self addSegmented];
     [self addTextField];
     [self addimage];
     [self addstroll];
     
     
     
     
     
     
}
-(void)changeAction1:(UIButton *)sender{
     bsViewController *bsvc=[bsViewController new];
     
     bsvc.receive=(int)sender.tag-100;
          [self.navigationController pushViewController:bsvc animated:YES];
}
-(void)changeAction2:(UIButton *)sender{
     piViewController *pi=[piViewController new];
     
     pi.receive=(int)sender.tag-100;

     [self.navigationController pushViewController:pi animated:YES];
}
-(void)addimage{
     UILabel *alaber=[[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-350)/2, 185, 350, 50)];
     alaber.text=@"最近搜索 :";
     alaber.font=[UIFont systemFontOfSize:20];
     [self.view addSubview:alaber];
     UIImageView *aimage=[[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-350)/2, 225, 350, 5)];
     aimage.image=[UIImage imageNamed:@"dividing-line"];
     [self.view addSubview:aimage];
     
     bimage=[[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-350)/2, 235, 350, 50)];
     bimage.image=[UIImage imageNamed:@"Key-frame1"];
     bimage.userInteractionEnabled = YES;
     [self.view addSubview:bimage];
     
     cimage=[[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-350)/2, 315, 350, 5)];
     cimage.image=[UIImage imageNamed:@"dividing-line"];
     [self.view addSubview:cimage];
     
     for (int i=0; i<7; i++) {
          UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
          button = [[UIButton alloc] initWithFrame:CGRectMake(i * 52, 10, 40, 40)];
          [button setTitle:@"哈" forState:UIControlStateNormal];
          [button addTarget:self action:@selector(changeAction1:) forControlEvents:UIControlEventTouchUpInside];
          [bimage addSubview:button];
          
     }
 
     
     
}
-(void)strollData{
     arr2 = [NSMutableArray arrayWithObjects:@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z" ,nil];
}
-(void)addstroll{
     [self strollData];
     blaber=[[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-350)/2, 275, 350, 50)];
     blaber.text=@"按照部首笔画索引 :";
     blaber.font=[UIFont systemFontOfSize:20];
     [self.view addSubview:blaber];
     index=0;
     dimage=[[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-350)/2, 335, 350, 380)];
     dimage.image=[UIImage imageNamed:@"Key-frame2"];
     dimage.userInteractionEnabled = YES;
     [self.view addSubview:dimage];
     for (int i=0; i<4; i++) {
          if (i==3) {
               for (int j= 0; j<2; j++) {
                    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeSystem];
                    
                    button2 = [[UIButton alloc] initWithFrame:CGRectMake(j * 45, 230, 40, 40)];
                    [button2 setTitle:[NSString stringWithFormat:@"%@",arr2[index]] forState:0];
                    button2.tag=100+index;
                    button2.titleLabel.font=[UIFont systemFontOfSize:20];
                    [button2 addTarget:self action:@selector(changeAction2:) forControlEvents:UIControlEventTouchUpInside];
                    [dimage addSubview:button2];
                    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                    index++;
               }
          }else{
               for (int q=0; q<8; q++) {
                    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeSystem];
                    
                    button2 = [[UIButton alloc] initWithFrame:CGRectMake(q * 45, 50+(60*i), 40, 40)];
                    [button2 setTitle:[NSString stringWithFormat:@"%@",arr2[index]]forState:UIControlStateNormal];
                    button2.tag=100+index;
                    button2.titleLabel.font=[UIFont systemFontOfSize:20];
                    [button2 addTarget:self action:@selector(changeAction2:) forControlEvents:UIControlEventTouchUpInside];
                    [dimage addSubview:button2];
                    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                    index++;
               }

          }
     }
}
-(void)addguihua{
     blaber=[[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-350)/2, 275, 350, 50)];
     blaber.text=@"按照拼音字母检索 :";
     blaber.font=[UIFont systemFontOfSize:20];
     [self.view addSubview:blaber];
     dimage=[[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-350)/2, 335, 350, 380)];
     dimage.image=[UIImage imageNamed:@"Key-frame2"];
     dimage.userInteractionEnabled = YES;
     [self.view addSubview:dimage];
     index=0;
               for (int q=0; q<9; q++) {
                    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeSystem];
                    
                    button2 = [[UIButton alloc] initWithFrame:CGRectMake(q * 38, 50, 38, 38)];
                    [button2 setTitle:[NSString stringWithFormat:@"%d",index+1] forState:UIControlStateNormal];
                    button2.tag=100+index;
                    button2.titleLabel.font=[UIFont systemFontOfSize:20];
                    
                    [button2 addTarget:self action:@selector(changeAction1:) forControlEvents:UIControlEventTouchUpInside];
                    [dimage addSubview:button2];
                    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                    index++;
               }
     
     for (int r= 0; r<6; r++) {
          UIButton *button2 = [UIButton buttonWithType:UIButtonTypeSystem];
          
          button2 = [[UIButton alloc] initWithFrame:CGRectMake(r * 55, 110, 60, 45)];
          [button2 setTitle:[NSString stringWithFormat:@"%d",index+1] forState:0];
          button2.tag=100+index;
          button2.titleLabel.font=[UIFont systemFontOfSize:20];
          [button2 addTarget:self action:@selector(changeAction1:) forControlEvents:UIControlEventTouchUpInside];
          [dimage addSubview:button2];
          [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
          index++;

     }
               
     for (int w=0; w<2; w++) {
          UIButton *button2 = [UIButton buttonWithType:UIButtonTypeSystem];
          
          button2 = [[UIButton alloc] initWithFrame:CGRectMake(w * 38, 170, 38, 38)];
          [button2 setTitle:[NSString stringWithFormat:@"%d",index+1] forState:0];
          button2.titleLabel.font=[UIFont systemFontOfSize:20];
          [button2 addTarget:self action:@selector(changeAction1:) forControlEvents:UIControlEventTouchUpInside];
          button2.tag=100+index;
          [dimage addSubview:button2];
          [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
          index++;
     }

}
-(void)addTextField{
     UITextField *textField=[[UITextField alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-350)/2, 140, 350, 50)];
     textField.placeholder=@"请输入...";
     textField.adjustsFontSizeToFitWidth=YES;
     textField.clearsOnInsertion=YES;
     textField.layer.borderWidth=2;
     textField.layer.cornerRadius=23;
     textField.layer.masksToBounds=YES;
     UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 20, 50)];
     textField.leftView=view;
     textField.font=[UIFont systemFontOfSize:30];
     textField.leftViewMode=UITextFieldViewModeAlways;
     [self.view addSubview:textField];
}
-(void)addNaigation{
     self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"more"]  style:UIBarButtonItemStylePlain target:self action:@selector(backAction:)];
     self.navigationItem.rightBarButtonItem.tintColor=[UIColor whiteColor];
     self.navigationItem.title=@"辞海";
     self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:136/255.0 green:40/255.0 blue:40/255.0 alpha:1];
     imageview=[[UIImageView alloc]initWithFrame:self.view.frame];
     imageview.image=[UIImage imageNamed:@"beijing"];
     [self.view addSubview:imageview];
}
-(void)backAction:(UINavigationBar *)sender{
     moreViewController *morevc=[moreViewController new];
     [self.navigationController pushViewController:morevc animated:YES];
}
-(void)addSegmented{
     UISegmentedControl *sege=[[UISegmentedControl alloc]initWithItems:@[@"拼音检字",@"部首检字"]];
     sege.frame=CGRectMake((SCREEN_WIDTH-350)/2, 80, 350, 50);
     [self.view addSubview:sege];
     sege.selectedSegmentIndex=0;
     sege.layer.shadowRadius = 9;
     NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor cyanColor],
                          NSForegroundColorAttributeName,
                          [UIFont boldSystemFontOfSize:24],
                          NSFontAttributeName,nil];
     
     [sege setTitleTextAttributes:dic forState:UIControlStateSelected];
     sege.tintColor=[UIColor redColor];
     [sege addTarget:self action:@selector(setActionName:) forControlEvents:UIControlEventValueChanged];
}

-(void)setActionName:(UISegmentedControl *)sener{
     if (sener.selectedSegmentIndex ==0) {
          [blaber removeFromSuperview];
          [dimage removeFromSuperview];
          [self addstroll];
     }else if (sener.selectedSegmentIndex ==1){
          [blaber removeFromSuperview];
          [dimage removeFromSuperview];
          [self addguihua];
     }else{
          NSLog(@"boon");
     }
}
- (void)didReceiveMemoryWarning {
     [super didReceiveMemoryWarning];
     // Dispose of any resources that can be recreated.
}

@end
