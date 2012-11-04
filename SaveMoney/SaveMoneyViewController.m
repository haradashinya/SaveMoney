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
    UILabel *moneyLabel;
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
    [[Admob alloc] addAdmobOn:self];
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addCoffeePickerView];
    [self addCurrentPriceLabel];
    [self addSaveButton];
    [self addCofeeImg];
    [self addObserver:self forKeyPath:@"currentCoffee" options:NSKeyValueObservingOptionNew context:nil];
    [drink addObserver:self forKeyPath:@"totalPrice" options:NSKeyValueObservingOptionNew context:nil];
	// Do any additional setup after loading the view.
}

-(void)addCurrentPriceLabel
{
    self.currentCoffee = [drink.types objectAtIndex:0];
    currentPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(180, 220, 100, 50)];
    [currentPriceLabel setTextAlignment:NSTextAlignmentCenter];
    currentPriceLabel.text = [NSString stringWithFormat:@"%.1f $",[drink priceForCoffee:[self.currentCoffee valueForKey:@"name"]]];
    [self.view addSubview:currentPriceLabel];
    
}
-(void)addCoffeePickerView
{
    
    coffeePickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0,100,320,162)];
    coffeePickerView.delegate = nil;

    coffeePickerView.delegate = self;
    
    coffeePickerView.dataSource = self;
    
    CGRect frame = coffeePickerView.frame;
    coffeePickerView.frame= frame;
    
    coffeePickerView.showsSelectionIndicator = YES;
    [coffeePickerView selectedRowInComponent:0];
    coffeePickerView.backgroundColor = [UIColor whiteColor];
    coffeePickerView.layer.zPosition = -400;
    [coffeePickerView setNeedsDisplay];
    [coffeePickerView reloadAllComponents];

//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(200,85,120,192)];
//    imageView.image = [UIImage imageNamed:@"_cafelate.png"];
    
    [self.view addSubview:coffeePickerView];
//    [self.view addSubview:imageView];
    
}
-(void)addCofeeImg
{
    moneyLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 320, 50)];
    [moneyLabel setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:moneyLabel];
    

}
-(void)addSaveButton
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(0,360,320,50);
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
}

-(void)pressedSaveBtn:(id)sender
{
    [drink performCreateWith:[self.currentCoffee valueForKey:@"name"]];
    moneyLabel.text = @"updating.";
    //    drink.totalPrice += [[self.currentCoffee valueForKey:@"price"] floatValue];
}
- (void)didReceiveMemoryWarning
{
    [self removeObserver:self forKeyPath:@"currentCoffee"];
    [super didReceiveMemoryWarning];
}

@end
