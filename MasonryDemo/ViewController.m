//
//  ViewController.m
//  MasonryDemo
//
//  Created by Tiny on 2018/5/29.
//  Copyright © 2018年 hxq. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "TYCustom1Cell.h"
#import "TYCustom1Model.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setupUI];
    self.dataArray = [NSMutableArray array];
    for (int i = 0; i < 10; i++) {
        TYCustom1Model *model = [TYCustom1Model new];
        model.text = [self randomStringWithLength:arc4random_uniform(250)];
        model.isShowMore = NO;
        [self.dataArray addObject:model];
    }
    [self.tableView reloadData];
}

-(void)setupUI{
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_safeAreaLayoutGuideTop);
        make.left.mas_equalTo(self.view.mas_safeAreaLayoutGuideLeft);
        make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        make.right.mas_equalTo(self.view.mas_safeAreaLayoutGuideRight);
    }];
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.delegate = self;
        _tableView.dataSource  =self;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 44;
        [_tableView registerClass:[TYCustom1Cell class] forCellReuseIdentifier:@"TYCustom1Cell"];
    }
    return _tableView;
}


-(NSString *)randomStringWithLength:(NSInteger)len {
    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    
    for (NSInteger i = 0; i < len; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random_uniform([letters length])]];
    }
    return randomString;
}
#pragma mark - UITableViewDelegate && UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TYCustom1Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"TYCustom1Cell"];
    TYCustom1Model *model = [self.dataArray objectAtIndex:indexPath.row];
    __weak typeof(self) weakself = self;
    cell.expendBlock = ^{
        [weakself.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    };
    cell.model = model;
    return cell;
}


@end
