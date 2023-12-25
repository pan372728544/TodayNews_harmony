@Component
export struct authorView {
  build() {
    Row() {
      Image($r('app.media.avatar'))
        .borderRadius(40)
        .borderWidth(2)
        .borderColor(Color.White)
        .height(80)
        .width(80)
        .backgroundColor(Color.White)
      Column({ space: 8 }) {
        Text("大眼萌机器人")
          .fontColor(Color.White)
          .fontWeight(FontWeight.Bold)
          .fontSize(18)
        Text() {
          Span("688")
            .fontColor(Color.White)
            .fontColor(Color.White)
            .fontWeight(FontWeight.Bold)
            .fontSize(18)
          Span("  关注")
            .fontColor(Color.White)
            .fontSize(14)
          Span("  |  ")
            .fontColor(Color.White)
            .fontSize(14)
          Span("88")
            .fontColor(Color.White)
            .fontColor(Color.White)
            .fontWeight(FontWeight.Bold)
            .fontSize(18)
          Span("  粉丝")
            .fontColor(Color.White)
            .fontSize(14)
          Span("  |  ")
            .fontColor(Color.White)
            .fontSize(14)
          Span("10万")
            .fontColor(Color.White)
            .fontWeight(FontWeight.Bold)
            .fontSize(18)
          Span("  获赞")
            .fontColor(Color.White)
            .fontSize(14)
        }

      }.alignItems(HorizontalAlign.Start)
      .margin({ left: 15 })
    }.margin({ left: 15 })
  }
}
