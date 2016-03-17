//
//  SSeachModel.h
//
//  Created by zgt  on 16/3/10
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SSeachModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) BOOL success;
@property (nonatomic, assign) BOOL hiddenSearchBar;
@property (nonatomic, strong) NSString *searchTip;
@property (nonatomic, strong) NSArray *mainCategorys;
@property (nonatomic, strong) NSString *keyword;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
