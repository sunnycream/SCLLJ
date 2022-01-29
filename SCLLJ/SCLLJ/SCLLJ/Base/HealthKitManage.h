//
//  HealthKitManage.h
//  steps
//
//  Created by 刘林杰 on 2019/10/11.
//  Copyright © 2019 llj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <HealthKit/HealthKit.h>
#import <UIKit/UIDevice.h>

NS_ASSUME_NONNULL_BEGIN

@interface HealthKitManage : NSObject

@property (nonatomic, strong) HKHealthStore *healthStore;

+ (id)shareInstance;
- (void)authorizeHealthKit:(void(^)(BOOL success, NSError *error))compltion;
- (void)getStepCount:(NSPredicate *)predicate completionHandler:(void(^)(double value, NSError *error))completion;
- (void)getDistance:(NSPredicate *)predicate completionHandler:(void(^)(double value, NSError *error))completion;

@end

NS_ASSUME_NONNULL_END
