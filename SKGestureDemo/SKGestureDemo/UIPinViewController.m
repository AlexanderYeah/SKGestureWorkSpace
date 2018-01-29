//
//  UIPinViewController.m
//  SKGestureDemo
//
//  Created by Alexander on 2018/1/29.
//  Copyright © 2018年 alexander. All rights reserved.
//

#import "UIPinViewController.h"

@interface UIPinViewController ()

@property (nonatomic,strong)UILabel *showLbl;

@end

@implementation UIPinViewController
// 上一次的缩放比例
float lastScale = 1.0f;
// 最小的缩放比例
float minScale = 1.0f;
// 最大的缩放比例
float maxScale = 2.0f;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	UILabel *lbl = [[UILabel alloc]initWithFrame:CGRectMake(50, 100, 300, 300)];
	self.showLbl = lbl;
	lbl.backgroundColor = [UIColor cyanColor];
	lbl.text = @"像我这样的碌碌无为的人,像我这样平凡的人";
	lbl.userInteractionEnabled = YES;
	UIPinchGestureRecognizer *pin = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(scale:)];
	// pin.delegate = self;
	[lbl addGestureRecognizer:pin];
	[self.view addSubview:lbl];
}

// 在方法里面对缩放比例进行控制
- (void)scale:(UIGestureRecognizer *)gesture{
	
	UIPinchGestureRecognizer * pin = (UIPinchGestureRecognizer *)gesture;
	if ([gesture state] == UIGestureRecognizerStateBegan) {

     	lastScale = pin.scale;
	}
	float nowScale;
	nowScale = (lastScale - 1) + pin.scale;
	nowScale = MIN(nowScale, maxScale);
	nowScale = MAX(nowScale, minScale);
	self.showLbl.transform = CGAffineTransformScale(CGAffineTransformIdentity, nowScale, nowScale);

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
