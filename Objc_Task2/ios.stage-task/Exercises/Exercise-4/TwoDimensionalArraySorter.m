#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    
    NSMutableArray *myMutableArray = [[NSMutableArray alloc] init];
    NSMutableArray *arrayStrings = [[NSMutableArray alloc] init];
    NSMutableArray *arrayNumbers = [[NSMutableArray alloc] init];
    
    if(array == nil){
      return @[];
    }
    
    for(NSArray *subArray in array){
      if(![subArray isKindOfClass:NSArray.class]){
        return @[];
      }
      for (id item in subArray){
        if ([item isKindOfClass:NSNumber.class]){
          [arrayNumbers addObject:item];
        } else {
            [arrayStrings addObject:item];
        }
      }
    }
    
    if(arrayNumbers.count && arrayStrings.count == 0){
      [arrayNumbers sortUsingSelector:@selector(compare:)];
      [myMutableArray addObject:arrayNumbers];
    }
    
    if(arrayStrings.count && arrayNumbers.count == 0){
      [arrayStrings sortUsingSelector:@selector(compare:)];
      [myMutableArray addObject:arrayStrings];
    }
    
    if(arrayStrings.count && arrayNumbers.count){
      NSSortDescriptor* sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO selector:@selector(localizedCompare:)];
      [arrayStrings sortUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
      [arrayNumbers sortUsingSelector:@selector(compare:)];
      [myMutableArray addObject:arrayNumbers];
      [myMutableArray addObject:arrayStrings];
    }
    
    if(myMutableArray.count>1){
      return myMutableArray;
    } else {
      return myMutableArray[0];
    }
    return @[];
}
@end
