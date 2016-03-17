//
//  CMartshows.h
//
//  Created by zgt  on 16/3/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface CMartshows : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *mjIcon;
@property (nonatomic, assign) double gmtBegin;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double mid;
@property (nonatomic, strong) NSString *gmtEnd;
@property (nonatomic, strong) NSString *mjPromotion;
@property (nonatomic, strong) NSString *brand;
@property (nonatomic, strong) NSString *buyingInfo;
@property (nonatomic, assign) double discount;
@property (nonatomic, assign) double stock;
@property (nonatomic, strong) NSString *brandStory;
@property (nonatomic, assign) double brandId;
@property (nonatomic, strong) NSString *sellerTitle;
@property (nonatomic, strong) NSArray *customLabelImgPosition;
@property (nonatomic, assign) double eventId;
@property (nonatomic, strong) NSString *mainImg;
@property (nonatomic, strong) NSString *promotion;
@property (nonatomic, assign) double itemCount;
@property (nonatomic, strong) NSString *logo;
@property (nonatomic, strong) NSString *customLabelImg;
@property (nonatomic, strong) NSArray *msItems;
@property (nonatomic, assign) double bid;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
