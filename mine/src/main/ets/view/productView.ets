import { productModel } from '../viewmodel/productModel';


@Component
export struct productView {
  product: productModel;

  aboutToAppear() {

  }

  build() {
    Column() {

      Row() {
        Image(this.product.profile.profileImg)
          .width(40)
          .height(40)
          .borderRadius(20)
        Column() {
          Text(this.product.profile.nickName)
            .width('60%')
            .height(20)
            .fontWeight(FontWeight.Bold)
          Text(this.product.profile.time)
            .width('60%')
            .fontSize(14)
            .fontColor(0x919291)
            .height(20)

        }.margin({ left: 10 })

      }.width('100%')

      Text(this.product.text)
        .textAlign(TextAlign.Start)
        .width("100%")
        .margin({bottom:10,top:10})

      Image(this.product.icon)
        .width('100%')
        .height(200)

      this.bottomBar(this.product.commentCount,this.product.likeCount)

    }
    .margin({left:10,right:10,top:10})
  }

  @Builder
  bottomBar(commentCount:number,likeCount:number) {

    Flex({ direction: FlexDirection.Row,justifyContent:FlexAlign.SpaceBetween }) {

      this.bottomItemButton('分享', $r('app.media.hot_inner_flow_share_Normal'))
      this.bottomItemButton(commentCount===0?'评论':commentCount.toString(), $r('app.media.comment_Normal'))
      this.bottomItemButton(likeCount===0?'喜欢':likeCount.toString(), $r('app.media.digg_heart_icon_32_Normal'))
      this.bottomItemButton('收藏', $r('app.media.love_allshare_Normal'))
    }

  }

  @Builder
  bottomItemButton(text: string, img: Resource) {

    Button({ type: ButtonType.Normal, stateEffect: false }) {
      Row() {
        Image(img)
          .width(25)
          .height(25)
          .margin({ left: 12 })
        Text(text)
          .fontSize(14)
          .fontColor(Color.Black)
          .margin({ left: 5, right: 12 })
      }.alignItems(VerticalAlign.Center)
    }
    .width(90)
    .height(40)
    .backgroundColor(Color.White)

  }
}