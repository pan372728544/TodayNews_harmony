import { FailureLayout, LoadingLayout } from 'common';
import { initializeOnStartup, VideoItem } from '../viewModel/VideoViewModel';
import { PageState } from 'common/src/main/ets/constants/Constants';
import { videoPlayView } from '../view/videoPlayView';

@Component
export struct VideoPage {
  @Link @Watch("tabIndexChange") tabCurrentIndex: number;
  @State videoArray: Array<VideoItem> = [];
  @State pageState: PageState = PageState.Loading;

  @State play:boolean = false;

  tabIndexChange() {

    if (this.tabCurrentIndex === 1) {
      // 切换到视频页面，初始化视频数据
      this.pageState = PageState.Success;
      this.videoArray = initializeOnStartup();
      this.play = true;
    } else {
      this.play = false;
    }
  }

  build() {

    Column() {

      if (this.pageState === PageState.Loading) {
        // 加载页面
        LoadingLayout()

      } else if (this.pageState === PageState.Success) {

        // 视频页面
        videoPlayView({ videoArray: $videoArray,play:$play })

      } else {
        // 加载失败页面
        FailureLayout({ reloadAction: () => {}})
      }

    }

  }
}