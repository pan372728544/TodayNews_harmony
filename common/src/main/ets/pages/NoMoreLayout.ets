
import { Constants } from '../constants/Constants'


@Component
export  struct NoMoreLayout {
  build() {
    Row() {
      Text('没有更多数据了')

        .fontSize(12)
        .textAlign(TextAlign.Center)
    }
    .width(Constants.FULL_PERCENT)
    .justifyContent(FlexAlign.Center)
    .height(70)
  }


}