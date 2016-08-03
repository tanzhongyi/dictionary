//
//  bsViewController.m
//  字典
//
//  Created by Ibokan on 16/7/24.
//  Copyright © 2016年 tanzhongyi. All rights reserved.
//

#import "bsViewController.h"
#import "bihuaModdel.h"
#import "sqlite3.h"
#import "collerctionTableViewController.h"
#define kDatabaseName @"database.sqlite3"
#import "bsTableViewCell.h"
@interface bsViewController ()<UITableViewDelegate,UITableViewDataSource>{
     NSMutableArray *array;
     NSMutableArray *array1;
     NSMutableArray *array2;
     NSMutableArray *strokearr;
     
     int index;
}
@property(nonatomic,strong)NSMutableArray *arr;
@property(nonatomic,strong)NSMutableArray *idarr;
@end

@implementation bsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     
     UITableView *myUitableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
     myUitableView.delegate=self;
     myUitableView.dataSource=self;
     [self.view addSubview:myUitableView];
     myUitableView.rowHeight=100;
     myUitableView.separatorColor=[UIColor cyanColor];
     _arr = [NSMutableArray arrayWithObjects:@"第一画",@"第二画",@"第三画",@"第四画",@"第五画",@"第六画",@"第七画",@"第八画",@"第九画",@"第十画",@"第十一画",@"第十二画",@"第十三画",@"第十四画",@"第十五画",@"第十六画",@"第十七画", nil];
     _idarr = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17", nil];
     
     //向缓存池注册cell
     [myUitableView registerNib:[UINib nibWithNibName:@"bsTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([bsTableViewCell class])];
     [self findall];
     [self findbsarray];
     NSLog(@"部首 是%d",(int)_receive);
     NSIndexPath *indexPath =[NSIndexPath indexPathForRow:0 inSection:(int)_receive];
     [myUitableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:NO];
     
}
-(void)findbsarray{
     array1=[NSMutableArray array];
     for (int i =0; i<17; i++) {
          strokearr=[NSMutableArray array];
          for (bihuaModdel *bi in array) {
               
               if (bi.bhshu == i+1) {
                    [strokearr addObject:bi.bhtitle];
               }
          }
          [array1 addObject:strokearr];
     }
     array2=[NSMutableArray array];
     for (int i =0; i<17; i++) {
          strokearr=[NSMutableArray array];
          for (bihuaModdel *bi in array) {
               
               if (bi.bhshu == i+1) {
                    [strokearr addObject:[NSString stringWithFormat:@"%d",bi.bhid]];
               }
          }
          [array2 addObject:strokearr];
     }
}

-(NSArray *)findall{
     NSBundle *mainBundle=[NSBundle mainBundle];
     NSString *path=[mainBundle pathForResource:@"aaaaa2.sqlite" ofType:nil];
     sqlite3 *db;
     array=[NSMutableArray array];
     sqlite3_open(path.UTF8String, &db);
     NSString *sql=@"select * from ol_bushou";
          sqlite3_stmt *stmt;
     if (sqlite3_prepare_v2(db, sql.UTF8String, -1, &stmt, NULL)==SQLITE_OK) {
          while (sqlite3_step(stmt)==SQLITE_ROW) {
               bihuaModdel *bh=[bihuaModdel new];
               bh.bhid=sqlite3_column_int(stmt, 0);
               bh.bhshu=sqlite3_column_int(stmt, 1);
               bh.bhtitle=[NSString stringWithCString:(char *)sqlite3_column_text(stmt, 2) encoding:4];
               [array addObject:bh];
               //
          }
     }
     sqlite3_finalize(stmt);
     sqlite3_close(db);
     return array;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
     NSArray *arraa=array1[section];
     return arraa.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
     return _idarr.count;
}
-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
     return _idarr;
     
     
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
     return 55;
     
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
     return _arr[section];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

     bsTableViewCell *cell=(bsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([bsTableViewCell class])];
     ;
     
     
     cell.bhtitle.text=array1[indexPath.section][indexPath.row];
     
     
     return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
     collerctionTableViewController *coll=[collerctionTableViewController new];
     coll.treatment=array2[indexPath.section][indexPath.row];
     NSLog(@"sdadsadsa%@",array2[indexPath.section][indexPath.row]);
     coll.superBool=YES;
     [self.navigationController pushViewController:coll animated:YES];
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
