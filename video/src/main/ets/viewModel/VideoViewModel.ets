




export function initializeOnStartup(): Array<VideoItem> {
  let videoDataArray: Array<VideoItem> = [];
  VIDEO_DATA.forEach((item: VideoItem) => {
    videoDataArray.push(item);
  })
  return videoDataArray;
}


@Observed
export class VideoItem {
  id: string = '';
  src: Resource = $rawfile('oUCLBC9D7aJb4trcmAgsmIYfQAzKsSnje25BeC.MP4');
  likesCount: number = 0;
  isLikes: boolean = false;
  commentCount: number = 102;
  shareTimes: number = 630;
  favor: number = 78;
  author:string;
  label:string;
  music:string;
}


export const VIDEO_DATA: VideoItem[] = [
  {
    id: '1',
    src: $rawfile('oUiC9RMqlQNDAyARZBIe6x3DI0ngstAzOgbeZs.MP4'),
    likesCount: 0,
    isLikes: false,
    commentCount: 51,
    shareTimes: 632,
    favor:  8,
    author:'超级无敌手003',
    label:"我之所谓生存，并不是苟活，所谓温饱，不是奢侈，所谓发展，也不是放纵。",
    music:"那些年看来是clasll0====80999999=="
  },
  {
    id: '2',
    src: $rawfile('oUCLBC9D7aJb4trcmAgsmIYfQAzKsSnje25BeC.MP4'),
    likesCount: 234,
    isLikes: true,
    commentCount: 0,
    shareTimes: 1,
    favor:  42,
    author:'命为志存',
    label:"雨下给富人，也下给穷人，下给义人，也下给不义的人；其实，雨并不公道，因为下落在一个没有公道的世界上。",
    music:"ssssss百分比^^^^^^^^^^^^^^^^^^^^"
  },
  {
    id: '3',
    src: $rawfile('okGEkWzFIfFKEEAsFQhh4RICAP6yNggnyPT1QB.MP4'),
    likesCount: 8654,
    isLikes: false,
    commentCount: 4,
    shareTimes: 0,
    favor:  0,
    author:'啦啦啦啦啦',
    label:"爱情多半是不成功的，要么苦于终成眷属的厌倦，要么苦于未能终成眷属的悲哀。",
    music:"数量~~~~~~~~~~~8888888"
  }
];

/**
 * state of video play.
 */
export enum PlayState {
  STOP = 0,
  START = 1,
  PAUSE = 2
}