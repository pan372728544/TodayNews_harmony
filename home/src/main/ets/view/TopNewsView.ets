
import { ResManager } from 'common/src/main/ets/constants/ResManager';
import { DataModel } from '../model/DataModel';

@Component
export  struct TopNewsView{

  @State itemData: DataModel = new DataModel();


  build(){

    Column(){
      Text(this.itemData.title)
      .fontSize(16)
      .fontColor(Color.Black)
      .fontWeight(FontWeight.Normal)
      Row(){
        Text(this.itemData.label)
          .fontColor(ResManager.getDefaultColor())
          .fontSize(9)
          .padding({right:10})
        Text(this.itemData.media_name)
          .fontSize(9)
          .padding({right:10})
        Text(`${this.itemData.comment_count}评论`)
          .fontSize(9)
          .padding({right:10})

      }.padding({top:2})

    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .backgroundColor(Color.White)
    .padding({ top:10,left:10,right:10})

  }

}