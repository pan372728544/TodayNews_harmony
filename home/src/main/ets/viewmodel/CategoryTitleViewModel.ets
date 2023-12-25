class CategoryTitleViewModel {

  // static readonly TabBars_DEFAULT_NEWS_TYPES: Array<NewsTypeBean> = [
  //   { id: 0, name: '全部' },
  //   { id: 1, name: '国内' },
  //   { id: 2, name: '国际' },
  //   { id: 3, name: '娱乐' },
  //   { id: 4, name: '军事' },
  //   { id: 5, name: '体育' },
  //   { id: 6, name: '科技' },
  static readonly TabBars_DEFAULT_NEWS_TYPES: Array<string> = [
    '全部',
    '热榜',
    '国际',
    '娱乐',
    '军事',
    '体育',
    '科技',
    '手机',
    '电影',
    '数码',

  ];


  // getDefaultCategoryList():NewsTypeBean[]{
  //
  //   return CategoryTitleViewModel.TabBars_DEFAULT_NEWS_TYPES;
  // }

  getDefaultCategoryList(): string[] {

    return CategoryTitleViewModel.TabBars_DEFAULT_NEWS_TYPES;
  }
}


export class NewsTypeBean {
  id: number = 0;
  name: ResourceStr = '';
}


let categoryTitleViewModel = new CategoryTitleViewModel();

export default categoryTitleViewModel as CategoryTitleViewModel;