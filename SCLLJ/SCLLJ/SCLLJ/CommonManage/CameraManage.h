//
//  CameraManage.h
//  steps
//
//  Created by 刘林杰 on 2019/10/12.
//  Copyright © 2019 llj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>

NS_ASSUME_NONNULL_BEGIN

@interface CameraManage : NSObject<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, strong) UIImagePickerController *imagePickerController;
@property (nonatomic, copy) void(^selectedImageBlock)(UIImage *image);

+ (id)shareInstance;
- (void)checkCameraPermission:(void(^)(BOOL success, NSError *error))compltion;
- (void)showAlertView;

@end

NS_ASSUME_NONNULL_END
