
import { Constants, httpRequestGet, ResponseResult } from 'common';
import { httpRequestGetHtml } from 'common/src/main/ets/utils/HttpUtil';
import { DataModel } from '../model/DataModel';




class NewsDataViewModel {


  getNewsList(currentPage: number, categoryId: number,timeStamp?:number): Promise<ResponseResult> {
    return new Promise(async (resolve: Function, reject: Function) => {
      let url = `${Constants.SERVER}/${Constants.GET_NEWS_LIST}`;
      if(timeStamp > 0){
        url += '&max_time=' + timeStamp + '&max_behot_time=' + timeStamp+ '&i=' + timeStamp;
      }

      httpRequestGet(url).then((data: ResponseResult) => {
        if (data.code === Constants.SERVER_CODE_SUCCESS) {
          resolve(data);
        } else {

          reject($r('app.string.page_none_msg'));
        }
      }).catch((err: Error) => {

        reject($r('app.string.http_error_message'));
      });
    });
  }




  getArticleHtmlData(articleId:string):Promise<ResponseResult>{
    return new Promise(async (resolve: Function, reject: Function) => {
      let url = `${Constants.SERVER}/${Constants.ARTICLE_HTML}`;
      if(articleId.length > 0){
         url += '/'+ articleId+ '/?from_page_type=feed&upstream_biz=toutiao_m&W2atIF=1';
      }
      // let url = "https://m.toutiao.com/article/7311419932909044287/?from_page_type=feed&upstream_biz=toutiao_m&W2atIF=1";
      httpRequestGetHtml(url).then((data: ResponseResult) => {
        if (data.code === Constants.SERVER_CODE_SUCCESS) {
          resolve(data);
        } else {

          reject($r('app.string.page_none_msg'));
        }
      }).catch((err: Error) => {

        reject($r('app.string.http_error_message'));
      });
    });
  }



}


let newsDataViewModel = new NewsDataViewModel();

export default newsDataViewModel as NewsDataViewModel;