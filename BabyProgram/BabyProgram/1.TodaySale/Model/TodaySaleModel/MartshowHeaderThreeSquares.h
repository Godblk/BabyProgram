//
//  MartshowHeaderThreeSquares.h
//
//  Created by zgt  on 16/3/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MartshowHeaderThreeSquares : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *buyingInfo;
@property (nonatomic, assign) double login;
@property (nonatomic, assign) double rid;
@property (nonatomic, assign) double priority;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *ver;
@property (nonatomic, strong) NSString *target;
@property (nonatomic, assign) double sid;
@property (nonatomic, assign) double endProperty;
@property (nonatomic, assign) double begin;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
