//
//  TextBar.h
//  FirstApp
//
//  Created by qiyu on 2020/2/19.
//  Copyright © 2020 com.qiyu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol TextBarDelegate <NSObject>

- (void)showText:(NSString *)text;

@end

@interface TextBar : UIView

@property (nonatomic, copy) NSString *text;

@property (nonatomic, weak) id<TextBarDelegate> delegate;

@end



NS_ASSUME_NONNULL_END
