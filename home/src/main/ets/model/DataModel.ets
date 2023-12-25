

export class DataModel {
  media_name: string ;
  ban_comment: number;
  abstract: string;
  image_list: ImageList[];
  image_url: string;
  large_image_url: string;
  datetime: string;
  article_type: number;
  more_mode: boolean;
  middle_mode: boolean;
  large_mode: boolean;
  tag: string;
  has_m3u8_video: number;
  display_dt: number;
  has_mp4_video: number;
  aggr_type: number;
  cell_type: number;
  article_sub_type: number;
  bury_count: number;
  title: string;
  source_icon_style: number;
  tip: number;
  has_video: boolean;
  share_url: string;
  label: string;
  source: string;
  comment_count: number;
  article_url: string;
  publish_time: number;
  group_flags: number;
  has_image: boolean;
  action_extra: ActionExtra;
  tag_id: string;
  source_url: string;
  display_url: string;
  is_stick: boolean;
  item_id: string;
  repin_count: number;
  cell_flag: number;
  source_open_url: string;
  level: number;
  digg_count: number;
  behot_time: number;
  hot: number;
  cursor: number;
  url: string;
  like_count: number;
  user_repin: number;
  label_style: number;
  video_style: number;
  media_info: MediaInfo;
  group_id: string;
}

export class ActionExtra {
  channel_id: number;
}

export class MediaInfo {
  avatar_url: string = "";
  name: string = '';
  media_id: number = 0;
  user_verified: boolean = false;
}

export class ImageList {
  url: string ;
  width: string = '';
  height: number = 0;

}

