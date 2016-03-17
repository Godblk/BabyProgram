//
//  SMainCategorys.h
//
//  Created by zgt  on 16/3/10
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SMainCategorys : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *categoryName;
@property (nonatomic, strong) NSArray *blocks;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
