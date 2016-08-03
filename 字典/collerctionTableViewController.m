//
//  collerctionTableViewController.m
//  字典
//
//  Created by Ibokan on 16/8/1.
//  Copyright © 2016年 tanzhongyi. All rights reserved.
//

#import "collerctionTableViewController.h"
#import "collection.h"
#import "collectionTableViewCell.h"
@interface collerctionTableViewController ()<UITableViewDelegate,UITableViewDataSource>
{
     NSMutableArray *dataSouer;
     UITableView *myTableview;
     int index;
}
@end

@implementation collerctionTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     
     index=1;

     myTableview=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
     myTableview.delegate=self;
     myTableview.dataSource=self;
     [self.view addSubview:myTableview];
     myTableview.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"beijing"]];
     [myTableview registerNib:[UINib nibWithNibName:@"collectionTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([collectionTableViewCell class])];
     myTableview.rowHeight=80;
     [self superShow];
     
    
}
-(void)superShow{
     
     if (self.superBool) {
          [self dataradical];
     }else{
          [self dataHandling];
     }
}
-(void)dataradical{
     dataSouer=[NSMutableArray array];
     NSString *url=[NSString stringWithFormat:@"http://www.chazidian.com/service/bushou/%@/0/10",self.treatment];
     NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:url]];
     NSURLSessionConfiguration *con=[NSURLSessionConfiguration defaultSessionConfiguration];
     NSURLSession *session=[NSURLSession sessionWithConfiguration:con];
     NSURLSessionDataTask *dataTask=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
          NSError *error1;
          NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error1];
          NSDictionary *statesDic=dic[@"data"];
          NSArray *statesArr=statesDic[@"words"];
          
          
          for (NSDictionary *statesDic1 in statesArr) {
               
               collection *ctvcc=[collection new];
               
               ctvcc.text=statesDic1[@"simp"];
               ctvcc.pinyin=statesDic1[@"yin"][@"pinyin"];
               ctvcc.bihua=statesDic1[@"bushou"];
               ctvcc.bushou=statesDic1[@"num"];
               [dataSouer addObject:ctvcc];
          }
          dispatch_async(dispatch_get_main_queue(), ^{
               [myTableview reloadData];
          });
          
          
          
          
     }];
     [dataTask resume];}
-(void)dataHandling{
     dataSouer=[NSMutableArray array];
     NSString *url=[NSString stringWithFormat:@"http://www.chazidian.com/service/pinyin/%@/0/10",self.treatment];
     NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:url]];
     NSURLSessionConfiguration *con=[NSURLSessionConfiguration defaultSessionConfiguration];
     NSURLSession *session=[NSURLSession sessionWithConfiguration:con];
     NSURLSessionDataTask *dataTask=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
          NSError *error1;
          NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error1];
          NSDictionary *statesDic=dic[@"data"];
          NSArray *statesArr=statesDic[@"words"];
          
          
          for (NSDictionary *statesDic1 in statesArr) {
               
               collection *ctvcc=[collection new];
               
               ctvcc.text=statesDic1[@"simp"];
               ctvcc.pinyin=statesDic1[@"yin"][@"pinyin"];
               ctvcc.bihua=statesDic1[@"bushou"];
               ctvcc.bushou=statesDic1[@"num"];
               [dataSouer addObject:ctvcc];
          }
          dispatch_async(dispatch_get_main_queue(), ^{
               [myTableview reloadData];
          });
          
          
          
          
     }];
     [dataTask resume];}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
     return dataSouer.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     collectionTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([collectionTableViewCell class])];
     cell.backgroundColor=[UIColor clearColor];
     collection *coll=dataSouer[indexPath.row];
     cell.titleLaber.text=coll.text;
     cell.pinyinLabel.text=coll.pinyin;
     cell.radicalLaber.text=[NSString stringWithFormat:@"笔画 : %@",coll.bihua];
     cell.strokeLaber.text=[NSString stringWithFormat:@"部首 : %@",coll.bushou];
     
     
     
     return cell;
     
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
//    return 0;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
