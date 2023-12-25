import { RefreshPullView } from 'common';
import { ResManager } from 'common/src/main/ets/constants/ResManager';
import { hotListModel, LocalDataManager } from '../viewmodel/hotData';


@Component
export struct HotListView {
  private localManager: LocalDataManager = LocalDataManager.instance();
  array: Array<hotListModel> = this.localManager.queryFirstList()
  private listScroller: Scroller = new Scroller();
  private hotTitleHeight: number = 55;
  @State offsetY: number = 0;
  @State distance: number = 18;
  secondData: Array<hotListModel> = this.localManager.querySecondList()

  @Builder itemHead() {
    Row() {
      Column() {
        Column() {

          Image($r('app.media.hot_board_logo_Normal'))
            .width('25%')
            .height(20)
            .objectFit(ImageFit.Contain)
          Text('实时更新')
            .fontColor(0x979897)
            .fontSize(12)
            .margin({ top: 3 })
            .visibility(this.offsetY >= 10 ? Visibility.Hidden : Visibility.Visible)

        }
        .height(this.hotTitleHeight - (this.offsetY > 0 ? (this.offsetY >= this.distance ? this.distance : this.offsetY) : 0))
        .borderRadius(8)
        .backgroundColor(Color.White)
        .padding(10)

        Image($r('app.media.tt_arrow_container_Normal'))
          .width(27)
          .height(10)
          .offset({ y: -0.5 })
          .objectFit(ImageFit.Contain)
      }


      Column() {
        Column() {
          Text('甘肃地震')
            .fontColor(0xffffff)
            .fontSize(18)
            .fontWeight(FontWeight.Bold)

          Text('青海仍有12人失联')
            .fontColor(0xFEDDDD)
            .fontSize(12)
            .margin({ top: 3 })
            .visibility(this.offsetY >= 10 ? Visibility.Hidden : Visibility.Visible)

        }
        .borderRadius(8)
        .height(this.hotTitleHeight - (this.offsetY > 0 ? (this.offsetY >= this.distance ? this.distance : this.offsetY) : 0))
        .backgroundColor(0x99ffffff)
        .padding(10)

        Image($r('app.media.tt_arrow_container_Normal'))
          .width(27)
          .height(10)
          .offset({ y: -0.5 })
          .objectFit(ImageFit.Contain)
          .visibility(Visibility.Hidden)
      }


      Column() {
        Column() {
          Text('实时快讯')
            .fontColor(0xffffff)
            .fontSize(18)
            .fontWeight(FontWeight.Bold)

          Text('7x24小时')
            .fontColor(0xFEDDDD)
            .fontSize(12)
            .margin({ top: 3 })
            .visibility(this.offsetY >= 10 ? Visibility.Hidden : Visibility.Visible)

        }
        .borderRadius(8)
        .height(this.hotTitleHeight - (this.offsetY > 0 ? (this.offsetY >= this.distance ? this.distance : this.offsetY) : 0))
        .backgroundColor(0x99ffffff)
        .padding(10)

        Image($r('app.media.tt_arrow_container_Normal'))
          .width(27)
          .height(10)
          .offset({ y: -0.5 })
          .objectFit(ImageFit.Contain)
          .visibility(Visibility.Hidden)
      }

    }
    .zIndex(3)
    .alignItems(VerticalAlign.Center)
    .justifyContent(FlexAlign.SpaceEvenly)
    .height(this.hotTitleHeight + 25 - (this.offsetY > 0 ? (this.offsetY >= this.distance ? this.distance : this.offsetY) : 0))
    .width('100%')
    .backgroundColor(ResManager.getDefaultColor())
  }

  refreshNewsData() {

    return new Promise<string>((resolve, reject) => {

      setTimeout(() => {

        resolve("成功")

      }, 1000)

    })


  }

  @Builder ListLayout() {

    RefreshPullView({
      onRefresh: () => this.refreshNewsData(),
      ldColor:'#ffffff',
      bgColor:ResManager.getDefaultColor(),
      tipStr:'已更新到最新',
      customList: () => {
        this.getListView()
      }

    })

  }

  @Builder
  getListView(){

    Stack({ alignContent: Alignment.Top }) {

      Row()
        .height('50%')
        .width('100%')
        .backgroundColor(ResManager.getDefaultColor())


      List({ scroller: this.listScroller }) {


        ListItemGroup({ header: this.itemHead() }) {
          ForEach(this.array, (item: hotListModel, index: number) => {

            ListItem() {

              Stack({ alignContent: Alignment.Bottom }) {
                Row({ space: 8 }) {
                  if (item.icon) {
                    Image(item.icon)
                      .width(25)
                      .height(25)
                  } else {
                    Text(item.index.toString())
                      .fontSize(18)
                      .fontWeight(FontWeight.Normal)
                      .fontColor(index <= 3 ? Color.Red : Color.Black)
                      .padding({ left: 7 })

                  }
                  Text(item.text)
                    .fontSize(15)
                    .padding({ left: index === 0 ? 2 : 8 })
                  Text(item.hotWord ? item.hotWord : '')
                    .fontSize(12)
                    .padding(4)
                    .borderRadius(4)
                    .fontColor(item.color)
                    .backgroundColor(item.bgColor)

                }
                .width('100%')
                .height('100%')

                Column().width("95%")
                  .height(1)
                  .backgroundColor(0xF0F1F1)
              }
              .height('100%')

            }
            .padding({ left: 10, right: 10 })
            .width('100%')
            .height(60)
            .backgroundColor(Color.White)
            .borderRadius({
              topLeft: index === 0 ? 10 : 0,
              topRight: index === 0 ? 10 : 0,
              bottomLeft: (index === this.array.length - 1) ? 10 : 0,
              bottomRight: (index === this.array.length - 1) ? 10 : 0
            })

          }, item => item.key)


          ListItem() {
            Divider()
              .strokeWidth(5)
              .backgroundColor("#F1F2F3")
          }

          ListItem() {

            Column() {
              ForEach(this.secondData, (item: hotListModel, index: number) => {

                Row({ space: 8 }) {
                  Text(item.text)
                    .fontSize(15)
                    .padding({ left: index === 0 ? 2 : 8 })
                }
                .height(160)
                .width("100%")

              })
            }.backgroundColor(Color.White)

          }

        }

      }
      .edgeEffect(EdgeEffect.Spring)
      .sticky(StickyStyle.Header)
      .onScroll((offset, status) => {
        this.offsetY += offset;
      })

    }
  }

  build() {


    Scroll() {
      Column() {


        this.ListLayout()
      }

    }

  }
}


