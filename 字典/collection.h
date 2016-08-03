//
//  collection.h
//  字典
//
//  Created by Ibokan on 16/7/26.
//  Copyright © 2016年 tanzhongyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface collection : NSObject
@property(nonatomic,strong)NSString *bihua;
@property(nonatomic,strong)NSString *bushou;
@property(nonatomic,strong)NSString *pinyin;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *text;
@property(nonatomic,assign)float cellHeight;
@property(nonatomic,assign)int64_t weiboIUD;
@end
