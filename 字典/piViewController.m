//
//  piViewController.m
//  字典
//
//  Created by Ibokan on 16/7/24.
//  Copyright © 2016年 tanzhongyi. All rights reserved.
//
#import "sqlite3.h"
#import "piViewController.h"
#import "piModel.h"
#import "collerctionTableViewController.h"
#define kDatabaseName @"database.sqlite3"
#import "piTableViewCell.h"
@interface piViewController ()<UITableViewDelegate,UITableViewDataSource>
{
     
     int index;
     NSMutableArray *array;
     NSMutableArray *iptarray;
     NSMutableArray *aaa;
}
@property(nonatomic,assign)int parameter;
@end

@implementation piViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     
     _arr = [NSArray arrayWithObjects:@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z" ,nil];
     UITableView *mytableview=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
     mytableview.delegate=self;
     mytableview.dataSource=self;
     [self.view addSubview:mytableview];
     mytableview.rowHeight=100;
     
     [mytableview registerNib:[UINib nibWithNibName:@"piTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:  NSStringFromClass([piTableViewCell class])];
     [self findall];
     [self findIntercept];
     _parameter =_receive;
     if (_parameter ==8 || _parameter == 21 ) {
          _parameter++;
          NSIndexPath *indexPath =[NSIndexPath indexPathForRow:0 inSection:_parameter];
          [mytableview scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:NO];
     }else if (_parameter ==20){
          _parameter = 22;
          NSIndexPath *indexPath =[NSIndexPath indexPathForRow:0 inSection:_parameter];
          [mytableview scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:NO];
     }else{
          NSIndexPath *indexPath =[NSIndexPath indexPathForRow:0 inSection:_parameter];
          [mytableview scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:NO];
     }

}
-(void)findIntercept{
     iptarray =[NSMutableArray array];
     for (int i= 0; i<26; i++) {
          index = 0;
          aaa=[NSMutableArray array];
          for (piModel *pim in array) {
               index++;
               if (index<=26) {
                    continue;
               }
               if ([pim.pititle hasPrefix:_arr[i]]) {
                    [aaa addObject:pim.pititle];
               }
          }
          [iptarray addObject:aaa];
     }
}
-(void)findall{
     NSBundle *mainBundle=[NSBundle mainBundle];
     NSString *path=[mainBundle pathForResource:@"aaaaa2.sqlite" ofType:nil];
     sqlite3 *db;
     array=[NSMutableArray array];
     sqlite3_open(path.UTF8String, &db);
     NSString *sql=@"select  *from ol_pinyins";
     sqlite3_stmt *stmt;
     if (sqlite3_prepare_v2(db,sql.UTF8String,-1,&stmt,NULL)==SQLITE_OK) {
       while (sqlite3_step(stmt)==SQLITE_ROW) {
               piModel *pi=[piModel new];
               pi.piid=sqlite3_column_int(stmt,0);
               pi.pititle=[NSString stringWithCString:(char *)sqlite3_column_text(stmt, 1) encoding:4];
               [array addObject:pi];
          }
 
     }
     sqlite3_finalize(stmt);
     sqlite3_close(db);
     
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
     NSArray *arraa= iptarray[section];
     return arraa.count;
     //行数
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
     return _arr.count;
     //分区数
}

-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
     return self.arr;
     //索引栏
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
     return 44;
     //分区高度
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//     NSMutableArray *dataArr=[NSMutableArray arrayWithObjects:iptarray[indexPath.section][indexPath.row], nil];
     collerctionTableViewController *cttvc=[collerctionTableViewController new];
     cttvc.treatment=iptarray[indexPath.section][indexPath.row]
     ;
     cttvc.superBool=NO;
     NSLog(@"%@",iptarray[indexPath.section][indexPath.row]);
     
     [self.navigationController pushViewController:cttvc animated:YES];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
     return _arr[section];
     //分区标题
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     piTableViewCell *cell=(piTableViewCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([piTableViewCell class])];
     
          cell.pititle.text=iptarray[indexPath.section][indexPath.row];
     cell.pititle.adjustsFontSizeToFitWidth=YES;
     return cell;
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
