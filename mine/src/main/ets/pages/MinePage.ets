import { iconDockView, otherView } from '../view/otherView'
import { productLayout } from '../view/productLayout'
import { BarSelectStyle, TabBarLayout } from '../view/TabBarLayout'
import { navBarView, topBackgroundView } from '../view/topBackgroundView'
import { memberButton, swiperImage } from '../viewmodel/mineData'

@Entry
@Component
export struct MinePage {
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  scroller: Scroller = new Scroller()
  @State colorNavBar: string = 'rgba(255,255,255,0)'
  @State offsetY: number = 0
  @State opNav: number = 0;
  @State scaleValue: number = 1
  @State titleArr: string[] = ['作品', '收藏']
  @State currentIndex: number = 0
  tabHeight: number = 50
  private scrollY: number = 0
  @State headerHeight: number = (250 + 150 + 130 + 110 + 5)
  @State tabPosY: number = this.headerHeight
  navHeight: number = 56;
  private swiperController: SwiperController = new SwiperController()
  @State listPosition: number = 0;

  @Builder
  CustomSwiper() {
    Swiper() {
      ForEach(swiperImage, (item: Resource) => {
        Image(item)
          .width('100%')
          .objectFit(ImageFit.Cover)
          .backgroundColor(Color.White)
      }, (item: Resource) => JSON.stringify(item))
    }
    .autoPlay(true)
    .indicatorStyle({ selectedColor: Color.White, right: 10 })
    .height(100)
    .margin({ left: 15, right: 15, bottom: 10 })
  }

  build() {

    Stack({ alignContent: Alignment.Top }) {


      navBarView({ opNav: this.opNav, colorNavBar: this.colorNavBar })

      TabBarLayout({
        titleArr: $titleArr,
        currentIndex: $currentIndex,
        tabBarHeight: this.tabHeight,
        flexAlign:FlexAlign.Center,
        barStyle:BarSelectStyle.normal,
        tabSelected: (position: number, title: string) => {

        }
      })
        .width('100%')
          // .markAnchor({ x: 0, y: 0 })
        .position({ y: this.tabPosY, x: 0 })
        .backgroundColor(Color.White)
        .zIndex(2)


      Scroll(this.scroller) {
        Column() {

          topBackgroundView({ scaleValue: this.scaleValue })
          iconDockView({ buttons: memberButton })
          this.CustomSwiper()

          Row().height(10)
            .backgroundColor(0xF2F1F2)
            .width('100%')


          Swiper(this.swiperController) {
            ForEach(this.titleArr, (item) => {
              Column() {
                // Text('Page ' + item).fontSize(25).margin(10)
                productLayout({ currentIndex: $currentIndex })
              }

            }, item => item)
          }
          .index(0)
          .autoPlay(false)
          .indicator(false) // 默认开启指示点
          .loop(false) // 默认开启循环播放
          .vertical(false) // 默认横向切换
          .itemSpace(0)
          .index(this.currentIndex)
          .margin({ top: this.tabHeight })
          .flexGrow(1)
          .width('100%')
          .onChange((index: number) => {
            console.info(index.toString())
            this.currentIndex = index
          })

        }.width('100%')

      }.onScroll((xOffset: number, yOffset: number) => {

        this.offsetY = this.scroller.currentOffset().yOffset;
        if (this.offsetY < 0) {
          this.scaleValue = (Math.abs(this.offsetY) + 100) / 100;
        } else {
          this.scaleValue = 1
        }
        if (this.offsetY >= 56) {
          this.offsetY = 56
        }
        this.opNav = this.offsetY / 56;
        this.colorNavBar = `rgba(255,255,255,${this.opNav})`


        this.scrollY += yOffset
        console.log('=====sss===' + this.scrollY + "==" + (this.headerHeight))
        this.tabPosY = this.headerHeight - this.navHeight - this.scrollY <= 0
          ? this.navHeight : this.headerHeight - this.scrollY

      })
      .edgeEffect(EdgeEffect.Spring)
      .scrollBar(BarState.Off)

    }

  }
}