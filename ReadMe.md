####修改字体大小

APP中修改字体功能一般放在设置中，例如微信字体大小: 我 -> 设置 -> 通用 -> 字体大小

以本Demo为例: 

定义了三种字体大小值

```
static CGFloat const fontSize_12 = 12;
static CGFloat const fontSize_16 = 16;
static CGFloat const fontSize_20 = 20;
```

定义一个字体大小变化的key:

```
#define kFontSizeValue @"FontSizeValue"
```

此key存储了字体变化的值， 如: -8, 4等。

本例中: 

FirstViewController、SecondViewController、ThirdViewController分别为每个tabBarController的第一个普通VC;

FirstDetailViewController、SecondDetailViewController、ThirdDetailViewController分别为对应的详情普通VC。

本例中修改字体大小功能放在ThirdDetailViewController，则当修改字体大小时， FirstDetailViewController、SecondDetailViewController是不存在于当前内存中的，进入此两个控制器时，view是需要新建的，因此无需做刷新字体大小操作，这时需要控制好FirstViewController、SecondViewController、ThirdViewController三个控制器中的视图。

对于FirstViewController， 只有两个label需要变化字体，只需在viewWillAppear中获取到变化值直接修改即可:

```
NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    CGFloat fontValue = [defaults floatForKey:kFontSizeValue];
    
    //push按钮标题字体大小不变化 则不设置
    self.testLabel.font = Font(fontSize_16 + fontValue);
    self.testDetailLabel.font = Font(fontSize_12 + fontValue);
```

对于SecondViewController，控制器中创建有一个tableView，需要修改其cell中label字体大小， 当检测到字体变化后， 移除掉之前创建的view，然后重新创建view，使用原先的数据源重新刷新view，因为cell中label控件是获取字体大小变化值的，这时字体大小修改完成。

或许还有更加复杂的情况，比如，有些label等控件要求字体最大不可超过20， 但假如其字体原先大小为16，而最大变化值为8， 此时16 + 8 = 24 > 20， 这里就需要对这种有最大限制的label等控件的字体大小做判断。


PS: 只是对修改字体大小有个初步的方案，或许真正用到具体项目中会有很多这样那样的问题，这里只是给自己提供了简单的暂时觉得可行的方法。