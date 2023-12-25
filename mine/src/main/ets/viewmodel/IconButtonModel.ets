


@Observed
export class IconButtonModel {
  icon: Resource;
  text: Resource;
  key?: number;
  count?: number;

  constructor(icon: Resource, text: Resource, key?: number, count?: number) {
    this.icon = icon;
    this.text = text;
    this.key = key;
    this.count = count;
  }
}
