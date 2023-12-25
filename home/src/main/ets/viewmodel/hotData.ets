export class hotListModel {
  index: number;
  color: string;
  bgColor: string;
  text: string;
  hotWord?: string;
  icon?: Resource;

  constructor(index: number, text: string, bgColor: string, color: string, icon?: Resource, hotWord?: string,) {
    this.index = index;
    this.icon = icon;
    this.bgColor = bgColor;
    this.text = text;
    this.hotWord = hotWord;
    this.color = color;
  }
}


const hotListData: Array<hotListModel> = [
  {
    index: 0,
    color: '#ff0000',
    bgColor: 'ff0000',
    text: "习近平对三农工作做出重要指示",
    hotWord: "",
    icon: $r('app.media.hot_sticky_Normal'),
  },
  {
    index: 1,
    color: '#FF731F',
    bgColor: '#FFF2E9',
    text: "甘肃积石山县4.1级地震",
    hotWord: "新",

  },
  {
    index: 2,
    color: '#EE3A3B',
    bgColor: '#FCEBED',
    text: "胡赛武装将袭击美国等红海护卫船只",
    hotWord: "热",

  },
  {
    index: 3,
    color: '',
    bgColor: '',
    text: "种出新的丰收希望",
    hotWord: "",

  },
  {
    index: 4,
    color: '#006AFE',
    bgColor: '#E8F1FF',
    text: "气象专家：华北地区的寒冷很另类",
    hotWord: "解读",


  },
  {
    index: 5,
    color: '',
    bgColor: '',
    text: "积石山6.2级地震已致135人遇难",
    hotWord: "",


  },
  {
    index: 6,
    color: '#006AFE',
    bgColor: '#E8F1FF',
    text: "美国为何未能制止胡赛武装的行动",
    hotWord: "解读",


  },
  {
    index: 7,
    color: '#EE3A3B',
    bgColor: '#FCEBED',
    text: "援甘救援队吃兰州拉面老板拒收钱",
    hotWord: "热",


  },
  {
    index: 8,
    color: '',
    bgColor: '',
    text: "王毅：中菲关系已站在十字路口",
    hotWord: "",


  },
  {
    index: 9,
    color: '#FF731F',
    bgColor: '#FFF2E9',
    text: "解清帅说如果是被丢弃就不认亲",
    hotWord: "新",


  },
  {
    index: 10,
    color: '',
    bgColor: '',
    text: "女子8名亲戚在甘肃地震中遇难",
    hotWord: "",


  }
]



const secondData: Array<hotListModel> = [

  {
    index: 1,
    color: '#FF731F',
    bgColor: '#FFF2E9',
    text: "甘肃积石山县4.1级地震",
    hotWord: "新",

  },
  {
    index: 2,
    color: '#EE3A3B',
    bgColor: '#FCEBED',
    text: "胡赛武装将袭击美国等红海护卫船只",
    hotWord: "热",

  },
  {
    index: 3,
    color: '',
    bgColor: '',
    text: "种出新的丰收希望",
    hotWord: "",

  },
  {
    index: 4,
    color: '#006AFE',
    bgColor: '#E8F1FF',
    text: "气象专家：华北地区的寒冷很另类",
    hotWord: "解读",


  },
  {
    index: 5,
    color: '',
    bgColor: '',
    text: "积石山6.2级地震已致135人遇难",
    hotWord: "",


  }
]

export { hotListData,secondData }



export class LocalDataManager {

  private static localDataManager: LocalDataManager;


  static instance() {
    if (!LocalDataManager.localDataManager) {
      LocalDataManager.localDataManager = new LocalDataManager();
    }
    return LocalDataManager.localDataManager;
  }


  queryFirstList() {
    return hotListData;
  }
  querySecondList() {
    return secondData;
  }

}
