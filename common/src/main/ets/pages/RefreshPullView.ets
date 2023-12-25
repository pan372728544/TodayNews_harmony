import display from '@ohos.display';
import { LoadState, RefreshState } from '../constants/Constants';
import { ResManager } from '../constants/ResManager';
import { LoadMoreLayout } from './LoadMoreLayout';


@Component
export struct RefreshPullView {

  // 列表数据个数
  dataCount: number = 0;
  // 控制器
  scroller: Scroller = new Scroller();
  @BuilderParam customList?: () => void;
  // 刷新控件高度
  @State refreshHeight: number = 50
  // 刷新图标的宽度
  @State  refreshLogoWidth?: number = 26;
  // 刷新图标的高度
  @State  refreshLogoHeight?: number = 13;
  // 菱形的高度差
  @State  heightDifference?: number = 3;
  // 屏幕宽度
  @State  screenWidth?: number = 0;
  // 提示语信息
  @State  tipStr?: string = "";
  // 需要改变的背景颜色
  @State bgColor:string = '#ffffff'
  // 需要改变的loading颜色
  @State ldColor:string = ResManager.getDefaultColor()
  // 刷新视图的偏移量
  @State private topRefreshOffsetY: number = 0;
  // 达到条件是，列表的偏移量
  @State private listOffsetY: number = 0;
  // 定时器
  private timer?: number;
  // 提示的透明度
  @State private tipOpacity: number = 0;
  // 画布的透明度
  @State private canvasOpacity: number = 1;
  // 刷新成功提示文本的偏移量
  @State private tipsOffsetY: number = 30;
  // 加载更多数据的状态
  public loadState: LoadState = LoadState.Idle;
  // 下拉刷新的的状态
  public refreshState: RefreshState = RefreshState.Idle;
  // 下拉滑动的总的偏移量
  @State scrollY:number = 0;
  // 正在刷新的回调
  onRefresh?: () => Promise<string> = () => {
    return new Promise<string>((resolve, reject) => {
      setTimeout(() => {
        resolve('刷新失败');
      }, 1000);
    });
  };
  // 加载更多的回调
  onLoadMore?: () => Promise<string> = () => {
    return new Promise<string>((resolve, reject) => {
      setTimeout(() => {
        resolve('');
      }, 1000);
    });
  };

  // 设置画布的参数
  private canvasSetting?: RenderingContextSettings = new RenderingContextSettings(true);
  private canvasRefresh?: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.canvasSetting);
  private panOption: PanGestureOptions = new PanGestureOptions({ direction: PanDirection.Up | PanDirection.Down })


  aboutToAppear() {
    // 获取屏幕宽度
    let displayClass = display.getDefaultDisplaySync();
    this.screenWidth = px2vp(displayClass.width);
  }

  // 初始化画布
  private initCanvas(): void {

    this.canvasRefresh.strokeStyle = this.ldColor as string;
    this.canvasRefresh.lineWidth = 1;
  }


  build() {

    Stack({ alignContent: Alignment.TopStart }) {
      Stack() {
        // 刷新视图
        Canvas(this.canvasRefresh)
          .width('100%')
          .height('100%')
          .onReady(() => {
            this.initCanvas()
          })
          .opacity(this.canvasOpacity)

        Text(this.tipStr?this.tipStr:`免流中，今日头条推荐引擎数据有${this.dataCount}条更新`)
          .fontSize(10)
          .backgroundColor(0xf1f3f5)
          .borderRadius(20)
          .padding({ left: 10, right: 10, top: 8, bottom: 8 })
          .opacity(this.tipOpacity)
          .offset({ y: this.tipsOffsetY })
      }
      .width('100%')
      .height(this.refreshHeight)
      .offset({ y: this.topRefreshOffsetY })

      Scroll(this.scroller) {
        Column() {
          Column() {
            // 内容列表
            if (this.customList !== undefined) {
              this.customList()
            }
          }
          .offset({ y: this.listOffsetY })
          // 底部的正在加载
          LoadMoreLayout()
        }
      }
      .edgeEffect(EdgeEffect.Spring)
      .onScrollEdge((side: Edge) => {
        // 滚动到底部，显示底部的正在加载
        if (side === Edge.Bottom) {

          if (this.loadState === LoadState.Loading) {
            return;
          }

          // 加载事件
          if (this.onLoadMore !== undefined) {
            this.loadState = LoadState.Loading;
            this.onLoadMore().then((loadText) => {
              this.loadState = LoadState.Idle;
            });
          }
        }

      })
      .onScroll((xOffset: number, yOffset: number) => {
        this.scrollY += yOffset
      })
    }
    .backgroundColor(this.bgColor)
    .height('100%')
    .parallelGesture(
      // 下拉手势处理
      PanGesture(this.panOption)
        .onActionUpdate((event: GestureEvent) => {
          // 下拉滑动中处理
          if (event !== undefined) {
            if (this.refreshState === RefreshState.Refreshing) {
              return;
            }
            if (this.scroller.currentOffset().yOffset <= 0) {
              this.onActionUpdate(event);
            }
          }
        })
        .onActionEnd((event: GestureEvent) => {
          // 下拉结束
          if (event !== undefined) {
            if (this.refreshState === RefreshState.Refreshing) {
              return;
            }
            if (this.scroller.currentOffset().yOffset <= 0) {
              this.onActionEnd();
            }
          }
        })
    )
  }

  private onActionEnd(): void {
    // 下拉结束 达到刷新要求
    if (Math.abs(this.scrollY) >= this.refreshHeight) {
      // 更新状态
      this.refreshState = RefreshState.Refreshing;
      this.topRefreshOffsetY = 0;
      this.listOffsetY = this.refreshHeight

      // 绘制刷新中的画布，计时器动态更新各顶点坐标位置
      this.drawLoadingView()

      // 刷新中的回调
      if (this.onRefresh !== undefined) {
        this.onRefresh().then((text) => {
          this.refreshState = RefreshState.Success;
          this.closeRefresh()
        })
      }
    } else {
      // 没有达到刷新要求，关闭刷新视图
      this.closeRefreshWithNoReach()
    }

  }

  // 绘制加载中的视图
  private drawLoadingView() {

    var temp2 = 0;
    var temp3 = 0;

    var horDis = Math.sqrt(Math.pow(this.refreshLogoWidth, 2) - Math.pow(this.heightDifference, 2))
    var x1 = (this.screenWidth - horDis) / 2
    var y1 = (this.refreshHeight - this.refreshLogoHeight) / 2 + this.heightDifference / 2
    var x4 = x1
    var y4 = y1 + this.refreshLogoHeight;
    var x2 = x1 + horDis
    var y2 = y1 - this.heightDifference;
    var x3 = x2
    var y3 = y2 + this.refreshLogoHeight;

    // 清空计时器
    clearInterval(this.timer)

    // 没隔5毫秒，顶点位置增加0.2vp
    this.timer = setInterval(() => {
      temp2 += 0.2;

      if (temp2 >= this.refreshLogoHeight) {
        temp2 = this.refreshLogoHeight;

        temp3 += 0.2;
        if (temp3 >= this.refreshLogoHeight) {
          temp2 = 0;
          temp3 = 0;
        }
      }

      // 清空画布
      this.canvasRefresh.clearRect(0, 0, this.screenWidth, this.refreshHeight)
      // 绘制菱形
      let path = new Path2D();
      path.moveTo(x1, y1 + temp3);
      path.lineTo(x2, y2 + temp2);
      path.lineTo(x3, y3 - temp2);
      path.lineTo(x4, y4 - temp3);
      path.closePath();
      this.canvasRefresh.stroke(path);
    }, 5)

  }


  // 关闭加载中的视图
  public closeRefresh(): void {

    clearInterval(this.timer);

    animateTo({ duration: 400, delay: 0, onFinish: () => {

    } }, () => {

      this.tipOpacity = 1;
      this.canvasOpacity = 0;
      this.tipsOffsetY = 0;

    });
    animateTo({ duration: 400, delay: 1000, onFinish: () => {
      this.tipOpacity = 0;
      this.tipsOffsetY = 30;
      this.canvasOpacity = 1;

      this.loadState = LoadState.Idle;
      this.refreshState = RefreshState.Idle;
    } }, () => {
      this.listOffsetY = 0;
      this.topRefreshOffsetY = -this.refreshHeight;

    });
  }

  // 没有达到刷新条件关闭
  public closeRefreshWithNoReach(): void {

    animateTo({ duration: 300, onFinish: () => {

      this.loadState = LoadState.Idle;
      this.refreshState = RefreshState.Idle;
    } }, () => {
      this.listOffsetY = 0;
      this.topRefreshOffsetY = -this.refreshHeight;
    });
  }

  // 下拉中处理
  private onActionUpdate(event: GestureEvent) {

    // 滑动时修改刷新视图的偏移量
    this.topRefreshOffsetY = -this.refreshHeight + Math.abs(this.scrollY);
    // 绘制滑动时的 菱形动效
    this.drawRefreshView(Math.abs(this.scrollY));
  }

  // 绘制滑动时候的图形
  private drawRefreshView(value: number): void {

    var temp2 = 0;
    var temp3 = 0;
    // 滑动到多少距离时，开始更新菱形的顶点位置
    var ignoreY = (this.refreshHeight + this.refreshLogoHeight) / 2 + this.heightDifference / 2
    var temp = value;
    if (value < 0) {
      return;
    }

    // 滑动距离大于设置的值时进行位置更新
    if (value >= ignoreY) {

      temp = value - ignoreY;
      temp2 = this.refreshLogoHeight / ((this.refreshHeight - ignoreY) / 2) * temp;
      if (temp2 >= this.refreshLogoHeight) {
        temp2 = this.refreshLogoHeight;
      }
      if (temp2 === this.refreshLogoHeight) {
        temp3 = this.refreshLogoHeight / ((this.refreshHeight - ignoreY) / 2) * (temp - ((this.refreshHeight - ignoreY) / 2))
      }
      if (temp3 >= this.refreshLogoHeight) {
        temp3 = this.refreshLogoHeight;
      }
    }

    // 横向坐标点的距离
    var horDis = Math.sqrt(Math.pow(this.refreshLogoWidth, 2) - Math.pow(this.heightDifference, 2))
    // 四个顶点的坐标位置
    var x1 = (this.screenWidth - horDis) / 2
    var y1 = (this.refreshHeight - this.refreshLogoHeight) / 2 + this.heightDifference / 2
    var x4 = x1
    var y4 = y1 + this.refreshLogoHeight;
    var x2 = x1 + horDis
    var y2 = y1 - this.heightDifference;
    var x3 = x2
    var y3 = y2 + this.refreshLogoHeight;

    // 每次需要清空在重绘制
    this.canvasRefresh.clearRect(0, 0, this.screenWidth, this.refreshHeight)
    // 绘制菱形
    let path = new Path2D();
    path.moveTo(x1, y1 + temp3);
    path.lineTo(x2, y2 + temp2);
    path.lineTo(x3, y3 - temp2);
    path.lineTo(x4, y4 - temp3);
    path.closePath();
    this.canvasRefresh.stroke(path);
  }
}