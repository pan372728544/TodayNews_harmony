
import { Constants } from '../constants/Constants';
import { ResManager } from '../constants/ResManager';


@Component
export  struct FailureLayout {
  reloadAction = () => {};

  build() {
    Column() {
      Image($r('app.media.wifi_Normal'))
        .height(80)
        .width(80)
        .objectFit(ImageFit.Contain)
      Text('网络不给力')
        .opacity(0.6)
        .fontSize(12)
        .fontColor(0x182431)
        .margin({ top: 12 ,bottom:12})
      Text('重试')
        .borderRadius(3)
        .borderWidth(1)
        .borderColor(ResManager.getDefaultColor())
        .fontSize(12)
        .fontColor(ResManager.getDefaultColor())
        .padding(5)
        .onClick(this.reloadAction)
        .textAlign(TextAlign.Center)
    }
    .margin({top:100})
    .backgroundColor(Color.White)
    .width(Constants.FULL_PERCENT)
    .height(Constants.FULL_PERCENT)
    .justifyContent(FlexAlign.Start)
  }
}