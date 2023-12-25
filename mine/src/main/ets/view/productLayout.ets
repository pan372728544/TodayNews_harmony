import emitter from '@ohos.events.emitter';
import { LocalDataManager } from '../viewmodel/LocalDataManager';

import { productModel } from '../viewmodel/productModel';
import { productView } from './productView';


@Component
export struct productLayout {
  private localManager: LocalDataManager = LocalDataManager.instance();
  @State productList: Array<productModel> = [];

  @Link @Watch('changeIndex') currentIndex: number;


  aboutToAppear(){
    this.changeIndex();
  }
  changeIndex(){

    var array: Array<productModel> = [];
    if (this.currentIndex === 0) {
      array = this.localManager.queryProductList();
    } else {
      array = this.localManager.queryProductCollectList();
    }

    this.productList = [];
    for (let index = 0; index < array.length; index++) {
      const element = array[index];
      this.productList.push(element)
    }
  }

  build() {

    List() {
      ForEach(this.productList, (product: productModel) => {

        ListItem() {
          productView({ product: product })
        }

      }, item => JSON.stringify(item))

    }
    .backgroundColor(Color.White)
    .divider({ strokeWidth: 10, color: 0xF2F1F2 })

  }
}