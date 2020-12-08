/// 垂直的虚线， setNeedsDisplay() 重新绘制
class WSVLineView: UIView {
    
    var lineLength: CGFloat = 3
    var lineSpacing: CGFloat = 3
    var lineColor: UIColor = UIColor.hex("0xDBDBDB")
    
    override func draw(_ rect: CGRect) {
        
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.beginPath()
        context.setLineWidth(1)
        context.setStrokeColor(lineColor.cgColor)
        context.setLineDash(phase: 0, lengths: [lineLength, lineSpacing])
        context.move(to: .zero)
        context.addLine(to: CGPoint(x: 0, y: self.bounds.height))
        context.strokePath()
        context.closePath()
    }
}