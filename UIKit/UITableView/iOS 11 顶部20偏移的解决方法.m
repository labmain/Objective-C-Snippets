if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 11.0) {
        self.sScrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }

self.automaticallyAdjustsScrollViewInsets = NO;