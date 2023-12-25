import { authorView } from './authorView';
import { otherView } from './otherView';


@Component
export struct topBackgroundView {
  @Prop scaleValue: number;

  private backgroundHeight:number = 250;
  private linearHeight:number = 150;
  build() {

    Column() {

      Stack({ alignContent: Alignment.BottomStart }) {

        Image($r('app.media.IMG_6350'))
          .width('100%')
          .scale({ x: this.scaleValue, y: this.scaleValue })
          .height(this.backgroundHeight)
          .objectFit(ImageFit.Cover)
        Column()
          .width('100%')
          .height(this.linearHeight)
          .linearGradient({
            angle: 0,
            colors: [[0x282350, 0.4], [Color.Transparent, 1]]
          })

        authorView()
      }

      otherView()
    }

  }
}


@Component
export struct navBarView {

  @Prop opNav:number;

  @Prop colorNavBar:string;

  private navHeight:number = 56;
  build() {
    Row() {
      Stack({ alignContent: Alignment.Start }) {
        Stack() {

          Image(this.opNav === 1 ? $r('app.media.profile_scan_code_Normal') : $r('app.media.scan_icon_Normal'))
            .width(24)
            .height(24)
            .onClick(() => {

            })
        }
        .backgroundColor("#775A596A")
        .width(34)
        .height(34)
        .opacity(this.opNav === 1 ? 1 : 1 - this.opNav)
        .visibility(this.opNav === 1 ? Visibility.Hidden : Visibility.Visible)
        .borderRadius(17)
        .margin({ left: 15, right: 15 })

        Text('大眼萌机器人')
          .visibility(this.opNav === 1 ? Visibility.Visible : Visibility.Hidden)
          .margin({ left: 15, right: 15 })
          .fontWeight(FontWeight.Bold)
      }

      Blank()
      Text('+ 发布')
        .fontSize(13)
        .fontColor(this.opNav === 1 ? Color.Black : Color.White)
        .backgroundColor(this.opNav === 1 ? '#F8F7F8' : "#775A596A")
        .borderRadius(17)
        .textAlign(TextAlign.Center)
        .width(60)
        .height(34)
        .opacity(this.opNav === 1 ? 1 : 1 - this.opNav)

      Stack() {
        Image(this.opNav === 1 ? $r('app.media.sheet_set_Normal') : $r('app.media.setting_btn_icon_Normal'))
          .width(24)
          .height(24)
      }
      .backgroundColor(this.opNav === 1 ? '#F8F7F8' : "#775A596A")
      .width(34)
      .height(34)
      .opacity(this.opNav === 1 ? 1 : 1 - this.opNav)
      .borderRadius(17)
      .margin({ left: 15, right: 15 })
    }
    .width('100%')
    .height(this.navHeight)
    .backgroundColor(this.colorNavBar)
    .zIndex(1)

  }
}