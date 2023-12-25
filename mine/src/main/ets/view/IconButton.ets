import { IconButtonModel } from '../viewmodel/IconButtonModel';

import { ResManager } from 'common';


@Component
export struct IconButton {
  @ObjectLink props: IconButtonModel;
  click?: (key: number) => void = () => {
  };

  private imgWH:number = 30;
  build() {
    Column() {
      if (this.props.count) {
        Badge({
          value: `${this.props.count}`,
          style: { color: Color.White, badgeSize: 16, badgeColor: '#EF4042' }
        }) {
          Image(this.props.icon)
            .width(this.imgWH)
            .height(this.imgWH)
        }

      } else {
        Image(this.props.icon)
          .width(this.imgWH)
          .height(this.imgWH)
          .objectFit(ImageFit.Fill)
      }
      Text(this.props.text)
        .fontSize(12)
        .fontColor(Color.Black)
        .height(16)

        .onClick(() => {
          if (this.click !== undefined && this.props.key !== undefined) {

          }
        })
    }
  }
}
