---
layout: post-no-feature
title: "PolymerDartについて"
description: "先日、Dart現状確認会でPolymerDartについて共有した。その補足説明をここに残す。"
category: articles
tags: [dart]
---

[http://connpass.com/event/9562/](http://connpass.com/event/9562/)

[https://speakerdeck.com/ntaoo/webapp-with-polymerdart-and-material](https://speakerdeck.com/ntaoo/webapp-with-polymerdart-and-material)


### 仕様
 PolymerDartはPolymerJSの仕様に追随している。そのため、PolymerJSを学習し理解すれば少しの努力でPolymerDartを理解できる。

DartバージョンはDart向けに文法が整理されている。

![polymer_dart]({{ site.url }}/images/polymer_dart.png)


一番目を引く違い。PolymerDartにおけるcustom tagは、それに対応するclassと@annotationを持つ。@CustomTagでelement nameを指定する。@publishedでcustom attributeを指定する。@observableでelement内部のdata binding対象を指定する。

その他の違いもDartの文法を知っていれば自然に対応できる印象。




### Material Design

Paper ElementsとCore ElementsはPolymerDartにおいても使用できる。それぞれPub（というDartのPackage Manager）でインストールする。

[https://pub.dartlang.org/packages/paper_elements](https://pub.dartlang.org/packages/paper_elements)

[https://pub.dartlang.org/packages/core_elements](https://pub.dartlang.org/packages/core_elements)

これは基本的にはPaper ElementsとCore ElementsのJS版をdart:jsというライブラリを使用して呼び出している。

[https://www.dartlang.org/articles/js-dart-interop/](https://www.dartlang.org/articles/js-dart-interop/)

例外としてAjax処理が絡むelementはDartで書きなおされている。少なくともcore-ajax, core-xhr, core-listが対象。理由は未調査。それぞれのtagの名称に-dart suffixが追加されている。core-ajax-dart, core-xhr-dart, core-list-dart。core-listについては、infinite scrolling機能が内包されいるためだと思われる。

core-ajax-dartを試してみたが残念ながらうまく動かなかった。（勘違いかもしれない）そのためそこはJS版のtutorialとは異なる実装にした。

[https://github.com/ntaoo/polymer-dart-examples](https://github.com/ntaoo/polymer-dart-examples)


将来すべてDartで書きなおされるのかは不明。仕様と実装が安定したらそうするのでは。

そろそろPolymerの仕様は安定してきた…のか？

<s>JSへのCompile Polymer TutorialをDartにportしたものをpub build(dart2jsによるJSへのcompile)すると1.1MBまで膨らんだ。個人的にはここがつらい。うまくtree shakingできなかったのではないか。dart:mirrorを使うとdart2jsはまだ辛い印象。Issue ticketも結構残っている。インストール型でサイズが膨れてもそれほど気にしなくとも良いCordovaやChromeAppから入るのがいまのところ正解かと思う。
もしくはmirrorを使わなければ最小で200KBくらいと許容できるサイズになる。
2015年にはChromeにDartVMが入るとして、AndroidのCordovaとChromeApp(とMobileChromeApp)はDartVMで実行できることが期待できるが、その他の環境ではJSへのcompileが必要なので、改善を期待。</s>
(追記。 minifyすると373KB, 圧縮して106KBなので、かなり実用的なサイズになってきている。DartEditorからpub buildするとdebug modeで実行されるのでminifyされない。consoleからpub buildするとdefaultでminifyされる)



### PolymerDartの学習方法

学習はDartEditorで始めるといい。リアルタイムのwarningやbuildメニューなどIDEとしていろいろ支援してくれるため。 しかしぶっちゃけEditor単体としてはかなり使いにくい（ごめん）ため、個人的にはWebStormのDartサポートが安定したらそれに乗り換える予定。

PolymerDart Home.

[https://www.dartlang.org/polymer/](https://www.dartlang.org/polymer/)

まだissueが結構潜んでいるようで、サンプルコードに載っている範囲が安全地帯という感じもある。

[https://github.com/dart-lang/polymer-dart-patterns](https://github.com/dart-lang/polymer-dart-patterns)


PolymerDartもPolymerなので、PolymerJSを学習しておくとPolymerDartの理解が容易になる。

[https://www.polymer-project.org/](https://www.polymer-project.org/)

CoreElementsとPaperElementsのAPIはJS版と同じ（はず）なので、JS版のリファレンスを参照して開発できる。もしくはライブラリのソースのコメントを読む。

[https://www.polymer-project.org/docs/elements/](https://www.polymer-project.org/docs/elements/)

自分は、PolymerDartとPaperElements,CoreElementsを多少表示が崩れたり初期起動が遅くとも問題が少ないAdmin consoleに導入してみている。


次はDartのAppEngine ManagedVMについて書く。
