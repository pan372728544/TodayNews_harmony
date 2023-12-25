

export class Constants {
  /**
   * The host address of the server.
   */
  static readonly SERVER: string = 'https://m.toutiao.com';

  /**
   * Get the news type.
   */
  static readonly GET_NEWS_TYPE: string = 'news/getNewsType';

  /**
   * Get the news list.
   */
  static readonly GET_NEWS_LIST: string = 'list/?tag=__all__&count=20&format=json_raw&as=A196F596765D42C';

  /**
   * Get the news list.
   */
  static readonly ARTICLE_HTML: string = 'article';

  /**
   * Upload File
   */
  static readonly UPLOAD_FILE: string = '/files/upload';

  /**
   * UploadFile
   */
  static readonly IMAGE_PREFIX: string = '/images/';

  /**
   * url of NewsUploadPage
   */
  static readonly NEWS_EDIT_PAGE: string = 'pages/NewsEditPage'

  /**
   * The request success status code.
   */
  static readonly SERVER_CODE_SUCCESS: string = 'success';

  /**
   * The off set coefficient.
   */
  static readonly Y_OFF_SET_COEFFICIENT: number = 0.1;

  /**
   * The page size.
   */
  static readonly PAGE_SIZE: number = 10;

  /**
   * The refresh and load height.
   */
  static readonly CUSTOM_LAYOUT_HEIGHT: number = 70;

  /**
   * Gt tab data current page.
   */
  static readonly GET_TAB_DATA_CURRENT_PAGE: number = 1;

  /**
   * Http request success status code.
   */
  static readonly HTTP_CODE_200: number = 200;

  /**
   * The animation delay time.
   */
  static readonly DELAY_ANIMATION_DURATION: number = 300;

  /**
   * The delay time.
   */
  static readonly DELAY_TIME: number = 1000;

  /**
   * The animation duration.
   */
  static readonly ANIMATION_DURATION: number = 2000;

  /**
   * The http timeout duration.
   */
  static readonly HTTP_READ_TIMEOUT: number = 10000;

  /**
   * Content maxLine.
   */
  static readonly CONTENT_MAX_LINE: number = 3;

  /**
   * List space.
   */
  static readonly LIST_SPACE: number = 12;

  /**
   * Item img space.
   */
  static readonly ITEM_IMG_SPACE: number = 8;


  /**
   * Item space.
   */
  static readonly ITEM_SPACE: number = 10;

  /**
   * Type font weight.
   */
  static readonly TYPE_FONT_WEIGHT: number = 700;

  /**
   * Title font weight.
   */
  static readonly TITLE_FONT_WEIGHT: number = 500;

  /**
   * Desc font weight.
   */
  static readonly DESC_FONT_WEIGHT: number = 400;

  /**
   * Type aspect ratio.
   */
  static readonly TYPE_ASPECT_RATIO: number = 2;

  /**
   * Desc opacity.
   */
  static readonly DESC_OPACITY: number = 0.6;

  /**
   * 100 percent.
   */
  static readonly FULL_PERCENT: string = '100%';

  /**
   * Divider width.
   */
  static readonly DIVIDER_WIDTH: string = '90%';

  /**
   * Release title.
   */
  static readonly RELEASE_TITLE: string = '新闻发布';




}


export const enum RefreshMode {
  Idle = 0,
  DropDown = 1,
  PullUp = 2,

}



export const enum RefreshConstant {
  DELAY_PULL_DOWN_REFRESH = 50,
  CLOSE_PULL_DOWN_REFRESH_TIME = 150,
  DELAY_SHRINK_ANIMATION_TIME = 500
}


export const enum RefreshState {
  Idle = 0,
  Refreshing = 1,
  Success = 2
}


export const enum LoadState {
  Idle = 0,
  Loading = 1,
  Done = 2
}


export const enum PageState {
  Loading = 0,
  Success = 1,
  Fail = 2
}


/**
 * The request method enum.
 */
export const enum RequestMethod {
  POST = 'POST',
  GET = 'GET'
}

/**
 * The request content type enum.
 */
export const enum ContentType {
  JSON = 'application/json',
  FORM = 'multipart/form-data'
}