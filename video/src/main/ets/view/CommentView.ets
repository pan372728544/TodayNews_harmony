import { VideoItem } from '../viewModel/VideoViewModel';

@Component
export struct CommentView {
  @ObjectLink private item: VideoItem;

  build() {
    Column() {
      Image($r('app.media.head_Norma'))
        .width(40)
        .height(40)
        .margin({ top: 10 })
        .objectFit(ImageFit.Contain)
        .border({
          width: 1,
          color: Color.White,
          radius: 20
        })

      Image(this.item.isLikes ? $r('app.media.digg_heart_selected_icon_32_Normal') : $r('app.media.audio_detail_action_like_seleted_Normal'))
        .width(40)
        .height(40)
        .onClick(() => {
          if (this.item.isLikes) {
            this.item.likesCount--;
          } else {
            this.item.likesCount++;
          }
          this.item.isLikes = !this.item.isLikes;
        })
        .margin({ top: 10 })

      Text(this.item.likesCount === 0 ? "喜欢" : (this.item.likesCount.toString()))
        .fontColor(Color.White)
        .fontSize(14)


      Image($r('app.media.comment'))
        .width(40)
        .height(40)
        .margin({ top: 10 })
      Text(this.item.commentCount === 0 ? "评论" : (this.item.commentCount.toString()))
        .fontColor(Color.White)

      Image($r('app.media.Share48_Normal'))
        .width(40)
        .height(40)
        .margin({ top: 10 })
      Text(this.item.shareTimes === 0 ? "分享" : (this.item.shareTimes.toString()))
        .fontColor(Color.White)

      Image($r('app.media.favor_button_3x_Norma'))
        .width(40)
        .height(40)
        .margin({ top: 10 })
      Text(this.item.favor === 0 ? "收藏" : (this.item.favor.toString()))
        .fontColor(Color.White)
    }.offset({x:-20,y:-100})


  }
}