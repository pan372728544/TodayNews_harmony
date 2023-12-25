

export class ResponseResult {
  code: string;
  msg: string | Resource;
  data: string | Object | ArrayBuffer;
  has_more: boolean;
  return_count: number;
  page_id: string;

  constructor() {
    this.code = '';
    this.msg = '';
    this.data = '';
    this.has_more = false;
    this.return_count = 0;
    this.page_id = '';
  }
}