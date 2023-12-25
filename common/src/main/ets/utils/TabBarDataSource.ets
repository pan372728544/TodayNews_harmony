
import { TabModel } from '../pages/TabBarLayout';
import {BasicDataSource} from './BasicDataSource'


export class TabBarDataSource extends BasicDataSource {
  private dataArray: TabModel[] = [];

  public totalCount(): number {
    return this.dataArray.length;
  }

  public  getDataArr ():TabModel[]{
    return this.dataArray;
  }

  public getData(index: number): any {
    return this.dataArray[index];
  }

  public addData(index: number, data: TabModel): void {
    this.dataArray.splice(index, 0, data);
    this.notifyDataAdd(index);
  }

  public pushData(data: TabModel): void {
    this.dataArray.push(data);
    this.notifyDataAdd(this.dataArray.length - 1);
  }
}
