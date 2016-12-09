//
//  NiceShopViewController.m
//  Enjoyment
//
//  Created by zzj on 16/12/8.
//  Copyright © 2016年 zzj. All rights reserved.
//

#import "NiceShopViewController.h"
#import "NSModel.h"
#import "NiceShopCell.h"
#import "NSDetailViewController.h"

@interface NiceShopViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)NSModel *nsModel;

@property (nonatomic, strong)UITableView *tableView;

@end

@implementation NiceShopViewController

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height-64) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //解析数据
    [self loadData];
}

- (void)loadData {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"1603Test" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    NSError *err = nil;
    self.nsModel = [[NSModel alloc] initWithData:data error:&err];
    
    //刷新UI
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- UITableView代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.nsModel.data.items.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 250;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellId = @"niceShopCellId";
    NiceShopCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"NiceShopCell" owner:nil options:nil] lastObject];
    }
    NSItems *items = self.nsModel.data.items[indexPath.row];
    [cell config:items];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDetailViewController *ctrl = [[NSDetailViewController alloc] init];
    NSItems *items = self.nsModel.data.items[indexPath.row];
    ctrl.title = items.name;
    ctrl.urlString = items.detail_url;
    
    //push后隐藏tabbar
    [ctrl setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:ctrl animated:YES];
}

@end
