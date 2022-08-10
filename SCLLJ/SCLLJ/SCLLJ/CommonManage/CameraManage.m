//
//  CameraManage.m
//  steps
//
//  Created by 刘林杰 on 2019/10/12.
//  Copyright © 2019 llj. All rights reserved.
//

#import "CameraManage.h"

@implementation CameraManage

+ (id)shareInstance {
    static id manager ;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[[self class] alloc] init];
    });
    return manager;
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *image = [info valueForKey:UIImagePickerControllerEditedImage];
    
    if (self.selectedImageBlock) {
        self.selectedImageBlock(image);
    }
    
    NSData *imageData;
    if (UIImagePNGRepresentation(image)) {
        imageData = UIImagePNGRepresentation(image);
    } else {
        imageData = UIImageJPEGRepresentation(image, 1.f);
    }

    NSString *path_sandox = NSHomeDirectory();
    NSString *imagePath = [path_sandox stringByAppendingString:@"/Documents/avatar.png"];
    [imageData writeToFile:imagePath atomically:YES];
}

- (void)checkCameraPermission:(void(^)(BOOL success, NSError *error))compltion {
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (status == AVAuthorizationStatusNotDetermined) {
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
            if (granted) {
                [self takePhoto];
            }
        }];
    } else if (status == AVAuthorizationStatusDenied || status == AVAuthorizationStatusRestricted) {
        [self alertCamear];
    } else {
        [self takePhoto];
    }
}

- (void)takePhoto {
    //判断相机是否可用，防止模拟器点击【相机】导致崩溃
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        self.imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        UIViewController *vc = [[[UIApplication sharedApplication] keyWindow] rootViewController];
        [vc presentViewController:self.imagePickerController animated:YES completion:^{
            
        }];
    } else {
        NSLog(@"不能使用模拟器进行拍照");
    }
}

- (void)alertCamear {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"请在设置中打开相机" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        UIViewController *vc = [[[UIApplication sharedApplication] keyWindow] rootViewController];
        [vc dismissViewControllerAnimated:YES completion:nil];
    }];
    [alert addAction:cancel];
    UIViewController *vc = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    [vc presentViewController:alert animated:YES completion:nil];
}

- (void)showAlertView {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle: UIAlertControllerStyleActionSheet];
    
    //Camera
    UIAlertAction *timeAction = [UIAlertAction actionWithTitle:@"Photograph" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //检查相机权限
        [self checkCameraPermission];
    }];
    UIAlertAction *amountAction = [UIAlertAction actionWithTitle:@"Select from the album" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //检查相册权限
        [self checkAlbumPermission];
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        UIViewController *vc = [[[UIApplication sharedApplication] keyWindow] rootViewController];
        [vc dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [cancelAction setValue:[SCUtil colorWithHexString:@"#FF3B30"] forKey:@"titleTextColor"];
    
    [alertController addAction:timeAction];
    [alertController addAction:amountAction];
    [alertController addAction:cancelAction];
    
    UIViewController *vc = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    [vc presentViewController:alertController animated:YES completion:nil];
}

- (void)checkCameraPermission {
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (status == AVAuthorizationStatusNotDetermined) {
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
            if (granted) {
                [self takePhoto];
            }
        }];
    } else if (status == AVAuthorizationStatusDenied || status == AVAuthorizationStatusRestricted) {
        [self alertCamear];
    } else {
        [self takePhoto];
    }
}

- (void)checkAlbumPermission {
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    if (status == PHAuthorizationStatusNotDetermined) {
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (status == PHAuthorizationStatusAuthorized) {
                    [self selectAlbum];
                }
            });
        }];
    } else if (status == PHAuthorizationStatusDenied || status == PHAuthorizationStatusRestricted) {
        [self alertAlbum];
    } else {
        [self selectAlbum];
    }
}

- (void)selectAlbum {
    //判断相册是否可用
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        self.imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        UIViewController *vc = [[[UIApplication sharedApplication] keyWindow] rootViewController];
        [vc presentViewController:self.imagePickerController animated:YES completion:^{
            
        }];
    }
}

- (void)alertAlbum {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"请在设置中打开相册" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        UIViewController *vc = [[[UIApplication sharedApplication] keyWindow] rootViewController];
        [vc dismissViewControllerAnimated:YES completion:nil];
    }];
    [alert addAction:cancel];
    UIViewController *vc = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    [vc presentViewController:alert animated:YES completion:nil];
}

- (UIImagePickerController *)imagePickerController {
    if (!_imagePickerController) {
        _imagePickerController = [[UIImagePickerController alloc] init];
        _imagePickerController.delegate = self;
        _imagePickerController.allowsEditing = YES;
    }
    return _imagePickerController;
}

@end
