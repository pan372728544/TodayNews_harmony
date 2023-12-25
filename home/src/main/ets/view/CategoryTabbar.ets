import categoryTitleViewModel from '../viewmodel/CategoryTitleViewModel'
import display from '@ohos.display';
import NewsDataList from './NewsDataList';
import { EmptyPage, FailureLayout, ResManager, TabBarLayout } from 'common';
import promptAction from '@ohos.promptAction';
import { HotListView } from './HotListView';

@Component
export default struct CategoryTabBar {
  @State tabBarArray: string[] = categoryTitleViewModel.getDefaultCategoryList();
  @State currentIndex: number = 0;
  @State displayWidth: number = 0;
  @Link needChange: boolean;


  aboutToAppear() {

    let displayClass = display.getDefaultDisplaySync();

    this.displayWidth = px2vp(displayClass.width);

  }

  @Builder
  newsListView(index: number) {
    if (index === 0) {
      NewsDataList({ categoryId: $currentIndex, pageIndex: 0 })
    } else if (index === 1) {
      HotListView()
    } else {
      Column(){
        FailureLayout()
      }
    }

  }

  @Builder
  rightView() {
    Image(this.needChange ? $r('app.media.right_more_icon_Normal') : $r('app.media.toolbar_more_new_Normal'))
      .height(50)
      .objectFit(ImageFit.Contain)
      .width(50 + 10)
      .zIndex(2)
      .padding({ left: 30, right: 10, top: 15, bottom: 15 })
      .linearGradient({
        angle: 90,
        colors: [[this.needChange ? 0x44FE5756 : 0x44ffffff, 0.2], [this.needChange ? 0xFE5756 : Color.White, 0.5], [this.needChange ? 0xFE5756 : Color.White, 1]]
      })
      .onClick(() => {
        promptAction.showToast({
          message: '点击了分类按钮',
          duration: 2000,
        });

      })
  }

  build() {

    Scroll() {
      Flex({ direction: FlexDirection.Column }) {
        TabBarLayout({
          titleArr: $tabBarArray,
          offsetHeight: 56 + 60,
          colorChangeIndex: 1,
          bgChangeColor: ResManager.getDefaultColor(),
          fontChangeSelectedColor: "#FDE1E0",
          fontChangeNormalColor: "#FFFFFF",
          rightView: () => {
            this.rightView()
          },
          customList: ({index}) => {
            this.newsListView(index)


          },
          changeColor: (changeColor: boolean) => {
            this.needChange = changeColor;
          },
          tabSelected: (position: number, title: string) => {

            promptAction.showToast({
              message: `点击了第 ${position} 页面，标题为：${title}`,
              duration: 2000,
            });

          }
        })
      }

    }
  }
}