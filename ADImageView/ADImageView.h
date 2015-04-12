//
//  ADImageView.h
//  ADImageView
//
//  Created by Alessandro dos santos pinto on 4/12/15.
//  Copyright (c) 2015 Alessandro dos santos pinto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ADImageView : UIImageView {

    UIActivityIndicatorView *progress;
    NSOperationQueue *queue;
}

@property (nonatomic, copy) NSString *url;

@end
