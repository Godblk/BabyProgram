//
//  BMsNames.h
//
//  Created by zgt  on 16/3/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface BMsNames : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double showNum;
@property (nonatomic, strong) NSString *brand;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSString *pinyin;
@property (nonatomic, assign) double bid;
@property (nonatomic, strong) NSArray *martshows;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
