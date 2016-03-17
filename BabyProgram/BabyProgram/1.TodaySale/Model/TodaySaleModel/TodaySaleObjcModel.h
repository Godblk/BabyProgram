//
//  TodaySaleObjcModel.h
//
//  Created by zgt  on 16/3/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface TodaySaleObjcModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *martshowInsertSquares;
@property (nonatomic, strong) NSArray *promotionProShortcuts;
@property (nonatomic, strong) NSArray *promotionLoopShortcuts;
@property (nonatomic, strong) NSArray *martshowHeaderTwoSquares;
@property (nonatomic, strong) NSArray *homeHtmlAds;
@property (nonatomic, strong) NSArray *topPromotionBanners;
@property (nonatomic, strong) NSArray *activityShortcuts;
@property (nonatomic, assign) double latestConfigTime;
@property (nonatomic, strong) NSArray *iconShortcuts;
@property (nonatomic, strong) NSArray *martshowHeaderBanners;
@property (nonatomic, strong) NSArray *ctcBottomPopupAds;
@property (nonatomic, strong) NSArray *popupAds;
@property (nonatomic, strong) NSArray *martshowInsertBanners;
@property (nonatomic, strong) NSArray *martshowHeaderThreeSquares;
@property (nonatomic, strong) NSArray *oldMartshowAds;
@property (nonatomic, strong) NSArray *martshowPosterBanners;
@property (nonatomic, strong) NSArray *ads;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
