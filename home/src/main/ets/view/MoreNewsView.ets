import { Constants, ResManager } from 'common';
import systemTime from '@ohos.systemDateTime'
import { DataModel, ImageList } from '../model/DataModel';
import systemDateTime from '@ohos.systemDateTime';

@Component
export struct MoreNewsView {
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
      let aa;

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
      Text(this.itemData.title)
        .fontSize(16)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Normal)
        .width('100%')
        .padding({ bottom: 5 })

      Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween }) {
        ForEach(this.itemData.image_list, (item: ImageList, index: number) => {
          Image(item.url)
            .width('33%')
            .height(80)
            .backgroundColor(ResManager.getDefaultBackground())
            .objectFit(ImageFit.Cover)
            .borderRadius({
              topLeft: index === 0 ? 5 : 0,
              bottomLeft: index === 0 ? 5 : 0,
              topRight: index === this.itemData.image_list.length - 1 ? 5 : 0,
              bottomRight: index === this.itemData.image_list.length - 1 ? 5 : 0
            })

        })

      }.padding({ bottom: 5 })

      Row() {
        Text(this.itemData.media_name)
          .fontSize(9)
          .padding({ right: Constants.ITEM_SPACE })
        Text(`${this.itemData.comment_count}评论`)
          .fontSize(9)
          .padding({ right: Constants.ITEM_SPACE })
        Text(this.timeShow)
          .fontSize(9)
          .padding({ right: Constants.ITEM_SPACE })

      }


      Divider().color('#F0EFEF').strokeWidth(0.5)
        .padding({ top: Constants.ITEM_SPACE })

    }
    .padding({ left: Constants.ITEM_SPACE, right: Constants.ITEM_SPACE, top: Constants.ITEM_SPACE })
    .alignItems(HorizontalAlign.Start)

  }
}