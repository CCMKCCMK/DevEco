import { router } from '@kit.ArkUI';
@Entry
@Component
struct SecondPage {
  TextMessageA: string = 'This is';
  TextMessageB1: string = 'CHAI';
  TextMessageB2: string = 'WENCHANG';
  PrevPageMessage: string = 'Prev'
  @State ColorState: boolean = false;

  onPageShow(): void {
    let count = 0;
    let g = (): number => { count++; return count; };
    let ColorChangeInterval = setInterval(() => {
      this.ColorState = ! this.ColorState;
      console.log(`g: ${g()}`)
      if (g() > 10) {
        clearInterval(ColorChangeInterval);
        router.back();
      }
    },300)
  }

  build() {
    Column() {
      Text(this.TextMessageA)
        .id('SecondPageTextA')
        .fontSize(40)
        .fontWeight(FontWeight.Bold)

      if (this.ColorState){
        Row({space: 10}){
          Text(this.TextMessageB1)
            .id('SecondPageTextB1')
            .fontSize(40)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.Blue)
          Text(this.TextMessageB2)
            .id('SecondPageTextB2')
            .fontSize(40)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.Green)
        }
      } else {
        Row({space: 10}){
          Text(this.TextMessageB2)
            .id('SecondPageTextB2')
            .fontSize(40)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.Red)
          Text(this.TextMessageB1)
            .id('SecondPageTextB1')
            .fontSize(40)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.Orange)

        }
      }
    }

    .width('100%')
    .alignItems(HorizontalAlign.Center)
    .position({ x:'0%', y:'30%' })
  }
}