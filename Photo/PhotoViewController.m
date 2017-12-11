//
//  PhotoViewController.m
//  Photo
//
//  Created by Aleksey on 11.12.2017.
//  Copyright © 2017 Aleksey Vinogradov. All rights reserved.
//

#import "PhotoViewController.h"
#import "WebServicePhoto.h"
#import "PhotoImg.h"
#import "Sizes.h"

@interface PhotoViewController () <PhotoServiceDelegate, UIScrollViewDelegate> {
    WebServicePhoto *service;
}

@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;
@property (weak, nonatomic) IBOutlet UIScrollView *zoomScrollView;

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.zoomScrollView.minimumZoomScale = 1.0;
    self.zoomScrollView.maximumZoomScale = 6.0;
    self.zoomScrollView.contentSize = self.photoImageView.frame.size;
    
    service = [[WebServicePhoto alloc] init];
    service.delegate = self;
    [service loadPhotoWithSize:[self chooseSize] photoSizes:self.sizes delegate:self];
    
    [self.indicator startAnimating];
}

- (NSString *)chooseSize {
    if ([self.sizes objectForKey:LARGE_SIZE]) {
        return LARGE_SIZE;
    } else {
        return MEDIUM_SIZE;
    }
}

- (void)setLoadedPhoto:(PhotoImg *)photoImage {
    [self.indicator stopAnimating];
    self.indicator.hidden = YES;
    
    self.photoImageView.image = photoImage.image;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.photoImageView;
}

- (void)errorLoadingDataWithTitle:(NSString *)title description:(NSString *)errorDescription {
    if (self.view.window) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:title
                                                                       message:errorDescription
                                                                preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

@end
