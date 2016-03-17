//
//  SSubdivisionCategorys.h
//
//  Created by zgt  on 16/3/10
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SSubdivisionCategorys : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *flag;
@property (nonatomic, strong) NSString *data;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *target;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
