//
//  CommentViewController.m
//  字典
//
//  Created by Ibokan on 16/7/20.
//  Copyright © 2016年 tanzhongyi. All rights reserved.
//

#import "CommentViewController.h"
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define APPIRATER   NSLocalizedString(@"人终有一死,而有些人却需要一些帮助.", nil)
@interface CommentViewController ()<UITextViewDelegate>

{
     UIImageView *imageviewa;
     UIImageView *imageviewb;
     UIImageView *imageviewc;
     UIView *viewa;
     UIView *viewb;
     UIView *viewc;
     UIView *viewd;
     UILabel *labera;
     UILabel *laberb;
     
}
@property(nonatomic,strong)UITextView *textView;
@end

@implementation CommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     [self addNaigation];
     [self addbody];
     [self addbuttonAction];
     
}
-(void)addbuttonAction{
     imageviewb =[[UIImageView alloc]initWithFrame:CGRectMake(20, SCREEN_HEIGHT-80, 80, 40)];
     imageviewb.image=[UIImage imageNamed:@"pressed2"];
     [self.view addSubview:imageviewb];
     imageviewb.userInteractionEnabled=YES;
     imageviewc =[[UIImageView alloc]initWithFrame:CGRectMake(110, SCREEN_HEIGHT-80, 80, 40)];
     imageviewc.userInteractionEnabled=YES;
     imageviewc.image=[UIImage imageNamed:@"pressed2"];
     [self.view addSubview:imageviewc];
     
     labera=[[UILabel alloc]initWithFrame:CGRectMake(10, 3, 50, 40)];
     labera.text=@"男";
     [imageviewb addSubview:labera];
     
     laberb=[[UILabel alloc]initWithFrame:CGRectMake(10, 3, 50, 40)];
     laberb.text=@"年龄";
     [imageviewc addSubview:laberb];
     
     UIButton *uibuttona=[UIButton buttonWithType:UIButtonTypeSystem];
     [uibuttona setImage:[UIImage imageNamed:@"downward"] forState:UIControlStateNormal];
     uibuttona.frame=CGRectMake(60, 0, 20, 40);
     [uibuttona addTarget:self action:@selector(uibuttonaAction:) forControlEvents:UIControlEventTouchUpInside];
     [imageviewb addSubview:uibuttona];
     
     
     UIButton *uibuttonb=[UIButton buttonWithType:UIButtonTypeSystem];
     [uibuttonb setImage:[UIImage imageNamed:@"downward"] forState:UIControlStateNormal];
     uibuttonb.frame=CGRectMake(60, 0, 20, 40);
     [uibuttonb addTarget:self action:@selector(uibuttonbAction:) forControlEvents:UIControlEventTouchUpInside];
     [imageviewc addSubview:uibuttonb];
     
     UIButton *uibuttonc=[UIButton buttonWithType:UIButtonTypeSystem];
     uibuttonc.frame=CGRectMake(SCREEN_WIDTH-120, SCREEN_HEIGHT-80, 80, 40);
     [uibuttonc setTitle:@"提交" forState:0];
     [uibuttonc addTarget:self action:@selector(uibuttoncAction:) forControlEvents:UIControlEventTouchUpInside];
     [uibuttonc.layer setCornerRadius:15];
     [uibuttonc.layer setBorderWidth:1];
     [uibuttonc.layer setBorderColor:(__bridge CGColorRef _Nullable)([UIColor colorWithRed:136/255.0 green:40/255.0 blue:40/255.0 alpha:1])];
     uibuttonc.backgroundColor=[UIColor colorWithRed:136/255.0 green:40/255.0 blue:40/255.0 alpha:1];
     [self.view addSubview:uibuttonc];
}
-(void)uibuttonaAction:(UIButton *)sender{
     [viewb removeFromSuperview];
     [viewc removeFromSuperview];
     [viewd removeFromSuperview];
          viewa=[[UIView alloc]initWithFrame:CGRectMake(20, SCREEN_HEIGHT-160, 80, 80)];

          [self.view addSubview:viewa];
     
     UIButton *buttonnn=[UIButton buttonWithType:UIButtonTypeSystem];
     [buttonnn setTitle:@"男" forState:0];
     [buttonnn addTarget:self action:@selector(buttonnnAction:) forControlEvents:UIControlEventTouchUpInside];
     buttonnn.backgroundColor=[UIColor colorWithRed:212/255.0 green:197/255.0 blue:181/255.0 alpha:1];
     buttonnn.frame=CGRectMake(0, 0, 80, 40);
     [viewa addSubview:buttonnn];
     
     UIButton *buttonnv=[UIButton buttonWithType:UIButtonTypeSystem];
     [buttonnv setTitle:@"女" forState:0];
     buttonnv.backgroundColor=[UIColor colorWithRed:212/255.0 green:197/255.0 blue:181/255.0 alpha:1];
     [buttonnv addTarget:self action:@selector(buttonnvAction:) forControlEvents:UIControlEventTouchUpInside];
     buttonnv.frame=CGRectMake(0, 40, 80, 40);
     [viewa addSubview:buttonnv];
}
-(void)buttonnnAction:(UIButton *)sender{
     labera.text=@"男";
     [viewa removeFromSuperview];
}
-(void)buttonnvAction:(UIButton *)sender{
     labera.text=@"女";
     [viewa removeFromSuperview];
}
-(void)uibuttonbAction:(UIButton *)sender{
     [viewa removeFromSuperview];
     [viewc removeFromSuperview];
     [viewd removeFromSuperview];
          viewb=[[UIView alloc]initWithFrame:CGRectMake(110, SCREEN_HEIGHT-160, 80, 80)];
          [self.view addSubview:viewb];
     UIButton *buttonno=[UIButton buttonWithType:UIButtonTypeSystem];
     [buttonno setTitle:@"1~10" forState:0];
     [buttonno addTarget:self action:@selector(buttonnoAction:) forControlEvents:UIControlEventTouchUpInside];
     buttonno.backgroundColor=[UIColor colorWithRed:212/255.0 green:197/255.0 blue:181/255.0 alpha:1];
     buttonno.frame=CGRectMake(0, 0, 80, 40);
     [viewb addSubview:buttonno];
     
     UIButton *buttonnt=[UIButton buttonWithType:UIButtonTypeSystem];
     [buttonnt setTitle:@"11~20" forState:0];
     buttonnt.backgroundColor=[UIColor colorWithRed:212/255.0 green:197/255.0 blue:181/255.0 alpha:1];
     [buttonnt addTarget:self action:@selector(buttonntAction:) forControlEvents:UIControlEventTouchUpInside];
     buttonnt.frame=CGRectMake(0, 40, 80, 40);
     [viewb addSubview:buttonnt];

     
     
}
-(void)buttonnoAction:(UIButton *)sender{
     [viewd removeFromSuperview];
     viewc=[[UIView alloc]initWithFrame:CGRectMake(190, SCREEN_HEIGHT-280, 80, 200)];
     [self.view addSubview:viewc];
     UIButton *buttonn1=[UIButton buttonWithType:UIButtonTypeSystem];
     [buttonn1 setTitle:@"1" forState:0];
     [buttonn1 addTarget:self action:@selector(buttonsuperAction:) forControlEvents:UIControlEventTouchUpInside];
     buttonn1.backgroundColor=[UIColor colorWithRed:225/255.0 green:215/255.0 blue:204/255.0 alpha:1];
     buttonn1.frame=CGRectMake(0, 0, 80, 20);
     buttonn1.tag=101;
     [viewc addSubview:buttonn1];
     
     UIButton *buttonn2=[UIButton buttonWithType:UIButtonTypeSystem];
     [buttonn2 setTitle:@"2" forState:0];
     buttonn2.backgroundColor=[UIColor colorWithRed:225/255.0 green:215/255.0 blue:204/255.0 alpha:1];
     [buttonn2 addTarget:self action:@selector(buttonsuperAction:) forControlEvents:UIControlEventTouchUpInside];
     buttonn2.tag=102;
     buttonn2.frame=CGRectMake(0, 20, 80, 20);
     [viewc addSubview:buttonn2];
     
     UIButton *buttonn3=[UIButton buttonWithType:UIButtonTypeSystem];
     [buttonn3 setTitle:@"3" forState:0];
     buttonn3.backgroundColor=[UIColor colorWithRed:225/255.0 green:215/255.0 blue:204/255.0 alpha:1];
     [buttonn3 addTarget:self action:@selector(buttonsuperAction:) forControlEvents:UIControlEventTouchUpInside];
     buttonn3.tag=103;
     buttonn3.frame=CGRectMake(0, 40, 80, 20);
     [viewc addSubview:buttonn3];
     
     UIButton *buttonn4=[UIButton buttonWithType:UIButtonTypeSystem];
     [buttonn4 setTitle:@"4" forState:0];
     buttonn4.backgroundColor=[UIColor colorWithRed:225/255.0 green:215/255.0 blue:204/255.0 alpha:1];
     [buttonn4 addTarget:self action:@selector(buttonsuperAction:) forControlEvents:UIControlEventTouchUpInside];
     buttonn4.tag=104;
     buttonn4.frame=CGRectMake(0, 60, 80, 20);
     [viewc addSubview:buttonn4];
     
     UIButton *buttonn5=[UIButton buttonWithType:UIButtonTypeSystem];
     [buttonn5 setTitle:@"5" forState:0];
     buttonn5.backgroundColor=[UIColor colorWithRed:225/255.0 green:215/255.0 blue:204/255.0 alpha:1];
     [buttonn5 addTarget:self action:@selector(buttonsuperAction:) forControlEvents:UIControlEventTouchUpInside];
     buttonn5.tag=105;
     buttonn5.frame=CGRectMake(0, 80, 80, 20);
     [viewc addSubview:buttonn5];
     
     UIButton *buttonn6=[UIButton buttonWithType:UIButtonTypeSystem];
     [buttonn6 setTitle:@"6" forState:0];
     buttonn6.backgroundColor=[UIColor colorWithRed:225/255.0 green:215/255.0 blue:204/255.0 alpha:1];
     [buttonn6 addTarget:self action:@selector(buttonsuperAction:) forControlEvents:UIControlEventTouchUpInside];
     buttonn6.tag=106;
     buttonn6.frame=CGRectMake(0, 100, 80, 20);
     [viewc addSubview:buttonn6];
     
     UIButton *buttonn7=[UIButton buttonWithType:UIButtonTypeSystem];
     [buttonn7 setTitle:@"7" forState:0];
     buttonn7.backgroundColor=[UIColor colorWithRed:225/255.0 green:215/255.0 blue:204/255.0 alpha:1];
     [buttonn7 addTarget:self action:@selector(buttonsuperAction:) forControlEvents:UIControlEventTouchUpInside];
     buttonn7.tag=107;
     buttonn7.frame=CGRectMake(0, 120, 80, 20);
     [viewc addSubview:buttonn7];
     
     UIButton *buttonn8=[UIButton buttonWithType:UIButtonTypeSystem];
     [buttonn8 setTitle:@"8" forState:0];
     buttonn8.backgroundColor=[UIColor colorWithRed:225/255.0 green:215/255.0 blue:204/255.0 alpha:1];
     [buttonn8 addTarget:self action:@selector(buttonsuperAction:) forControlEvents:UIControlEventTouchUpInside];
     buttonn8.frame=CGRectMake(0, 140, 80, 20);
     buttonn8.tag=108;
     [viewc addSubview:buttonn8];
     
     UIButton *buttonn9=[UIButton buttonWithType:UIButtonTypeSystem];
     [buttonn9 setTitle:@"9" forState:0];
     buttonn9.backgroundColor=[UIColor colorWithRed:225/255.0 green:215/255.0 blue:204/255.0 alpha:1];
     [buttonn9 addTarget:self action:@selector(buttonsuperAction:) forControlEvents:UIControlEventTouchUpInside];
     buttonn9.tag=109;
     buttonn9.frame=CGRectMake(0, 160, 80, 20);
     [viewc addSubview:buttonn9];
     
     UIButton *buttonn10=[UIButton buttonWithType:UIButtonTypeSystem];
     buttonn10.tag=110;
     [buttonn10 setTitle:@"10" forState:0];
     buttonn10.backgroundColor=[UIColor colorWithRed:225/255.0 green:215/255.0 blue:204/255.0 alpha:1];
     [buttonn10 addTarget:self action:@selector(buttonsuperAction:) forControlEvents:UIControlEventTouchUpInside];
     buttonn10.frame=CGRectMake(0, 180, 80, 20);
     [viewc addSubview:buttonn10];
   
}
-(void)buttonsuperAction:(UIButton *)sender{
     if (sender.tag ==101) {
          laberb.text=@"1";
          [viewa removeFromSuperview];
          [viewb removeFromSuperview];
          [viewc removeFromSuperview];
          [viewd removeFromSuperview];
     }else if (sender.tag ==102){
          laberb.text=@"2";
          [viewa removeFromSuperview];
          [viewb removeFromSuperview];
          [viewc removeFromSuperview];
          [viewd removeFromSuperview];
     }else if (sender.tag ==103){
          laberb.text=@"3";
          [viewa removeFromSuperview];
          [viewb removeFromSuperview];
          [viewc removeFromSuperview];
          [viewd removeFromSuperview];
     }else if (sender.tag ==104){
          laberb.text=@"4";
          [viewa removeFromSuperview];
          [viewb removeFromSuperview];
          [viewc removeFromSuperview];
          [viewd removeFromSuperview];
     }else if (sender.tag ==105){
          laberb.text=@"5";
          [viewa removeFromSuperview];
          [viewb removeFromSuperview];
          [viewc removeFromSuperview];
          [viewd removeFromSuperview];
     }else if (sender.tag ==106){
          laberb.text=@"6";
          [viewa removeFromSuperview];
          [viewb removeFromSuperview];
          [viewc removeFromSuperview];
          [viewd removeFromSuperview];
     }else if (sender.tag ==107){
          laberb.text=@"7";
          [viewa removeFromSuperview];
          [viewb removeFromSuperview];
          [viewc removeFromSuperview];
          [viewd removeFromSuperview];
     }else if (sender.tag ==108){
          laberb.text=@"8";
          [viewa removeFromSuperview];
          [viewb removeFromSuperview];
          [viewc removeFromSuperview];
          [viewd removeFromSuperview];
     }else if (sender.tag ==109){
          laberb.text=@"9";
          [viewa removeFromSuperview];
          [viewb removeFromSuperview];
          [viewc removeFromSuperview];
          [viewd removeFromSuperview];
     }else if (sender.tag ==110){
          laberb.text=@"10";
          [viewa removeFromSuperview];
          [viewb removeFromSuperview];
          [viewc removeFromSuperview];
          [viewd removeFromSuperview];
     }else if (sender.tag==111){
          laberb.text=@"11";
          [viewa removeFromSuperview];
          [viewb removeFromSuperview];
          [viewc removeFromSuperview];
          [viewd removeFromSuperview];
     }else if (sender.tag ==112){
          laberb.text=@"12";
          [viewa removeFromSuperview];
          [viewb removeFromSuperview];
          [viewc removeFromSuperview];
          [viewd removeFromSuperview];
     }else if (sender.tag ==113){
          laberb.text=@"13";
          [viewa removeFromSuperview];
          [viewb removeFromSuperview];
          [viewc removeFromSuperview];
          [viewd removeFromSuperview];
     }else if (sender.tag ==114){
          laberb.text=@"14";
          [viewa removeFromSuperview];
          [viewb removeFromSuperview];
          [viewc removeFromSuperview];
          [viewd removeFromSuperview];
     }else if (sender.tag ==115){
          laberb.text=@"15";
          [viewa removeFromSuperview];
          [viewb removeFromSuperview];
          [viewc removeFromSuperview];
          [viewd removeFromSuperview];
     }else if (sender.tag ==116){
          laberb.text=@"16";
          [viewa removeFromSuperview];
          [viewb removeFromSuperview];
          [viewc removeFromSuperview];
          [viewd removeFromSuperview];
     }else if (sender.tag ==117){
          laberb.text=@"17";
          [viewa removeFromSuperview];
          [viewb removeFromSuperview];
          [viewc removeFromSuperview];
          [viewd removeFromSuperview];
     }else if (sender.tag ==118){
          laberb.text=@"18";
          [viewa removeFromSuperview];
          [viewb removeFromSuperview];
          [viewc removeFromSuperview];
          [viewd removeFromSuperview];
     }else if (sender.tag ==119){
          laberb.text=@"19";
          [viewa removeFromSuperview];
          [viewb removeFromSuperview];
          [viewc removeFromSuperview];
          [viewd removeFromSuperview];
     }else if (sender.tag ==120){
          laberb.text=@"20";
          [viewa removeFromSuperview];
          [viewb removeFromSuperview];
          [viewc removeFromSuperview];
          [viewd removeFromSuperview];
     }

}
-(void)buttonntAction:(UIButton *)sender{
     [viewc removeFromSuperview];
          viewd=[[UIView alloc]initWithFrame:CGRectMake(190, SCREEN_HEIGHT-280, 80, 200)];
     [self.view addSubview:viewd];
     UIButton *buttonn1=[UIButton buttonWithType:UIButtonTypeSystem];
     [buttonn1 setTitle:@"11" forState:0];
     [buttonn1 addTarget:self action:@selector(buttonsuperAction:) forControlEvents:UIControlEventTouchUpInside];
     buttonn1.backgroundColor=[UIColor colorWithRed:225/255.0 green:215/255.0 blue:204/255.0 alpha:1];
     buttonn1.frame=CGRectMake(0, 0, 80, 20);
     buttonn1.tag=101;
     [viewd addSubview:buttonn1];
     
     UIButton *buttonn2=[UIButton buttonWithType:UIButtonTypeSystem];
     [buttonn2 setTitle:@"12" forState:0];
     buttonn2.backgroundColor=[UIColor colorWithRed:225/255.0 green:215/255.0 blue:204/255.0 alpha:1];
     [buttonn2 addTarget:self action:@selector(buttonsuperAction:) forControlEvents:UIControlEventTouchUpInside];
     buttonn2.tag=112;
     buttonn2.frame=CGRectMake(0, 20, 80, 20);
     [viewd addSubview:buttonn2];
     
     UIButton *buttonn3=[UIButton buttonWithType:UIButtonTypeSystem];
     [buttonn3 setTitle:@"13" forState:0];
     buttonn3.backgroundColor=[UIColor colorWithRed:225/255.0 green:215/255.0 blue:204/255.0 alpha:1];
     [buttonn3 addTarget:self action:@selector(buttonsuperAction:) forControlEvents:UIControlEventTouchUpInside];
     buttonn3.tag=113;
     buttonn3.frame=CGRectMake(0, 40, 80, 20);
     [viewd addSubview:buttonn3];
     
     UIButton *buttonn4=[UIButton buttonWithType:UIButtonTypeSystem];
     [buttonn4 setTitle:@"14" forState:0];
     buttonn4.backgroundColor=[UIColor colorWithRed:225/255.0 green:215/255.0 blue:204/255.0 alpha:1];
     [buttonn4 addTarget:self action:@selector(buttonsuperAction:) forControlEvents:UIControlEventTouchUpInside];
     buttonn4.tag=114;
     buttonn4.frame=CGRectMake(0, 60, 80, 20);
     [viewd addSubview:buttonn4];
     
     UIButton *buttonn5=[UIButton buttonWithType:UIButtonTypeSystem];
     [buttonn5 setTitle:@"15" forState:0];
     buttonn5.backgroundColor=[UIColor colorWithRed:225/255.0 green:215/255.0 blue:204/255.0 alpha:1];
     [buttonn5 addTarget:self action:@selector(buttonsuperAction:) forControlEvents:UIControlEventTouchUpInside];
     buttonn5.tag=115;
     buttonn5.frame=CGRectMake(0, 80, 80, 20);
     [viewd addSubview:buttonn5];
     
     UIButton *buttonn6=[UIButton buttonWithType:UIButtonTypeSystem];
     [buttonn6 setTitle:@"16" forState:0];
     buttonn6.backgroundColor=[UIColor colorWithRed:225/255.0 green:215/255.0 blue:204/255.0 alpha:1];
     [buttonn6 addTarget:self action:@selector(buttonsuperAction:) forControlEvents:UIControlEventTouchUpInside];
     buttonn6.tag=116;
     buttonn6.frame=CGRectMake(0, 100, 80, 20);
     [viewd addSubview:buttonn6];
     
     UIButton *buttonn7=[UIButton buttonWithType:UIButtonTypeSystem];
     [buttonn7 setTitle:@"17" forState:0];
     buttonn7.backgroundColor=[UIColor colorWithRed:225/255.0 green:215/255.0 blue:204/255.0 alpha:1];
     [buttonn7 addTarget:self action:@selector(buttonsuperAction:) forControlEvents:UIControlEventTouchUpInside];
     buttonn7.tag=117;
     buttonn7.frame=CGRectMake(0, 120, 80, 20);
     [viewd addSubview:buttonn7];
     
     UIButton *buttonn8=[UIButton buttonWithType:UIButtonTypeSystem];
     [buttonn8 setTitle:@"18" forState:0];
     buttonn8.backgroundColor=[UIColor colorWithRed:225/255.0 green:215/255.0 blue:204/255.0 alpha:1];
     [buttonn8 addTarget:self action:@selector(buttonsuperAction:) forControlEvents:UIControlEventTouchUpInside];
     buttonn8.frame=CGRectMake(0, 140, 80, 20);
     buttonn8.tag=118;
     [viewd addSubview:buttonn8];
     
     UIButton *buttonn9=[UIButton buttonWithType:UIButtonTypeSystem];
     [buttonn9 setTitle:@"19" forState:0];
     buttonn9.backgroundColor=[UIColor colorWithRed:225/255.0 green:215/255.0 blue:204/255.0 alpha:1];
     [buttonn9 addTarget:self action:@selector(buttonsuperAction:) forControlEvents:UIControlEventTouchUpInside];
     buttonn9.tag=119;
     buttonn9.frame=CGRectMake(0, 160, 80, 20);
     [viewd addSubview:buttonn9];
     
     UIButton *buttonn10=[UIButton buttonWithType:UIButtonTypeSystem];
     buttonn10.tag=120;
     [buttonn10 setTitle:@"20" forState:0];
     buttonn10.backgroundColor=[UIColor colorWithRed:225/255.0 green:215/255.0 blue:204/255.0 alpha:1];
     [buttonn10 addTarget:self action:@selector(buttonsuperAction:) forControlEvents:UIControlEventTouchUpInside];
     buttonn10.frame=CGRectMake(0, 180, 80, 20);
     [viewd addSubview:buttonn10];

}
-(void)uibuttoncAction:(UIButton *)sender{
     
}
-(void)addbody{
     self.textView =[[UITextView alloc]initWithFrame:CGRectMake(10, 70, SCREEN_WIDTH-20, SCREEN_HEIGHT-150)];
     self.textView.textColor=[UIColor lightGrayColor];
     self.textView.text=APPIRATER;
     self.textView.selectedRange=NSMakeRange(0,0) ;
     self.textView.font=[UIFont systemFontOfSize:25];
     self.textView.delegate=self;
     [self.view addSubview:self.textView];
     UIImageView *aimage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 390, (SCREEN_HEIGHT-100))];
     aimage.image=[UIImage imageNamed:@"fankuikuang"];
     [self.textView addSubview:aimage];
     
}
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString*)text
{
     if (![text isEqualToString:@""]&&textView.textColor==[UIColor lightGrayColor])
     {
          textView.text=@"";
          textView.textColor=[UIColor blackColor];
     }
     
     if ([text isEqualToString:@"\n"])
     {
          if ([textView.text isEqualToString:@""])
          {
               textView.textColor=[UIColor lightGrayColor];
               textView.text=APPIRATER;
          }
          [textView resignFirstResponder];
          return NO;
     }
     return YES;
}

- (void)textViewDidChange:(UITextView *)textView
{
     if ([textView.text isEqualToString:@""])
     {
          textView.text=APPIRATER;
           textView.textColor=[UIColor lightGrayColor];
     }
}
-(void)addNaigation{
     self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"return"]  style:UIBarButtonItemStylePlain target:self action:@selector(backAction:)];
     self.navigationItem.leftBarButtonItem.tintColor=[UIColor whiteColor];
     
     
     UILabel *laber=[[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-60)/2, 20, 60, 50)];
     laber.text=@"意见反馈";
     laber.font=[UIFont systemFontOfSize:35];
     laber.textAlignment=NSTextAlignmentCenter;
     laber.textColor=[UIColor whiteColor];
     self.navigationItem.titleView=laber;
     
     self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:136/255.0 green:40/255.0 blue:40/255.0 alpha:1];
     
     self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"magnifier"]  style:UIBarButtonItemStylePlain target:self action:@selector(backAction:)];
     self.navigationItem.rightBarButtonItem.tintColor=[UIColor whiteColor];
     imageviewa=[[UIImageView alloc]initWithFrame:self.view.frame];
     imageviewa.image=[UIImage imageNamed:@"beijing"];
     [self.view addSubview:imageviewa];
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
