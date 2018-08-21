NSAttributedString *attr = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@\n",message]];
[[self.logTextView textStorage] appendAttributedString:attr];