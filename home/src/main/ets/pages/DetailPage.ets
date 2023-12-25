import router from '@ohos.router';
import { DataModel, MediaInfo } from '../model/DataModel';
import webview from '@ohos.web.webview';
import NewsDataViewModel from '../viewmodel/NewsDataViewModel';
import { PageState } from 'common/src/main/ets/constants/Constants';
import { ResManager, ResponseResult } from 'common';


@Entry
@Component
struct DetailPage {
  @State htmlStr: string = ''
  @State article: DataModel = new DataModel();
  @State pageState: PageState = PageState.Loading;
  @State mediaInfo: MediaInfo = new MediaInfo();
  controller: webview.WebviewController = new webview.WebviewController()

  aboutToAppear() {
    const params = router.getParams() as DataModel;
    this.article = params;

    this.mediaInfo = this.article.media_info;

    // this.getHtmlData();

  }

  getHtmlData() {

    return new Promise<string>((resolve, reject) => {
      NewsDataViewModel.getArticleHtmlData(this.article.tag_id)
        .then((data: ResponseResult) => {
          this.pageState = PageState.Success;

          this.htmlStr = data.data as string;
          this.loadHtml()
          resolve('刷新成功')
        }).catch((error) => {
        resolve('')
      })

    })


  }

  loadHtml() {

    try {
      this.controller.loadData(
        `${this.htmlStr}`,

        "text/html",
        "UTF-8"
      )
    } catch (error) {
      console.log(error);
    }
  }

  onPageShow() {

  }

  @Builder NavBar() {
    Row() {
      Image($r('app.media.back_normal_new_Normal'))
        .width(24)
        .height(24)
        .margin({ left: 15, right: 15 })
        .onClick(() => {
          router.back();
        })

      Stack({ alignContent: Alignment.Bottom }) {
        Image(this.mediaInfo.avatar_url)
          .width(34)
          .height(34)
          .borderRadius(17)
          .objectFit(ImageFit.Contain)
          .backgroundColor(ResManager.getDefaultBackground())

        Text('+关注')
          .fontColor(ResManager.getDefaultColor())
          .backgroundColor('#FFF2F1')
          .borderRadius(3)
          .fontSize(9)
          .padding(4)
          .width(34)
          .height(16)

      }
      .margin({ right: 15 })

      Search({placeholder:"搜你想看的"})
        .backgroundColor('#F1F2F2')
        .height(34)
        .placeholderColor('#6E6E6E')
        .placeholderFont({size:13,style:FontStyle.Normal})
        .width("40%")
      Blank()
      Image($r('app.media.audio_more_Normal'))
        .width(30)
        .height(30)

      Image($r('app.media.article_audio_Normal'))
        .width(30)
        .height(30)
        .margin({ left: 15, right: 15 })
    }
    .width('100%')
    .height(56)
    .backgroundColor(Color.White)
  }

  build() {
    Column() {

      this.NavBar()

      Web({
        src: this.article.article_url, controller: this.controller
      })
        .javaScriptAccess(true)
        .height('90%')
        .width('100%')

    }
    .height('100%')
  }
}