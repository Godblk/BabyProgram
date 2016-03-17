//
//  CChildrenModel.h
//
//  Created by zgt  on 16/3/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface CChildrenModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double mainImgWidth;
@property (nonatomic, assign) double mainImgHeight;
@property (nonatomic, strong) NSString *todayTipSubtitle;
@property (nonatomic, strong) NSString *todayTipTitle;
@property (nonatomic, strong) NSString *tag;
@property (nonatomic, assign) double count;
@property (nonatomic, strong) NSArray *martshows;
@property (nonatomic, assign) double page;
@property (nonatomic, assign) double pageSize;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
