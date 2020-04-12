#import "ArrayCalculator.h"

@implementation ArrayCalculator
+ (NSInteger)maxProductOf:(NSInteger)numberOfItems itemsFromArray:(NSArray *)array {
    int number = (int)numberOfItems;
    NSMutableArray *arr = [NSMutableArray arrayWithArray:array];
    int mult = 1;
    
    for (int i = 0; i < array.count; i++) {
        if ([array[i] isKindOfClass:[NSString class]])
            [arr removeObject: array[i]];
    }
    
    NSLog(@"%@", arr);
    
    if ([arr isEqualToArray:@[]])
        return 0;
    
    if (number > arr.count) {
        mult = 1;
        for (int i = 0; i < arr.count; i++)
            mult *= [arr[i] intValue];
        return mult;
    } else {
        for (int i = 0; i < arr.count - 1; i++)
            for (int j = 0; j < arr.count - i - 1; j++) {
                if (abs([arr[j] intValue]) < abs([arr[j + 1] intValue])) {
                    int temp = [arr[j] intValue];
                    arr[j] = arr[j + 1];
                    arr[j + 1] = [NSNumber numberWithInt:temp];
                }
            }
    }
    
    NSLog(@"%@", arr);
    
    for (int i = 0; i < number; i++)
        mult *= [arr[i] intValue];
    
    if (mult < 0) {
        int _mult = 1;
        for (int i = 0; i < arr.count - 1; i++)
            for (int j = 0; j < arr.count - i - 1; j++) {
                if ([arr[j] intValue] < [arr[j + 1] intValue]) {
                    int temp = [arr[j] intValue];
                    arr[j] = arr[j + 1];
                    arr[j + 1] = [NSNumber numberWithInt:temp];
                }
            }
        
        for (int i = 0; i < number; i++)
        _mult *= [arr[i] intValue];
        
        if (mult < _mult) {
            return _mult;
        }
    }
    
    return mult;
}
@end
