#import <Foundation/Foundation.h>

void method1(NSArray *numbers)
{
	NSArray *sorted = [numbers sortedArrayUsingSelector:@selector(compare:)];
}

void method2(NSArray *numbers)
{
	NSNumber *max=[numbers valueForKeyPath:@"@max.doubleValue"];
	NSNumber *min=[numbers valueForKeyPath:@"@min.doubleValue"];
}

void method3(NSArray *numbers)
{
	NSNumber *max=[numbers valueForKeyPath:@"@max.self"];
	NSNumber *min=[numbers valueForKeyPath:@"@min.self"];
}

void method4(NSArray *numbers)
{
	float xmax = -MAXFLOAT;
	float xmin = MAXFLOAT;
	for (NSNumber *num in numbers) {
		float x = num.floatValue;
		if (x < xmin) xmin = x;
		if (x > xmax) xmax = x;
	}
}

void method5(NSArray *numbers)
{
	__block float xmax = -MAXFLOAT;
	__block float xmin = MAXFLOAT;
	[numbers enumerateObjectsUsingBlock:^(NSNumber *num, NSUInteger idx, BOOL *stop) {
		float x = num.floatValue;
		if (x < xmin) xmin = x;
		if (x > xmax) xmax = x;
	}];
}


int main(int argc, const char * argv[])
{
	int numruns = 30;
	int numrepeat = 3;
	float t1 = 0, t2 = 0, t3 = 0, t4 = 0, t5 = 0;
	for (int run = 0; run < numruns; run++) {
		printf("run = %d\n", run);
		@autoreleasepool {
			NSMutableArray *numbers = [NSMutableArray array];
			for (int i = 0; i < 1000000; i++)
				[numbers addObject:@(arc4random_uniform(10000)/100.)];

			NSDate *start;
			start = [NSDate date];
			for (int rep = 0; rep < numrepeat; rep++)
				method1(numbers);
			t1 -= [start timeIntervalSinceNow]/numrepeat;

			start = [NSDate date];
			for (int rep = 0; rep < numrepeat; rep++)
				method2(numbers);
			t2 -= [start timeIntervalSinceNow]/numrepeat;

			start = [NSDate date];
			for (int rep = 0; rep < numrepeat; rep++)
				method3(numbers);
			t3 -= [start timeIntervalSinceNow]/numrepeat;

			start = [NSDate date];
			for (int rep = 0; rep < numrepeat; rep++)
				method4(numbers);
			t4 -= [start timeIntervalSinceNow]/numrepeat;

			start = [NSDate date];
			for (int rep = 0; rep < numrepeat; rep++)
				method5(numbers);
			t5 -= [start timeIntervalSinceNow]/numrepeat;
		}
	}

	printf("Sorting      %.3f\n", t1/numruns);
	printf("KVO1         %.3f\n", t2/numruns);
	printf("KVO2         %.3f\n", t3/numruns);
	printf("Fast enum    %.3f\n", t4/numruns);
	printf("Block enum   %.3f\n", t5/numruns);
    return 0;
}

/* Output:
Sorting      1.404
KVO1         1.087
KVO2         0.367
Fast enum    0.017
Block enum   0.021
*/