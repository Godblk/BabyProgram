//
//  CMsItems.h
//
//  Created by zgt  on 16/3/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface CMsItems : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *img;
@property (nonatomic, assign) double priceOri;
@property (nonatomic, assign) double price;
@property (nonatomic, assign) double iid;
@property (nonatomic, strong) NSString *title;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
