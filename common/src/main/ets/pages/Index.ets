import router from '@ohos.router'
@Entry
@Component
struct Index {
  @State message: string = 'Test'

  build() {
    Row() {
      Column() {
        Button('点击跳转msy')
          .onClick(()=>{

            router.pushUrl({
              url: '@bundle:com.news.today/library/ets/components/homepage/HomePage'
            }).then(() => {
              console.log("push page success");
            }).catch(err => {
              console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
            })

          })
      }
      .width('100%')
    }
    .height('100%')
  }
}