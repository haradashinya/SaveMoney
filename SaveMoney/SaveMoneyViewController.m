//
//  SaveMoneyViewController.m
//  SaveMoney
//
//  Created by HARADA SHINYA on 10/26/12.
//  Copyright (c) 2012 HARADA SHINYA. All rights reserved.
//

#import "SaveMoneyViewController.h"

@interface SaveMoneyViewController ()

@end

@implementation SaveMoneyViewController
{
    UILabel *currentPriceLabel;
    User *user;
    UIPickerView *coffeePickerView;
    Drink *drink;
    UILabel *moneyLabel;
    UILabel *rankLabel;
    HistoryViewController *hvc;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    drink = [Drink shared];
    drink.delegate = self;
    user = [User shared];
    user.delegate = self;
    
    [[Admob alloc] addAdmobOn:self];
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addCoffeePickerView];
    [self addCurrentPriceLabel];
    [self addSaveButton];
    [self addMoneyLabel];
    [self addObserver:self forKeyPath:@"currentCoffee" options:NSKeyValueObservingOptionNew context:nil];
    [drink addObserver:self forKeyPath:@"totalPrice" options:(NSKeyValueObservingOptionNew| NSKeyValueObservingOptionOld) context:nil];
    
    [drink performTotalPrice];
}

-(void)addCurrentPriceLabel
{
    self.currentCoffee = [drink.types objectAtIndex:0];
    currentPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,300,320, 50)];
    Underline *lineLabel = [[Underline alloc] initWithFrame:CGRectMake(60,330,200,10)];
    [currentPriceLabel setTextAlignment:NSTextAlignmentCenter];
    currentPriceLabel.text = [NSString stringWithFormat:@"Price: %.1f $",[drink priceForCoffee:[self.currentCoffee valueForKey:@"name"]]];
    currentPriceLabel.font = [UIFont boldSystemFontOfSize:20];
    [self.view addSubview:lineLabel];
    currentPriceLabel.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:currentPriceLabel];
    
    
}
-(void)addCoffeePickerView
{
    
    coffeePickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0,100,320,200)];
    coffeePickerView.delegate = nil;

    coffeePickerView.delegate = self;
    
    coffeePickerView.dataSource = self;
    
    CGRect frame = coffeePickerView.frame;
    coffeePickerView.frame= frame;
    
    coffeePickerView.showsSelectionIndicator = YES;
    [coffeePickerView selectedRowInComponent:0];
    coffeePickerView.backgroundColor = [UIColor clearColor];
    [coffeePickerView setNeedsDisplay];
    [coffeePickerView reloadAllComponents];

    [self.view addSubview:coffeePickerView];
    
}

-(void)receivedRankAndTotal
{
    NSString *str = [NSString stringWithFormat:@"You're the %i th out of %i!",user.rank,user.total];
    [rankLabel setText:str];

}
-(void)addMoneyLabel
{
    moneyLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 320, 50)];
    [moneyLabel setTextAlignment:NSTextAlignmentCenter];
    moneyLabel.backgroundColor = [UIColor clearColor];
    moneyLabel.text = @"...";
    
    BButton *btn = [[BButton alloc] initWithFrame:CGRectMake(0,52,60,44)];
    btn.color = [UIColor orangeColor];
    [btn setTitle:@"Rank" forState:UIControlStateNormal];
    btn.layer.cornerRadius = 1000;
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(pressedRankButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:moneyLabel];
}
-(void)pressedRankButton:(id)sender
{
    
    
    CMPopTipView *contentView = [[CMPopTipView alloc] initWithFrame:CGRectMake(0, 0,240,44)];
    contentView.delegate = self;
    rankLabel  = [[UILabel alloc] initWithFrame:[contentView bounds]];
    [rankLabel setBackgroundColor:[UIColor darkGrayColor]];
    [rankLabel setTextAlignment:NSTextAlignmentCenter];
    rankLabel.layer.cornerRadius = 10.0f;
    rankLabel.layer.masksToBounds = YES;
    rankLabel.text = @"fetching...";
    rankLabel.textColor = [UIColor whiteColor];
    rankLabel.layer.opacity = 0.9;
    [contentView addSubview:rankLabel];
    contentView.dismissTapAnywhere = YES;
    BButton *button = (BButton *)sender;
    [contentView presentPointingAtView:button inView:self.view animated:YES];
    [user getRank];
}


-(void)addSaveButton
{
    BButton *btn = [[BButton alloc] initWithFrame:CGRectMake(-10,360,340,50)];
    btn.color = [UIColor orangeColor];
    [btn setTitle:@"Save!" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(pressedSaveBtn:) forControlEvents:UIControlEventTouchUpInside];
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return [drink.types count];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.currentCoffee = [drink.types objectAtIndex:row];
    
    
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return [drink.types count];
}


-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 50.0f;
}
-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return 320.0f;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    return [[drink.types objectAtIndex:row] valueForKey:@"name"];
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"currentCoffee"]){
        [self updateCurrentLabel];
    }else if ([keyPath isEqualToString:@"totalPrice"]){
        [self updateCurrentPriceLabel];
    }
}


-(void)updateCurrentLabel
{
    float price = [[self.currentCoffee valueForKey:@"price"] floatValue];
    currentPriceLabel.text = [NSString stringWithFormat:@"%.1f $",price];
    
}



// when received total money receive
-(void)updateCurrentPriceLabel
{
    moneyLabel.text = [NSString stringWithFormat:@"You've saved %.1f $",drink.totalPrice];
    moneyLabel.backgroundColor = [UIColor clearColor];
}

-(void)pressedSaveBtn:(id)sender
{
    [drink performCreateWith:[self.currentCoffee valueForKey:@"name"]];
    moneyLabel.text = @"updating.";
    
}
- (void)didReceiveMemoryWarning
{
    [self removeObserver:self forKeyPath:@"currentCoffee"];
    [super didReceiveMemoryWarning];
    [self removeObserver:self forKeyPath:@"totalPrice"];
}
-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0,145,50)];
    [label setTextAlignment:NSTextAlignmentCenter];
    label.opaque=NO;
    label.backgroundColor=[UIColor clearColor];
    UIFont *font = [UIFont boldSystemFontOfSize:20];
    label.font = font;
    NSString *str = [[drink.types objectAtIndex:row] valueForKey:@"name"];
    [label setText:str];
    return label;
}

@end
