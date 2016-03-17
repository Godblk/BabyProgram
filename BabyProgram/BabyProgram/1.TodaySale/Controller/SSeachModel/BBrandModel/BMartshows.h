//
//  BMartshows.h
//
//  Created by zgt  on 16/3/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface BMartshows : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *eventType;
@property (nonatomic, assign) double mid;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double eventId;
@property (nonatomic, strong) NSString *mjPromotion;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
