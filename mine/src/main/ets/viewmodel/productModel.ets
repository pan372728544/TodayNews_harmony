

@Observed
export class productModel {
  profile: profileInfo;
  icon: Resource;
  text: Resource;
  likeCount?: number;
  commentCount?: number;

  constructor(profile: profileInfo,icon: Resource, text: Resource, likeCount?: number, commentCount?: number) {
    this.profile = profile;
    this.icon = icon;
    this.text = text;
    this.likeCount = likeCount;
    this.commentCount = commentCount;
  }
}

@Observed
export class profileInfo {
  profileImg: Resource;
  nickName: Resource;
  time: string;

  constructor(profileImg: Resource, nickName: Resource, time: string) {
    this.profileImg = profileImg;
    this.nickName = nickName;
    this.time = time;
  }
}
