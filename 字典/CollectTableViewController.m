//
//  CollectTableViewController.m
//  字典
//
//  Created by Ibokan on 16/7/20.
//  Copyright © 2016年 tanzhongyi. All rights reserved.
//

#import "CollectTableViewController.h"
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
@interface CollectTableViewController ()
{
     UIImageView *imageview;
}
@end

@implementation CollectTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     [self addNaigation];
     
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)addNaigation{
     self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"return"]  style:UIBarButtonItemStylePlain target:self action:@selector(backAction:)];
     self.navigationItem.leftBarButtonItem.tintColor=[UIColor whiteColor];
     
     
     UILabel *laber=[[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-60)/2, 20, 60, 50)];
     laber.text=@"我的收藏";
     laber.font=[UIFont systemFontOfSize:20];
     laber.textAlignment=NSTextAlignmentCenter;
     laber.textColor=[UIColor whiteColor];
     self.navigationItem.titleView=laber;
     
     self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:136/255.0 green:40/255.0 blue:40/255.0 alpha:1];
     imageview=[[UIImageView alloc]initWithFrame:self.view.frame];
     imageview.image=[UIImage imageNamed:@"beijing"];
     [self.view addSubview:imageview];
}
-(void)backAction:(UIButton *)sender{
     [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

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
