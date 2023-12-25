
import { Constants } from '../constants/Constants';


@Component
export  struct LoadMoreLayout {
  @State offsetX: number = -60;
  aboutToAppear() {

    setTimeout(()=>{
      this.offsetX+=100;

    },10)

  }

  build() {
    Stack() {


      Text('正在努力加载')
        .fontSize(12)
        .textAlign(TextAlign.Center)

      Image($r('app.media.load_more_light_Normal'))
        .width(100)
        .height(52)
        .objectFit(ImageFit.Contain)
        .opacity(1)
        .offset({ x: this.offsetX })
        .animation({
          duration: 800,
          curve: Curve.Linear,
          delay: 0,
          iterations: -1,
          playMode: PlayMode.Normal
        })
    }
    .clip(true)
    .width(Constants.FULL_PERCENT)
    .height(50)
  }
}