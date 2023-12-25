
import router from '@ohos.router'
import {ResManager} from "common"
@Entry
@Component
struct LaunchPage {

  aboutToAppear(){
    setTimeout(()=>{
      router.replaceUrl({url:"pages/MainPage"})
    },2000)
  }

  build() {

    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {
      Column() {
        Text('看见更大的世界')
          .fontSize(36)
          .fontColor(ResManager.getDefaultColor())
      }
      .flexGrow(1)
      .justifyContent(FlexAlign.Center)

      Row() {
        Image($r('app.media.icon_29_Normal'))
          .width(48)
          .height(48)
          .objectFit(ImageFit.Contain)
          .borderWidth(0.5)
          .borderRadius(10)
          .borderColor($r('app.color.border_color'))
        Image($r('app.media.logo_label'))
          .width(100)
          .height(40)
          .objectFit(ImageFit.Contain)
          .padding({ left: 10 })
      }
      .padding({bottom:10})

      Text('火山引擎提供计算服务')
        .fontSize(10)
        .margin({ bottom: 40 })
        .fontColor(0xAAABAB)

    }
    .height('100%')
    .width('100%')
    .backgroundColor(ResManager.getDefaultBackground())

  }
}