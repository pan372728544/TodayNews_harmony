import http from '@ohos.net.http';
import  {Constants, ContentType } from '../constants/Constants';
import { ResponseResult } from './ResponseResult';


export function httpRequestGet(url: string) {

  return httpRequest(url, http.RequestMethod.GET);

}

export function httpRequestPost(url: string, params: Map<any,any>) {
  return httpRequest(url, http.RequestMethod.POST, params);
}

export function httpRequestGetHtml(url: string) {

  let httpRequest = http.createHttp();
  let responseResult = httpRequest.request(url, {
    method: http.RequestMethod.GET,
    header: {
      'Content-Type': ContentType.JSON,
      'User-Agent':'Mozilla/5.0 (iPhone; CPU iPhone OS 16_2_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.2 Mobile/15E148 Safari/621.1'
    },
  });

  let serverData = new ResponseResult();

  return responseResult.then((value:http.HttpResponse)=>{
    if(value.responseCode === Constants.HTTP_CODE_200){

      let result = `${value.result}`;
      serverData.data = result;
      serverData.code = 'success'
      serverData.msg = value.header['set-cookie'];
      return serverData;

    }else {
      serverData.msg = `${$r('app.string.http_error_message')}&${value.responseCode}`;
    }
  }).catch((error) => {
    serverData.msg = $r('app.string.http_error_message');
    return serverData;
  });

}



function httpRequest(url: string, method: http.RequestMethod, params?: Map<any, any>): Promise<ResponseResult> {

  let httpRequest = http.createHttp();
  let responseResult = httpRequest.request(url, {
    method: method,

    header: {
      'Content-Type': ContentType.JSON,

    },


  });

  let serverData = new ResponseResult();

  return responseResult.then((value:http.HttpResponse)=>{


    if(value.responseCode === Constants.HTTP_CODE_200){

        let result = `${value.result}`;
        let resultJson: ResponseResult = JSON.parse(result);
        serverData.data = resultJson.data;
        serverData.code = resultJson.code;
        serverData.msg = resultJson.msg;
        serverData.has_more = resultJson.has_more;
        serverData.return_count = resultJson.return_count;
        serverData.page_id = resultJson.page_id;
        serverData.code = 'success'
        return serverData;

    }else {
      serverData.msg = `${$r('app.string.http_error_message')}&${value.responseCode}`;
    }
  }).catch((error) => {
    serverData.msg = $r('app.string.http_error_message');
    return serverData;
  });

}