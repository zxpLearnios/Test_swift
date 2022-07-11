# Test_swift
平时的测试，

## 1.   二级可切换的 列表控制器 控制器里添加scroller，scroller里面添加多个字控制器；每个子控制器里添加scroller，scroller里面再添加多个字控制器。接口实现二级菜单里包含子菜单且都可以滑动切换

## 2.  控制器在dismiss时，尤其是比如O -> A->B->C,  都是modal出的，然后由C直接回O, 中间会看到页面闪一下，因为dismiss 及时不使用动画也需要0.02s的时间，

## 3.  项目内容
    1. 系统分享
    2. 新banner (仿爱奇艺的头部banner，手势滑动，将要显示的页永远在最上层)
## 4. 其他注意点
	1. // 必须得这样才可以处理循环引用
        alert.sureClosure = {[weak alert] str in
            guard let alert = alert else { return }
            alert.hide()
        }   
   
	2. TestAlertView  // 保证此alert永远在kwindow上面的所有 alert的最下面
        kwindow.insertSubview(coverBtn, at: 2)
        kwindow.insertSubview(self, at: 2)
	
	3. setCornerRadiusFortopAndBottom UIView的分类方法，可以给任意类型的view，上下左右添加任何数值的圆角