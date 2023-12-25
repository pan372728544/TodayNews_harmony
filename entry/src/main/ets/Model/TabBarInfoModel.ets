


export  class TabBarInfoModel {
  index: number = 0;
  normalImg: Resource = $r('app.media.new_home_tabbar_Normal');
  selectImg: Resource = $r('app.media.new_home_tabbar_press_Normal');
  whiteImg:Resource = $r('app.media.new_refresh_tabbar_press_Normal')
  title: Resource = $r('app.string.home');
}


const tabBarInfoList: TabBarInfoModel[] = [
  {
    index: 0,
    normalImg: $r('app.media.new_home_tabbar_Normal'),
    selectImg: $r('app.media.new_home_tabbar_press_Normal'),
    whiteImg: $r('app.media.pseries_logo_Normal'),
    title: $r('app.string.home')
  },
  {
    index: 1,
    normalImg: $r('app.media.new_video_tabbar_Normal'),
    selectImg: $r('app.media.new_video_tabbar_press_Normal'),
    whiteImg: $r('app.media.new_refresh_tabbar_press_Normal'),
    title: $r('app.string.video')
  },
  {
    index: 2,
    normalImg: $r('app.media.mall_tabbar_Normal'),
    selectImg: $r('app.media.mall_tabbar_press_Normal'),
    whiteImg: $r('app.media.lmcv_v2a_timer_Normal'),
    title: $r('app.string.shop')
  },
  {
    index: 3,
    normalImg: $r('app.media.new_mine_tabbar_Normal'),
    selectImg: $r('app.media.new_mine_tabbar_press_Normal'),
    whiteImg: $r('app.media.ic_search_White_online_Normal'),
    title: $r('app.string.mine')
  }
]

export { tabBarInfoList }