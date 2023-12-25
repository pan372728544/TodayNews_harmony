import { DataModel } from '../model/DataModel'
import NewsDataViewModel from '../viewmodel/NewsDataViewModel'
import systemTime from '@ohos.systemDateTime'
import { FailureLayout, LoadingLayout, RefreshPullView, ResponseResult } from 'common';
import { PageState } from 'common/src/main/ets/constants/Constants';
import { TopNewsView } from './TopNewsView';
import { MoreNewsView } from './MoreNewsView';
import { MiddleNewsView } from './MiddleNewsView';
import { LargeNewsView } from './LargeNewsView';
import router from '@ohos.router';


@Component
export default struct NewsDataList {
  @Watch('changeCategory') @Link categoryId: number;
  pageIndex: number;
  @State dataList: Array<DataModel> = [];
  @State currentPage: number = 1;
  @State pageCount: number = 20;
  @State timeStamp: number = 0;
  @State count: number = 0;
  @State responseData: ResponseResult = new ResponseResult();
  @State aaa: string = '000';
  @State ccc: number = 0;
  scroller: Scroller = new Scroller();
  @State tipCount: number = 0;
  @State pageState: PageState = PageState.Loading;

  changeCategory() {

    if (this.categoryId === this.pageIndex) {
      this.refreshNewsData();
    }

  }

  aboutToAppear() {

    if (this.categoryId === 0 && this.pageIndex === 0) {
      this.refreshNewsData();
    }
  }

  refreshNewsData() {

    return new Promise<string>((resolve, reject) => {
      NewsDataViewModel.getNewsList(this.currentPage, this.categoryId)
        .then((data: ResponseResult) => {
          this.pageState = PageState.Success;
          this.responseData = data;
          this.dataList = data.data as Array<DataModel>;
          this.tipCount = this.dataList.length;
          resolve('刷新成功')
        }).catch(() => {
        resolve('')
      })

    })


  }

  loadMoreNewsData() {

    return new Promise<string>((resolve, reject) => {
      systemTime.getCurrentTime(false, (error, time) => {
        this.timeStamp = Math.trunc(time / 1000);
        NewsDataViewModel.getNewsList(this.currentPage, this.pageCount, this.timeStamp)
          .then((value: ResponseResult) => {
            this.responseData = value;
            let temp = value.data as Array<DataModel>;
            this.dataList = this.dataList.concat(temp);
            resolve('刷新成功')
          }).catch(() => {
          resolve('')
        })
      })

    })
  }

  @Builder
  private getListView() {

    List({ scroller: this.scroller }) {
      ForEach(this.dataList, (item: DataModel) => {
        ListItem() {
          // 置顶
          if (item.label) {
            TopNewsView({ itemData: item })

          } else if (item.more_mode === true) {
            // 三图
            MoreNewsView({ itemData: item })
          }
          else if (item.middle_mode === true) {
            // 右侧有图
            MiddleNewsView({ itemData: item })
          }
          else if (item.large_mode === true) {
            // 视频
            LargeNewsView({ itemData: item })
          }
          //
          else {
            Text(item.title)
              .height(100)
          }

        }
        .onClick(()=>{
          router.pushUrl({url:"@bundle:com.news.today/home/ets/pages/DetailPage",params:item})

        })
      }, item => JSON.stringify(item))

    }
    .backgroundColor(Color.White)

  }

  @Builder ListLayout() {

    RefreshPullView({
      dataCount: this.tipCount,
      onRefresh: () => this.refreshNewsData(),
      onLoadMore: () => this.loadMoreNewsData(),
      customList: () => {
        this.getListView()
      }

    })

  }

  build() {

    Column() {

      if (this.pageState === PageState.Loading) {
        // 加载页面
        LoadingLayout()

      } else if (this.pageState === PageState.Success) {

        Stack() {
          // 数据列表页面
          this.ListLayout()
        }

      } else {

        // 加载失败页面
        FailureLayout({ reloadAction: () => {
          this.loadMoreNewsData()
        } })
      }

    }

  }
}