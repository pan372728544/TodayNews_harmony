
@Component
export struct TabBarLayout {
  // 字体大小
  private fontSizeNormal = 16
  // tab左右margin
  private tabMargin = 15
  // 标题列表，由父组件初始化
  @Link titleArr: string[]
  // tab标签选中position
  @Link currentIndex: number

  tabBarHeight?:number = 50;

  flexAlign?:FlexAlign = FlexAlign.Start;

  barStyle?:BarSelectStyle = BarSelectStyle.scale

  private left: number= 0
  // tab标签选中监听 父类可重写
  private tabSelected: (position: number, title: string) => void = (position: number, title: string) => {
    console.log('tabSelected position = ' + position + ', title = ' + title)
  }
  @State private tabDataArr: TabModel[] = []
  private scroller: Scroller = new Scroller()

  aboutToAppear() {
    this.tabDataArr = this.titleArr.map((title, index) => {
      let tabModel = new TabModel()
      tabModel.index = index
      tabModel.content = title
      tabModel.left = this.left
      let width = title.length * this.fontSizeNormal + this.tabMargin * 2
      tabModel.width = width
      tabModel.left = this.left
      this.left += width
      return tabModel
    })
  }

  build() {
    Scroll(this.scroller) {


      Flex({ direction: FlexDirection.Row , justifyContent: this.flexAlign }) {
        ForEach(this.tabDataArr, (item: TabModel) => {
          Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
            Text(item.content)
              .fontSize(this.currentIndex == item.index ?( this.fontSizeNormal + (this.barStyle === BarSelectStyle.normal ?0: 3 )): this.fontSizeNormal)
              .fontColor(this.currentIndex == item.index ? (this.barStyle === BarSelectStyle.normal ?Color.Black:Color.Red) : Color.Black)
              .fontWeight(this.currentIndex == item.index ? (this.barStyle === BarSelectStyle.normal ?FontWeight.Normal:FontWeight.Bold) : FontWeight.Normal)
              .textAlign(TextAlign.Center)

            Column()
              .height(3)
              .width(item.width - this.tabMargin * 2)
              .margin({ top: 10 })
              .backgroundColor(Color.Red)
              .visibility(this.currentIndex == item.index ? Visibility.Visible : Visibility.Hidden)
          }
          .width(item.width)
          .height(this.tabBarHeight)
          // .backgroundColor(0xFFFFFF)
          .onClick((event: ClickEvent) => {
            this.currentIndex = item.index
            this.scrollToCenter(item.left, item.width)
            console.log('tabSelected--------  ' + typeof (this.tabSelected))
            if (this.tabSelected instanceof Function) {
              this.tabSelected(item.index, item.content)
            }
          })
        }, item => item.index)
      }



    }
    // .scrollable(ScrollDirection.Horizontal)


  }
  // 滚动至中间位置
  scrollToCenter(itemLeft: number, itemWidth: number): void{
    console.log('scrollToCenter  itemLeft = ' + itemLeft)
    let targetOffset: number = itemLeft + itemWidth / 2 - 180
    console.log('scrollToCenter  targetOffset = ' + targetOffset)
    this.scroller.scrollTo({ xOffset: targetOffset, yOffset: 0, animation: { duration: 200, curve: Curve.EaseInOut } })
  }
}

enum BarSelectStyle {
  normal,
  scale
}


export class TabModel {
  index: number
  content: string
  left: number
  width: number
}

export {BarSelectStyle}