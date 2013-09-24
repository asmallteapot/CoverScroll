//
//  ASTViewController.m
//  CoverScroll
//
//  Created by Bill Williams on 23.09.13.
//  Copyright (c) 2013 A Small Teapot. All rights reserved.
//

#import "ASTViewController.h"


static NSString * const ASTCoverScrollDemoImageName = @"florida-cities";
static NSString * const ASTCoverScrollDemoURLString = @"http://theguardian.com/";


@interface ASTViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@end


@implementation ASTViewController

- (void)viewDidLoad {
	[super viewDidLoad];

	// load something in the image view
	self.imageView.image = [UIImage imageNamed:ASTCoverScrollDemoImageName];
	self.webView.backgroundColor = [UIColor clearColor];
	self.webView.scrollView.contentInset = UIEdgeInsetsMake(120.0, 0.0, 0.0, 0.0);
	self.webView.scrollView.delegate = self;

	// load something in the web view
	NSURL *someURL = [NSURL URLWithString:ASTCoverScrollDemoURLString];
	[self.webView loadRequest:[NSURLRequest requestWithURL:someURL]];

	// hide the web view's shadows - jodm solution
	// http://stackoverflow.com/a/3521263/1914
	for (UIView *view in [self.webView.subviews[0] subviews]) {
		if ([view isKindOfClass:[UIImageView class]]) {
			view.hidden = YES;
		}
	}
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


#pragma mark - UIScrollView delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
	if (scrollView.contentOffset.y < -240.0) {
		CGPoint offset = scrollView.contentOffset;
		offset.y = -240.0;
		scrollView.contentOffset = offset;
	}
}

@end
