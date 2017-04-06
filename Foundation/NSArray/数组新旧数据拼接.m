int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSArray *newArray = [[NSMutableArray alloc] initWithObjects:@21,@20,@19,@18,@17,@16,@15,@14,@13,@12, nil];
        NSMutableArray *oldArray = [[NSMutableArray alloc] initWithObjects:@9,@8,@7,@6,@5,@4,@3,@2,@1,@0, nil];
        
        NSNumber *a = newArray[0];
        NSNumber *b = oldArray[0];
        
        int cha = a.intValue - b.intValue;
        if (cha>10) {
            // 移除原来数组，添加新的数据
            [oldArray removeAllObjects];
            [oldArray addObjectsFromArray:newArray];
             NSLog(@"%@",oldArray);
            return 0;
        }else if (cha == 0){
            NSLog(@"不做任何操作");
            return 0;
        }else if (cha <= 10) {
            
            for (int i = 0; i < cha; i++) {
                [oldArray insertObject:newArray[cha - 1 - i] atIndex:0];
                
            }
        }
        NSLog(@"%@",oldArray);
    }
    return 0;
}