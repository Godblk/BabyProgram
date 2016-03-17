//
//  RUserInfo.h
//
//  Created by zgt  on 16/3/12
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface RUserInfo : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *avatar;
@property (nonatomic, strong) NSString *uid;
@property (nonatomic, assign) double verificationType;
@property (nonatomic, strong) NSString *nick;
@property (nonatomic, assign) double isFollowed;
@property (nonatomic, strong) NSString *verificationText;
@property (nonatomic, strong) NSString *userType;
@property (nonatomic, strong) NSString *mallText;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
