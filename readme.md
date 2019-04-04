vim的经典之处在于双手不用离开键盘,沉浸式的开发体验   
### 查看帮助文档
`:help emmet` 或者 `:h emmet` 
如果怕输入不准确可以继续按`<C-d>` 即(Ctrl + D),获取提示

或者打开插件emmet-vim的安装目录, 查看doc文件夹下的txt说明文件
### 经常使用的操作和插件
#### emmet-vim
默认的快捷键'<C-y>,'  
命令:

`(ul>li.info.test_${test_$@3}*5)+a[href="/addr"]{addr}`

结果:

```html
<ul>
    <li class="info test_1">test_3</li>
    <li class="info test_2">test_4</li>
    <li class="info test_3">test_5</li>
    <li class="info test_4">test_6</li>
    <li class="info test_5">test_7</li>
</ul>
<a href="/addr">addr</a>
```
命令:

`ul>li.test_$@-*5^span{hi}`

结果:
```html
<ul>
    <li class="test_4"></li>
    <li class="test_3"></li>
    <li class="test_2"></li>
    <li class="test_1"></li>
    <li class="test_0"></li>
</ul>
<span>hi</span>

```

示例写入html
```
  First
  Second
  Third
```
视觉选择(Visual select)之后选择之后按`<C-y>,`,接着左下角输入

  `ul>li[title="[$#]"]{$#}*`

  或

  `ul>li[title=[$#]]{$#}*`

结果: 
  ```html
  <ul>
      <li title="[First]">First</li>
      <li title="[Second]">Second</li>
      <li title="[Third]">Third</li>
  </ul>
  ```

目的: 选择整个光标所在的外部标签,`*`为光标所在地,  
按`<C-y>d`, 选择整个ul标签  
按`<C-y>k`, 删除整个ul标签
  ```html
  <ul>
  *   <li class="list1"></li>
      <li class="list2"></li>
      <li class="list3"></li>
  </ul>
  ```

输入文本
```
MainHeader
NewTopic
UserLogin
UserCollection
MsgCenter
SideBar
```
命令  
`:78,83s#\w\+#import \0 from '@/components/\0#g`  
78,83文本的起始,结束行  
s 替换命令
\# 分割符  
\w\+ 匹配字符串  
\0 当前行匹配的第一个字符串变量  
g 全部替换  
结果js:
```js
import MainHeader from '@/components/MainHeader'
import NewTopic from '@/components/NewTopic'
import UserLogin from '@/components/UserLogin'
import UserCollection from '@/components/UserCollection'
import MsgCenter from '@/components/MsgCenter'
import SideBar from '@/components/SideBar'
```

### vim-surround
  `*`为光标所在位置
  ```
  Old text                  Command     New text ~
  "Hello *world!"           ds"         Hello world!
  [123+4*56]/2              cs])        (123+456)/2
  "Look ma, I'm *HTML!"     cs"<q>      <q>Look ma, I'm HTML!</q>
  if *x>3 {                 ysW(        if ( x>3 ) {
  my $str = *whee!;         vllllS'     my $str = 'whee!';
  ```

  ### 在多个文件里搜索字词
  `:h vim` 或 `:h vimgrep`
```vim script
  :vimgrep console *.js
  :vimgrep /\<FileName\>/ *.js include/*
  :vimgrep /myfunc/ **/*.js
```
会打开quickfix,展示第一个搜索出来的结果  
移动: `:cn`; `:cp`; `:cn 3`; `:cp 3` 或者`:3cn` `:3cp`   
或者用jk上下移动,然后enter进入文件对应位置 最后按Ctrl ^ 回到原来的位置


  ### 按键
  - 自定义配置终端,局部环境变量,宏命令,或者切换成powershell,bash等
  `nmap <F10> :rightbelow vert term<cr> c:\users\administrator\env.bat & color 0a & cls & echo hello<cr>
` 
    - `<C-w>h` 跳到左侧窗口
    - `F7` 历史记录的列表, 输入首字母快速跳转, `F9`快速输入对应编号命令
    - `xcopy /s /y /q source target\`
    - `findstr /s /n console *.js`
 - 输入比较长的单词到一半时,`<C-p>` 会对已经输入过的进行提示,再次按`<C-n>`,`<C-p>` 上下选择
 - % 跳转到当前所在的大括号始/末位置
 - 折叠 `set foldmethod=indent/marker`缩进折叠/标记折叠, 简写fmd
    - zf10G 创建折叠
    - zo 展开折叠,  
    - zc 折叠
    - zr 打开所有折叠(每次打开一层)
    - zR 打开深层次嵌套折叠
    - zM 折叠所有
    - [z 当前折叠开始处
    - ]z 当前折叠末尾处
    - zj 向下移动。到达下一个折叠的开始处
    - zk 向上移动到前一折叠的结束处
- `:10,100w!test.js` 保存10到100行到text.js文件
- 执行当前js  
    - 安装 AsyncRun.vim, `AsyncRun node %`
    - `:1,3!node` 执行1到3行返回结果
    - `:5!node %` 执行当前文件返回结果替换到第5行
- 移动到屏幕中央
    - `M` 移动光标到屏幕中央
    - `zz` 移动当前行到屏幕中央
    - `<C-d>`,`<C-U>` 下翻 上翻
- 输入状态下的移动,状态切换
```vim script
imap <m-k> <up>
imap <m-j> <down>
imap <m-l> <right>
imap <m-h> <left>
inoremap jj <esc>
```