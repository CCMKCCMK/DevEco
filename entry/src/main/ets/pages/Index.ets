import { router } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  @State textReverse: boolean = true;
  TextMessageA: string = 'Hello';
  TextMessageB: string = 'World';
  ButtonMessage: string = 'Click World';
  NextPageMessage: string = 'Next';

  build() {
    Column({space: 5}) {
      Column({space: 10}) {
        if (this.textReverse) {
          Text(this.TextMessageA + " " + this.TextMessageB)
            .id('HelloWorld')
            .fontSize(50)
            .fontWeight(FontWeight.Bold)
        } else {
          Text(this.TextMessageB + " " + this.TextMessageA)
            .id('HelloWorld')
            .fontSize(50)
            .fontWeight(FontWeight.Bold)
        }
        Row({space: 5}){
          Button(this.ButtonMessage)
            .id('ClickWorld')
            .fontSize(30)
            .fontColor(Color.Green)
            .backgroundColor(Color.Transparent)
            .borderWidth(2)
            .fontWeight(FontWeight.Bolder)
            .onClick(() => {
              this.textReverse = !this.textReverse;
            })

          Button(this.NextPageMessage)
          .onClick(()=> {
            router.pushUrl({ url: "pages/SecondPage"})
          })
        }
      }
      .width('100%')
      .alignItems(HorizontalAlign.Center)
      .position({ x:'0%', y:'30%' })
    }
  }
}