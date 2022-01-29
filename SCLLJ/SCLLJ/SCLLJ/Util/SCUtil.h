//
//  SCUtil.h
//  SCLLJ
//
//  Created by 刘林杰 on 2022/1/27.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SCUtil : NSObject

/**
    十六进制颜色
 */
+ (UIColor *)colorWithHexString:(NSString *)color;
/**
 *  获取path路径下文件夹的大小
 *  @param path 要获取的文件夹 路径
 *  @return 返回path路径下文件夹的大小
 */
+ (NSString *)getCacheSizeWithFilePath:(NSString *)path;
/**
 *  清除path路径下文件夹的缓存
 *  @param path  要清除缓存的文件夹 路径
 *
 */
+ (void)clearCacheWithFilePath:(NSString *)path;

+ (void)showTextOnly:(NSString *)text;

@end

NS_ASSUME_NONNULL_END
