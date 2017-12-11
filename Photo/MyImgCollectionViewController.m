//
//  MyImgCollectionViewController.m
//  Photo
//
//  Created by Aleksey on 11.12.2017.
//  Copyright © 2017 Aleksey Vinogradov. All rights reserved.
//

#import "MyImgCollectionViewController.h"
#import "PhotoViewController.h"
#import "WebServiceParamPhoto.h"
#import "PhotoImg.h"
#import "SearchingInfo.h"

#define SHOW_VIEW_PHOTO_ID @"secondSegue"

@interface MyImgCollectionViewController () <ParamPhotosDelegate> {
    ParamPhotosService *service;
    
    NSDictionary *chosenImageSizes;
}

@property (nonatomic, strong) NSMutableArray *photos;
@property (nonatomic, strong) UIActivityIndicatorView *indicator;

@end

@implementation MyImgCollectionViewController

static NSString * const reuseIdentifier = @"CollectionCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    self.navigationItem.title = self.selectedInfo.content;
    
    self.indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.indicator.center = CGPointMake(self.collectionView.frame.size.width / 2, self.collectionView.frame.size.height / 2);
    [self.indicator startAnimating];
    [self.collectionView addSubview:self.indicator];
    
    self.photos = [[NSMutableArray alloc] init];
    
    service = [[ParamPhotosService alloc] init];
    service.delegate = self;
    [self loadPhotos];
}

- (void)loadPhotos {
    if (self.selectedInfo.type == ContentTypeTag) {
        [service loadTagPhotos:self.selectedInfo.content];
    } else if (self.selectedInfo.type == ContentTypeText) {
        [service loadTextPhotos:self.selectedInfo.content];
    }
}

- (void)addPhotoImage:(PhotoImg *)photoImage {
    [self.photos addObject:photoImage];
    [self.collectionView reloadData];
}

- (void)updateNumberOfPhotos {
    [self.indicator stopAnimating];
    self.indicator.hidden = YES;
    
    [self.collectionView reloadData];
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

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return service.nubmerOfPhotos;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    if (indexPath.row < self.photos.count) {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height)];
        PhotoImg *photoImage = self.photos[indexPath.row];
        imgView.image = photoImage.image;
        [cell addSubview:imgView];
    } else {
        UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [indicator startAnimating];
        indicator.center = CGPointMake(cell.frame.size.width / 2, cell.frame.size.height / 2);
        [cell addSubview:indicator];
    }
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < self.photos.count) {
        return YES;
    } else {
        return NO;
    }
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    PhotoImg *photoImage = self.photos[indexPath.row];
    chosenImageSizes = photoImage.sizes;
    [self performSegueWithIdentifier:SHOW_VIEW_PHOTO_ID sender:self];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqual:SHOW_VIEW_PHOTO_ID]) {
        PhotoViewController *dvc = (PhotoViewController *)segue.destinationViewController;
        dvc.sizes = chosenImageSizes;
    }
}

@end

