#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
    
    NSUInteger count = array.count;
    int dif = 0;
    NSNumber *numb = number;
       
    for (int i = 0; i < count; i++) {
      for (int j = 0; j < count; j++) {
        if (([array[j] intValue] - [array[i] intValue]) == [numb intValue]) {
                dif++;
        }
      }
    }
    return dif;
}

@end
