NSInteger i = [wordArray count];
while (--i > 0) {
    int j = rand() % (i+1);
    [wordArray exchangeObjectAtIndex:i withObjectAtIndex:j];
}