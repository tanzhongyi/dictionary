//
//  moreViewController.m
//  字典
//
//  Created by Ibokan on 16/7/19.
//  Copyright © 2016年 tanzhongyi. All rights reserved.
//

#import "moreViewController.h"
#import "more.h"
#import "MoreTableViewCell.h"
#import "SharingViewController.h"
#import "CommentViewController.h"
#import "BoutiqueTableViewController.h"
#import "MarkingTableViewController.h"
#import "AboutViewController.h"
#import "CollectTableViewController.h"

@interface moreViewController ()<UITableViewDelegate,UITableViewDataSource>
{
     UIImageView *imageView;
     NSMutableArray *dataSoure;
}
@end

@implementation moreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     [self addNaigation];
     UITableView *myUitableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
     myUitableView.delegate=self;
     myUitableView.dataSource=self;
     [self.view addSubview:myUitableView];
     myUitableView.rowHeight=88;
     myUitableView.separatorColor=[UIColor cyanColor];
     self.edgesForExtendedLayout=UIRectEdgeNone;
     
     
     
     [myUitableView registerNib:[UINib nibWithNibName:@"MoreTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([MoreTableViewCell class])];
     
     
     [self initData];

}
-(void)initData{
     dataSoure=[NSMutableArray array];
     NSArray *dataArray=@[@"我的收藏",@"分享",@"意见反馈",@"精品应用",@"应用打分",@"关于我们"];
     for (int i= 0; i<6; i++) {
          more *mm=[more new];
          mm.name=dataArray[i];
          
          [dataSoure addObject:mm];
          
     }
     
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
     return dataSoure.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     MoreTableViewCell *cell=(MoreTableViewCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MoreTableViewCell class])];
     
     more *mm=dataSoure[indexPath.row];
     cell.moreName.text=mm.name;
     cell.moreImage.image=[UIImage imageNamed:@"continue"];
     return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
     switch (indexPath.row) {
          case 0:{
               CollectTableViewController *ctvc=[CollectTableViewController new];
               [self.navigationController pushViewController:ctvc animated:YES];
          }
               break;
          case 1:{
               SharingViewController *stvc=[SharingViewController new];
               [self.navigationController pushViewController:stvc animated:YES];
          }
               break;
          case 2:{
               CommentViewController *ctc=[CommentViewController new];
               [self.navigationController pushViewController:ctc animated:YES];
          }
               break;
          case 3:{
               BoutiqueTableViewController *btvc=[BoutiqueTableViewController new];
               [self.navigationController pushViewController:btvc animated:YES];
          }
               break;
          case 4:{
               MarkingTableViewController *mtvc=[MarkingTableViewController new];
               [self.navigationController pushViewController:mtvc animated:YES];
          }
               break;
          case 5:{
               AboutViewController *atvc=[AboutViewController new];
               [self.navigationController pushViewController:atvc animated:YES];
          }
               break;
          default:
               break;
     }
}
-(void)addNaigation{
     
     
     self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"return"]  style:UIBarButtonItemStylePlain target:self action:@selector(backAction:)];
     self.navigationItem.leftBarButtonItem.tintColor=[UIColor whiteColor];
     self.navigationItem.title=@"辞海";
     self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:136/255.0 green:40/255.0 blue:40/255.0 alpha:1];
     imageView=[[UIImageView alloc]initWithFrame:self.view.frame];
     imageView.image=[UIImage imageNamed:@"beijing"];
     [self.view addSubview:imageView];
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
