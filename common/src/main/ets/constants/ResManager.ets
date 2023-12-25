

export class ResManager{

  static randomColor(): string{
    var randomRed = Math.floor(Math.random() * 255) + 1;
    var randomGreen = Math.floor(Math.random() * 255) + 1;
    var randomBLue = Math.floor(Math.random() * 255) + 1;
    var color = `rgba(${randomRed},${randomGreen},${randomBLue},1)`
    return color;
  }
  static getDefaultColor(): string{
    // return $r('app.color.default_color');
    return "#FE5756";
  }
  static getDefaultBackground(): string{
    // return $r('app.color.default_background');
    return "#F8F8F8"

  }
}