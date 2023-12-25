import { Constants, ResManager } from 'common';
import { DataModel, ImageList } from '../model/DataModel';
import systemTime from '@ohos.systemDateTime'

@Component
export struct LargeNewsView {
  @State itemData: DataModel = new DataModel();
  @State day: number = 0;
  @State hour: number = 0;
  @State minute: number = 0;
  @State timeShow: string = "";

  aboutToAppear() {

    systemTime.getCurrentTime(false, (error, time) => {
      let temp = time / 1000 - this.itemData.display_dt;
      this.day = Math.trunc(temp / 3600 / 24);
      this.hour = Math.trunc((temp % (3600 * 24)) / 3600);
      this.minute = Math.trunc((temp % 3600) / 60);

      if (this.day > 0) {
        this.timeShow = `${this.day}天前`;
      } else if (this.hour > 0) {
        this.timeShow = `${this.hour}小时前`;
      } else if (this.minute > 0) {
        this.timeShow = `${this.minute}分钟前`;
      }


    })

  }

  build() {

    Column() {
      Flex({ direction: FlexDirection.Column }) {
        Text(this.itemData.title)
          .fontSize(16)
          .fontColor(Color.Black)
          .fontWeight(FontWeight.Normal)
          .width('100%')
          .padding({ bottom: 5 })

        Stack() {
          Image(this.itemData.large_image_url)
            .width('100%')
            .height(200)
            .objectFit(ImageFit.Cover)
            .backgroundColor(ResManager.getDefaultBackground())
            .borderRadius(5)

          Image($r('app.media.5_Normal'))
            .height(40)
            .height(40)


        }
        .padding({ bottom: 10 })

        Row() {
          Text(this.itemData.media_name)
            .fontSize(9)
            .padding({ right: Constants.ITEM_SPACE })
          Text(`${this.itemData.comment_count}评论`)
            .fontSize(9)
            .padding({ right: Constants.ITEM_SPACE })
          Text(this.hour<1?`${this.minute}分钟前`:`${this.hour}小时前`)
            .fontSize(9)
            .padding({ right: Constants.ITEM_SPACE })

        }
      }

      Divider().color('#F0EFEF').strokeWidth(0.5)
        .padding({ top: Constants.ITEM_SPACE })
    }

    .padding({ left: Constants.ITEM_SPACE, right: Constants.ITEM_SPACE, top: Constants.ITEM_SPACE })

  }
}