import { IconButtonModel } from '../viewmodel/IconButtonModel'
import { IconButton } from './IconButton'

@Component
export struct otherView {
  otherHeight:number = 150;
  build() {
    Column() {
      Text("对未来的真正慷慨，是把一切都献给现在。")
        .width('100%')
        .fontColor(Color.White)
        .padding({ top: 18, bottom: 10 })
      Text("IP 归属：北京 >")
        .width('100%')
        .fontColor('#C2BFC7')
        .padding({ bottom: 10 })
      Text("+添加年龄、学校标签")
        .fontColor(Color.White)
        .fontSize(14)
        .backgroundColor('#555A596A')
        .borderRadius(5)
        .padding(3)

      Row({ space: 10 }) {
        Button('申请认证', { type: ButtonType.Normal })
          .borderRadius(5)
          .fontWeight(FontWeight.Bold)
          .backgroundColor('#555A596A')
          .height(30)
          .width(90)
          .onClick(() => {
          })
        Button('编辑资料', { type: ButtonType.Normal })
          .borderRadius(5)
          .fontWeight(FontWeight.Bold)
          .backgroundColor('#555A596A')
          .height(30)
          .width(90)
          .onClick(() => {
          })
        Button({ type: ButtonType.Normal }) {
          Image($r('app.media.share_btn_Normal'))
            .margin(2)

        }
        .backgroundColor('#555A596A')
        .borderRadius(5)
        .height(30)
        .width(30)
      }
      .width('100%')
      .padding({ bottom: 18, top: 10 })
    }
    .height(this.otherHeight)
    .alignItems(HorizontalAlign.Start)
    .padding({ left: 15 })
    .backgroundColor(0x282350)
    .width('100%')
  }
}


@Component
export struct iconDockView {
  buttons: IconButtonModel[];

  @Styles
  cardStyle(){
    .height(110)
    .width('100%')
  }

  build() {
    Column() {
      Grid() {
        ForEach(this.buttons, (iconButton: IconButtonModel) => {
          GridItem() {
            IconButton({
              props: iconButton
            })
          }
        }, (iconButton: IconButtonModel[]) => JSON.stringify(iconButton))
      }
      .columnsTemplate('1fr 1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .cardStyle()

    }.margin({ top: 10, bottom: 10 })
  }
}