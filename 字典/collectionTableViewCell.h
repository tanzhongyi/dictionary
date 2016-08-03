//
//  collectionTableViewCell.h
//  字典
//
//  Created by Ibokan on 16/7/26.
//  Copyright © 2016年 tanzhongyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface collectionTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *strokeLaber;

@property (strong, nonatomic) IBOutlet UILabel *radicalLaber;
@property (strong, nonatomic) IBOutlet UILabel *pinyinLabel;
@property (strong, nonatomic) IBOutlet UILabel *titleLaber;

@end
