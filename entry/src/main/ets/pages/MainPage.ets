import { tabBarInfoList, TabBarInfoModel } from '../Model/TabBarInfoModel'
import { VideoPage } from 'video'
import { MinePage } from 'mine'
import { HomePage } from 'home'

@Entry
@Component
struct MainPage {
  @State currentPageIndex: number = 0;

  build() {

    Column() {

      Tabs({ barPosition: BarPosition.End }) {
        ForEach(tabBarInfoList, (item: TabBarInfoModel, index: number) => {
          TabContent() {
            if (index === 0) {
              HomePage()
            } else if (index === 1) {
              VideoPage({ tabCurrentIndex: $currentPageIndex })
            } else if (index === 2) {

            } else if (index === 3) {
              MinePage()
            }

          }.tabBar(this.BottomNavigation(tabBarInfoList[index]))
        }, item => JSON.stringify(item))
      }
      .barWidth('100%')
      .barHeight(56)
      .scrollable(false)

      .onChange((index: number) => {
        this.currentPageIndex = index;
      })

    }
    .backgroundColor(this.currentPageIndex === 1 ? Color.Black : Color.White)

  }

  @Builder BottomNavigation(button: TabBarInfoModel) {
    Column({ space: 6 }) {
      Image(this.currentPageIndex === button.index ? button.selectImg : (this.currentPageIndex===1?button.whiteImg:button.normalImg))
        .objectFit(ImageFit.Contain)
        .width(24)
        .height(24)
      Text(button.title)
        .fontColor(this.currentPageIndex === button.index ? '#e92f4f' : (this.currentPageIndex===1?Color.White:Color.Black))
        .opacity(this.currentPageIndex === button.index ? 1 : 0.6)
        .fontWeight(500)
        .textAlign(TextAlign.Center)
        .fontSize(10)
    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
    .border({ width: { top: 0.5 }, color: { top: '#5C000000' }, style: { top: BorderStyle.Solid } })
  }
}