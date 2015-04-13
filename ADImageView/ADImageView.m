//
//  ADImageView.m
//  ADImageView
//
//  Created by Alessandro dos santos pinto on 4/12/15.
//  Copyright (c) 2015 Alessandro dos santos pinto. All rights reserved.
//

#import "ADImageView.h"

@implementation ADImageView
@synthesize url = _url;

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        progress = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [self addSubview:progress];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {

    if (self = [super initWithCoder:aDecoder]) {
        progress = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [self addSubview:progress];
    }
    return self;
}

- (void)layoutSubviews {

    [super layoutSubviews];
    progress.center = [self convertPoint:self.center fromView:self.superview];
}

- (void)setUrl:(NSString *)paramURL {

    if ([paramURL length] == 0) {
        _url = nil;
        self.image = nil;
    } else if (paramURL != _url) {
        _url = [paramURL copy];
        self.image = nil;
        if (!queue) {
            queue = [[NSOperationQueue alloc] init];
        }
        [queue cancelAllOperations];
        [progress startAnimating];
        NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(downloading) object:nil];
        [queue addOperation:operation];
    }
}

- (void) downloading {
    
    NSString *file = [_url stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
    file = [_url stringByReplacingOccurrencesOfString:@"\\" withString:@"_"];
    file = [_url stringByReplacingOccurrencesOfString:@":" withString:@"_"];
    file = [@"/Documents/" stringByAppendingString:file];
    file = [NSHomeDirectory() stringByAppendingString:[NSString stringWithString:file]];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:file]) {
        NSData *data = [NSData dataWithContentsOfFile:file];
        if (data) {
            UIImage *img = [[UIImage alloc] initWithData:data];
            [self performSelectorOnMainThread:@selector(showImg:) withObject:img waitUntilDone:YES];
            return;
        }
    }
    
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:_url]];
    UIImage *img = [[UIImage alloc]initWithData:data];
    [data writeToFile:file atomically:YES];
    [self performSelectorOnMainThread:@selector(showImg:) withObject:img waitUntilDone:YES];
}

- (void) showImg:(UIImage *) image {

    self.image = image;
    [progress stopAnimating];
}
                    
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
