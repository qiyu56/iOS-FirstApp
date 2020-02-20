//
//  LocationAndMapViewController.m
//  FirstApp
//
//  Created by qiyu on 2020/2/20.
//  Copyright © 2020 com.qiyu. All rights reserved.
//

#import "LocationAndMapViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
@import Masonry;

@interface LocationAndMapViewController () <CLLocationManagerDelegate, MKMapViewDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) MKMapView *mapView;
@property (nonatomic, strong) UILabel *label;

@end

@implementation LocationAndMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    self.title = @"Location&Map";
    
    _mapView = [[MKMapView alloc] init];
    [self.view addSubview:_mapView];
    [_mapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.view);
        make.top.mas_equalTo(88);
    }];
    _mapView.showsUserLocation = YES;
    
    _label = [UILabel new];
    _label.layer.cornerRadius = 19;
    _label.layer.borderWidth = 0.5;
    _label.layer.borderColor = UIColor.grayColor.CGColor;
    _label.textAlignment = NSTextAlignmentCenter;
    _label.textColor = UIColor.blackColor;
    _label.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:_label];
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.view);
        make.top.mas_equalTo(self.mapView.mas_bottom);
        make.height.mas_equalTo(70);
    }];
    
    UIView *bottomView = [UIView new];
    bottomView.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.leading.bottom.mas_equalTo(self.view);
        make.top.mas_equalTo(self.label.mas_bottom);
        make.height.mas_equalTo(44);
    }];
    
    //获取定位权限（使用时定位）需要在info.plist中添加信息
    [self.locationManager requestWhenInUseAuthorization];
    //定位是否可用
    if (CLLocationManager.locationServicesEnabled) {
        [_locationManager startUpdatingLocation];
    }
}

- (CLLocationManager *)locationManager {
    [self configLocation];
    return _locationManager;
}

- (void)configLocation {
    _locationManager = [CLLocationManager new];
    // 定位精度
    _locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    _locationManager.delegate = self;
}

#pragma mark CLLocationManagerDelegate

/*
*  locationManager:didUpdateLocations:
*
*  Discussion:
*    Invoked when new locations are available.  Required for delivery of
*    deferred locations.  If implemented, updates will
*    not be delivered to locationManager:didUpdateToLocation:fromLocation:
*
*    locations is an array of CLLocation objects in chronological order.
*/
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    
    CLLocation *newLocation = locations.lastObject;
    //获取经纬度
    dispatch_async(dispatch_get_main_queue(), ^{
        self.label.text = [NSString stringWithFormat:@"%f, %f", newLocation.coordinate.latitude, newLocation.coordinate.longitude];
    });
    
//    CLGeocoder *geocoder = [CLGeocoder new];
//    [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
//        CLPlacemark *placemark = placemarks.firstObject;
//        NSLog(@"%@-%@-%@", placemark.country, placemark.administrativeArea, placemark.subAdministrativeArea);
//    }];
    [_locationManager stopUpdatingLocation];
}

/*
 *  locationManager:didFailWithError:
 *
 *  Discussion:
 *    Invoked when an error has occurred. Error types are defined in "CLError.h".
 */
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"--Location failed--error: %@", error);
}

@end
