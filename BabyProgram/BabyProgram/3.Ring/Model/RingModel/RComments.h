//
//  RComments.h
//
//  Created by zgt  on 16/3/12
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface RComments : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double commentsIdentifier;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *uid;
@property (nonatomic, strong) NSString *parentUid;
@property (nonatomic, assign) double parentId;
@property (nonatomic, assign) double gmtCreate;
@property (nonatomic, assign) double type;
@property (nonatomic, assign) double correlationId;
@property (nonatomic, strong) NSArray *nicks;
@property (nonatomic, assign) double gmtModified;
@property (nonatomic, assign) double reviewStatus;
@property (nonatomic, assign) double status;
@property (nonatomic, assign) double correlationType;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
