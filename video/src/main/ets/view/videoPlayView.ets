
import { PlayState, VideoItem } from '../viewModel/VideoViewModel';
import { videoContent } from './videoContent';


@Component
export struct  videoPlayView {
  @State swiperIndex: number = 0;
  @Link videoArray: Array<VideoItem>;

  @Link play: boolean;

  build(){

    Swiper(){
       ForEach(this.videoArray,(videos:VideoItem,index:number)=>{

         videoContent({
           swiperIndex:$swiperIndex,
           item:videos,
           barPosition:index,
           isPlay:$play
         })

       },videos=>JSON.stringify(videos))
    }
    .width("100%")
    .height("100%")
    .indicator(false)
    .loop(false)
    .vertical(true)
    .onChange((swiper: number) => {
      this.swiperIndex = swiper;
    })


  }

}