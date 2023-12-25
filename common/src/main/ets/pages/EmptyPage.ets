
import { ResManager } from '../constants/ResManager'
@Component
export struct EmptyPage {
  @State message: string = '空页面'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .fontColor(ResManager.getDefaultColor())

      }
      .width('100%')
    }
    .backgroundColor(Color.White)
    .height('100%')
  }
}