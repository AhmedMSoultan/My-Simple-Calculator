//
//  ViewController.m
//  SimpleCalculator
//
//  Created by Ahmed Soultan on 16/01/2022.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@property float temp1;
@property float temp2;
@property NSString* operation;
@property float result;

@end

@implementation ViewController
NSArray *arr;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

- (IBAction)printNum:(id)sender {

    if ([[sender currentTitle]  isEqual: @"÷" ]|| [[sender currentTitle]  isEqual: @"x" ] || [[sender currentTitle]  isEqual: @"-" ] || [[sender currentTitle]  isEqual: @"+" ] || [[sender currentTitle]  isEqual: @"%" ]|| [[sender currentTitle]  isEqual: @"/" ] || [[sender currentTitle]  isEqual: @"-/+" ]) {
        
        _operation = [sender currentTitle];
        NSLog(@"%@", _operation);
    }
    
    if(![[sender currentTitle]  isEqual: @"-/+" ]){
        _resultLabel.text = [_resultLabel.text stringByAppendingString: [sender currentTitle]];
    }
    
}

- (IBAction)clearScreen:(id)sender {
    [_resultLabel setText:@""];
    _temp1=0;
    _temp2=0;
}

- (IBAction)viewResult:(id)sender {
    
    _temp1=0;
    _temp2=0;
    arr = @[];
    
    NSString *equation = _resultLabel.text;
    
    if(_operation != NULL){
        
        arr = [equation componentsSeparatedByString: _operation];
        
        for (NSString *value in arr) {
            NSLog(@"%@", value);
        }
        
        if(arr.count == 3){
            _temp1 = [arr[1] floatValue];
            _temp2 = [arr[2] floatValue];
            _result = -1 * (_temp1+_temp2);
        }else{
            if ([_operation isEqual:@"x"]) {
                _temp1 = [arr[0] floatValue];
                _temp2 = [arr[1] floatValue];
                _result = _temp1*_temp2;
            }
            else if ([_operation isEqual:@"÷"]) {
                _temp1 = [arr[0] floatValue];
                _temp2 = [arr[1] floatValue];
                _result = _temp1/_temp2;
                printf("%lf", _result);
            } else if ([_operation isEqual:@"-"]) {
                _temp1 = [arr[0] floatValue];
                _temp2 = [arr[1] floatValue];
                _result = _temp1-_temp2;
            } else if ([_operation isEqual:@"+"]) {
                _temp1 = [arr[0] floatValue];
                _temp2 = [arr[1] floatValue];
                _result = _temp1+_temp2;
            } else if ([_operation isEqual:@"%"]) {
                _temp1 = [arr[0] intValue];
                _temp2 = [arr[1] intValue];
                _result = (int)_temp1%(int)_temp2;
            }else{
                _result = (int)_temp1;
            }
        }
         
    }else{
        _temp1 = [equation floatValue];
        _result = _temp1;
    }
    
    [_resultLabel setText:@""];
    NSString* myres = [@(_result) stringValue];
    [_resultLabel setText: myres];
    _operation = NULL ;
}
- (IBAction)negativePositiveBtn:(id)sender {
    
    NSString *negative = @"-";
    if ([_resultLabel.text characterAtIndex:0] != '-') {
        _resultLabel.text = [negative stringByAppendingString:_resultLabel.text];
    } else if ([_resultLabel.text characterAtIndex:0] == '-') {
        if ([_resultLabel.text hasPrefix:@"-"] && [_resultLabel.text length] > 1) {
            _resultLabel.text = [_resultLabel.text substringFromIndex:1];
        }
    }
    
}


@end
