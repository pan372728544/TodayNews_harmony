import { Constants } from '../constants/Constants'


@Component
export struct LoadingLayout {
  @State offsetX: number = -60;

  aboutToAppear() {

    setTimeout(()=>{
      this.offsetX+=58;

    },10)

  }

  build() {
    Stack() {
      Image($r('app.media.app_icon_old_3x_dark_Normal'))
        .width('30%')
        .height(100)
        .objectFit(ImageFit.Contain)
        .opacity(0.7)

      Image($r('app.media.novel_icon_load_mask'))
        .width('30%')
        .height(52)
        .objectFit(ImageFit.Contain)
        .opacity(0.06)
        .offset({ x: this.offsetX })
        .animation({
          duration: 800,
          curve: Curve.Linear,
          delay: 0,
          iterations: -1,
          playMode: PlayMode.Normal
        })

    }
    .backgroundColor(0xF1F3F5)
    .width(Constants.FULL_PERCENT)
    .height(Constants.FULL_PERCENT)

  }
}