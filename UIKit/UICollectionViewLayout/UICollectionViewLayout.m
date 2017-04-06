// 准备方法被自动调用，以保证layout实例的正确。
- (void)prepareLayout{

    // 必须 调用父类
    [super prepareLayout];

    //设置滚动方向
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;

    //设置cell 的大小
    CGFloat itemWH = self.collectionView.frame.size.height  * 0.7;

    self.itemSize = CGSizeMake(itemWH, itemWH);

    //设置内边距
    CGFloat inset = (self.collectionView.frame.size.width - self.itemSize.width) * 0.5;

    self.sectionInset = UIEdgeInsetsMake(0, inset, 0, inset);
}


// 返回 collectionView 的内容的尺寸
-(CGSize)collectionViewContentSize;


// 返回 CollectionView 上面 所有元素的布局属性
// 1.返回rect中的所有的元素的布局属性
// 2.返回的是包含UICollectionViewLayoutAttributes的NSArray
// 3.UICollectionViewLayoutAttributes可以是cell，追加视图或装饰视图的信息，通过不同的UICollectionViewLayoutAttributes初始化方法可以得到不同类型的UICollectionViewLayoutAttributes：
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {

    // 调用父类方法 拿到默认的布局 属性
    NSArray *array = [super layoutAttributesForElementsInRect:rect];

    //获得CollectionView中点 的x值
    CGFloat centerX = self.collectionView.contentOffset.x + self.collectionView.frame.size.width * 0.5;

    //在默认的布局属相的基础上进行 调整
    for (UICollectionViewLayoutAttributes *attrs in array) {

        // 计算 cell 中点 x 到 CollectionvIEW Z的值
        CGFloat delta = ABS(attrs.center.x - centerX);

        // 根据距离计算缩放比例  成反比

        CGFloat scale = 1 - delta / (self.collectionView.frame.size.width + self.itemSize.width);

        attrs.transform = CGAffineTransformMakeScale(scale, scale);

    }
    return array;
}

// 获得最终的偏移量
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity;

// 返回对应于indexPath的位置的cell的布局属性
-(UICollectionViewLayoutAttributes )layoutAttributesForItemAtIndexPath:(NSIndexPath )indexPath;

// 返回对应于indexPath的位置的追加视图的布局属性，如果没有追加视图可不重载
-(UICollectionViewLayoutAttributes )layoutAttributesForSupplementaryViewOfKind:(NSString )kind atIndexPath:(NSIndexPath *)indexPath;

// 返回对应于indexPath的位置的装饰视图的布局属性，如果没有装饰视图可不重载
-(UICollectionViewLayoutAttributes * )layoutAttributesForDecorationViewOfKind:(NSString)decorationViewKind atIndexPath:(NSIndexPath )indexPath;

// 当边界发生改变时，是否应该刷新布局。如果YES则在边界变化（一般是scroll到其他地方）时，将重新计算需要的布局信息。
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds;
