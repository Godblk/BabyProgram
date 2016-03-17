//
//  SBlocks.h
//
//  Created by zgt  on 16/3/10
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SBlocks : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *blockName;
@property (nonatomic, strong) NSArray *subdivisionCategorys;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
