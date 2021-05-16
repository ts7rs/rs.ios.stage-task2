#import "ReverseBinary.h"

UInt8 ReverseInteger(UInt8 n){
    
    NSUInteger decimalNumber = n;
    int index = 0;
    NSString *binary = @"";
    while (decimalNumber > 0) {
        binary = [[NSString stringWithFormat:@"%lu", decimalNumber&1] stringByAppendingString:binary];
        decimalNumber = decimalNumber>> 1;
        ++index;
    }
    
    NSInteger y = 8 - binary.length;
    NSString *binary2 = @"";
    
    for (int i = 1; i<= y; i++){
        binary2 = [@"0" stringByAppendingString:binary2];
    }
    
    binary2 = [binary2 stringByAppendingString:binary];
    
    NSMutableString *reverseString = [[NSMutableString alloc] initWithCapacity:binary2.length];
    for(long i=binary2.length -1;i>=0;i--) {
      [reverseString appendString:[NSString stringWithFormat:@"%c", [binary2 characterAtIndex:i]]];
    }

    long v = strtol([reverseString UTF8String], NULL, 2);
    long intNumber = v;
    return  intNumber;
}
