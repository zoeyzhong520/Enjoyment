//
//  MainTabBarViewController.m
//  Enjoyment
//
//  Created by zzj on 16/12/8.
//  Copyright © 2016年 zzj. All rights reserved.
//

#import "MainTabBarViewController.h"

@interface MainTabBarViewController ()

@end

@implementation MainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createTabBarControllers];
}

//创建视图控制器
- (void)createTabBarControllers {
    
    NSArray *ctrlNames = @[@"NiceShopViewController",@"ExperienceViewController",@"NiceGoodsViewController",@"ProfilesViewController"];
    NSArray *imageNames = @[@"recommendation_",@"broadwood_",@"classification_",@"my_"];
    NSArray *titleNames = @[@"好店",@"体验",@"好物",@"我的"];
    
    //导航视图控制器数组
    NSMutableArray *array = [NSMutableArray array];
    
    for (int i=0;i<imageNames.count;i++) {
     
        //视图控制器
        NSString *ctrlName = ctrlNames[i];
        Class cls = NSClassFromString(ctrlName);
        UIViewController *ctrl = [[cls alloc] init];
        
        //文字
        ctrl.tabBarItem.title = titleNames[i];
        ctrl.title = titleNames[i];
        
        //图片
        ctrl.tabBarItem.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@1",imageNames[i]]];
        NSString *sName = [NSString stringWithFormat:@"%@2",imageNames[i]];
        ctrl.tabBarItem.selectedImage = [[UIImage imageNamed:sName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        UIColor *color = [UIColor blackColor];
        NSDictionary *dic = @{NSForegroundColorAttributeName:color};
        [ctrl.tabBarItem setTitleTextAttributes:dic forState:UIControlStateNormal];
        
        //导航
        UINavigationController *navCtrl = [[UINavigationController alloc] initWithRootViewController:ctrl];
        
        [array addObject:navCtrl];
        
    }
    self.viewControllers = array;
    
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
