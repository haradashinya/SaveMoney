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
    UIPickerView *coffeePickerView;
    Drink *drink;
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
    [[Admob alloc] addAdmobOn:self];
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addCoffeePickerView];
    [self addCurrentPriceLabel];
    [self addSaveButton];
    [self addCofeeImg];
    [self addObserver:self forKeyPath:@"currentCoffee" options:NSKeyValueObservingOptionNew context:nil];
    


	// Do any additional setup after loading the view.
}
-(void)addCurrentPriceLabel
{
    self.currentCoffee = [drink.types objectAtIndex:0];
    currentPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(180, 220, 100, 50)];
    [currentPriceLabel setTextAlignment:NSTextAlignmentCenter];
    currentPriceLabel.text = [NSString stringWithFormat:@"%.2f $",[drink priceForCoffee:[self.currentCoffee valueForKey:@"name"]]];
    [self.view addSubview:currentPriceLabel];
    
}
-(void)addCoffeePickerView
{
    
    coffeePickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0,50, 320, 10)];
    coffeePickerView.delegate = self;
    coffeePickerView.dataSource = self;
    coffeePickerView.showsSelectionIndicator = YES;
    [coffeePickerView selectedRowInComponent:0];
    [self.view addSubview:coffeePickerView];
    
}
-(void)addCofeeImg
{
    UIImage *img = [UIImage imageNamed:@"_cafelate.png"];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:img];
    imgView.frame = CGRectMake(0, 193,160,240);
    [self.view addSubview:imgView];

}
-(void)addSaveButton
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(160,370,160,50);
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
    return 30.0f;
}
-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return 300.0f;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    return [[drink.types objectAtIndex:row] valueForKey:@"name"];
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"currentCoffee"]){
        [self updateCurrentLabel];
    }
}
-(void)updateCurrentLabel
{
    float price = [[self.currentCoffee valueForKey:@"price"] floatValue];
    NSLog(@"self.currentName is %@",self.currentCoffee);
    currentPriceLabel.text = [NSString stringWithFormat:@"%.2f $",price];
}

-(void)pressedSaveBtn:(id)sender
{
    [drink performCreateWith:[self.currentCoffee valueForKey:@"name"]];
}
- (void)didReceiveMemoryWarning
{
    [self removeObserver:self forKeyPath:@"currentCoffee"];
    [super didReceiveMemoryWarning];
}

@end
