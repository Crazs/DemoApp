//
//  HomeViewController.m
//  DemoAPP
//
//  Created by 周文涛 on 2020/3/5.
//  Copyright © 2020 Crazs. All rights reserved.
//

#import "HomeViewController.h"

#define D_name @"Name"
#define D_class @"Class"

@interface HomeViewController ()
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"首页";
}

- (void)createSubView{
    [super createSubView];

    NSString *path = [[NSBundle mainBundle] pathForResource:@"SubControllers" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    self.dataSource = [[NSMutableArray alloc] initWithArray:array];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier(UITableViewCell)];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier(UITableViewCell) forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSDictionary * dic = [self.dataSource objectAtIndex:indexPath.row];
    cell.textLabel.text = [dic objectForKey:D_name];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary * dic = [self.dataSource objectAtIndex:indexPath.row];
    Class vClass = NSClassFromString([dic objectForKey:D_class]);
    UIViewController * v = [[vClass alloc] init];
    v.navigationItem.title = [dic objectForKey:D_name];
    v.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:v animated:YES];
}

@end
