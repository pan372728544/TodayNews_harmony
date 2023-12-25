import { VideoItem } from '../viewModel/VideoViewModel';


@Component
export struct authorView {
  @ObjectLink private item: VideoItem;

  build() {
    Column({space:10}) {
      Text("@" + this.item.author)
        .fontColor(Color.White)
        .fontSize(16)
        .width('100%')
        .fontWeight(FontWeight.Bold)

      Text("#" + this.item.label)
        .fontColor(Color.White)
        .fontSize(16)
        .maxLines(2)
        .width('100%')

      Row(){

       Image($r('app.media.music_Normal'))
         .height(20)
         .width(20)
         .margin({right:10})
        Marquee({
          start:true,
          loop:-1,
          fromStart:true,
          src:this.item.music
        })
          .width(100)
          .height(20)
          .fontColor('#FFFFFF')
          .fontSize(16)

      }

    }
    .alignItems(HorizontalAlign.Start)
    .margin({left:20,right:20,bottom:10})

  }
}