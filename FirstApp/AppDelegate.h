//
//  AppDelegate.h
//  FirstApp
//
//  Created by qiyu on 2020/2/19.
//  Copyright © 2020 com.qiyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

