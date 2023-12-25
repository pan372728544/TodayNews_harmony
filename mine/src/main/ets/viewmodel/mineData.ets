import { IconButtonModel } from './IconButtonModel'
import { productModel, profileInfo } from './productModel'


const memberButton: IconButtonModel[] = [
  new IconButtonModel($r('app.media.comment_Normal'), $r('app.string.focus_map_1'), 0, 99),
  new IconButtonModel($r('app.media.more_ask_icon_Normal'), $r('app.string.focus_map_2'), 1),
  new IconButtonModel($r('app.media.sixin_Normal'), $r('app.string.focus_map_3'), 2),
  new IconButtonModel($r('app.media.edit_list_icon_Normal'), $r('app.string.focus_map_4')),
  new IconButtonModel($r('app.media.digup_allshare_Normal'), $r('app.string.focus_map_5')),
  new IconButtonModel($r('app.media.Video_Normal'), $r('app.string.focus_map_6')),
  new IconButtonModel($r('app.media.boost_allshare_Normal'), $r('app.string.focus_map_7')),
  new IconButtonModel($r('app.media.airdrop_allshare_Normal'), $r('app.string.focus_map_8'))
]


const swiperImage: Resource[] = [
$r('app.media.1'),
$r('app.media.2'),
$r('app.media.3'),
]


const productDataList: Array<productModel> = [
  {
    profile: {
      profileImg: $r('app.media.avatar'),
      nickName: $r('app.string.nickName'),
      time: '11月12'
    },
    icon: $r('app.media.product1'),
    text: $r('app.string.content10'),
    likeCount: 20,
    commentCount: 10
  },
  {
    profile: {
      profileImg: $r('app.media.avatar'),
      nickName: $r('app.string.nickName'),
      time: '10月21'
    },
    icon: $r('app.media.product2'),
    text: $r('app.string.content1'),
    likeCount: 9,
    commentCount: 234

  },
  {
    profile: {
      profileImg: $r('app.media.avatar'),
      nickName: $r('app.string.nickName'),
      time: '1月9'
    },
    icon: $r('app.media.product3'),
    text: $r('app.string.content2'),
    likeCount: 0,
    commentCount: 0

  },
  {
    profile: {
      profileImg: $r('app.media.avatar'),
      nickName: $r('app.string.nickName'),
      time: '9月20'
    },
    icon: $r('app.media.product4'),
    text: $r('app.string.content3'),
    likeCount: 899,
    commentCount: 0

  },
  {
    profile: {
      profileImg: $r('app.media.avatar'),
      nickName: $r('app.string.nickName'),
      time: '12月30'
    },
    icon: $r('app.media.product5'),
    text: $r('app.string.content4'),
    likeCount: 0,
    commentCount: 2

  }

]


const productCollectDataList: Array<productModel> = [
  {
    profile: {
      profileImg: $r('app.media.avatar'),
      nickName: $r('app.string.nickName'),
      time: '5月21'
    },
    icon: $r('app.media.product6'),
    text: $r('app.string.content9'),
    likeCount: 20,
    commentCount: 10
  },
  {
    profile: {
      profileImg: $r('app.media.avatar'),
      nickName: $r('app.string.nickName'),
      time: '10月21'
    },
    icon: $r('app.media.product7'),
    text: $r('app.string.content8'),
    likeCount: 9,
    commentCount: 234

  },
  {
    profile: {
      profileImg: $r('app.media.avatar'),
      nickName: $r('app.string.nickName'),
      time: '1月9'
    },
    icon: $r('app.media.product8'),
    text: $r('app.string.content7'),
    likeCount: 0,
    commentCount: 0

  },
  {
    profile: {
      profileImg: $r('app.media.avatar'),
      nickName: $r('app.string.nickName'),
      time: '9月20'
    },
    icon: $r('app.media.product9'),
    text: $r('app.string.content6'),
    likeCount: 899,
    commentCount: 0

  },
  {
    profile: {
      profileImg: $r('app.media.avatar'),
      nickName: $r('app.string.nickName'),
      time: '12月30'
    },
    icon: $r('app.media.product10'),
    text: $r('app.string.content5'),
    likeCount: 0,
    commentCount: 2

  }

]


export { memberButton, swiperImage,productDataList,productCollectDataList }