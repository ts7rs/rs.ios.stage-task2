#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    
    NSMutableArray *myMutableArray = [numbersArray mutableCopy];
    NSLog(@"string %@", myMutableArray);
    NSString *joinedString = @"";
    NSString *errorString = @"";
    
    if (numbersArray.count == 0){
    return joinedString;
    }
    
    if(myMutableArray.count>4){
    return  false;
    }
    
    for (int i = 0; i<myMutableArray.count; i++) {
      if([myMutableArray[i] intValue]>255){
        errorString = @"The numbers in the input array can be in the range from 0 to 255.";
        return  errorString;
      }
    }
    
    for (int i = 0; i<myMutableArray.count; i++){
      if([myMutableArray[i] intValue]<0){
        errorString = @"Negative numbers are not valid for input.";
        return  errorString;
      }
    }
    
    if(myMutableArray.count<4){
      for (int i = 0; i<myMutableArray.count; i++) {
      NSInteger y = 4 - myMutableArray.count;
        for (int i = 1; i<= y; i++){
        [myMutableArray addObject:@"0"];
        }
      }
    }
    joinedString = [myMutableArray componentsJoinedByString:@"."];
    return joinedString;
}
@end
