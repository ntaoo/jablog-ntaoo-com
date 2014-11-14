---
layout: post-no-feature
title: WebStormからDashのDart関連Documentを参照する
description: "ショートカットでDashのDart関連のDocumentを瞬時に参照する。便利すぎる。"
category: articles
tags: [Dart WebStorm]
---

![polymer_dart]({{ site.url }}/images/dart_dash_web_storm.png)

上の画像はPolymerElementを開いたところ。


WebStormはJetBrainsという企業が提供するWeb開発用IDE。

[https://www.jetbrains.com/webstorm/](https://www.jetbrains.com/webstorm/)

JetBrainsは日本では残念ながらいまいち知られていない気がするが、各メジャー言語にそれぞれ質の高いIDEを提供していることで人気がある。最近はAndroidStudioでJetBrainsを知った人も増えてきたのでは。自分は普段Python用IDEのPyCharmを愛用している。

Dartで書くときはDartEditorを使ってきたが、最近WebStormのDartサポートが進んできたので、DartEditorからWebStormにメインのDart開発環境を移行していく。

DashはMacで楽にDocumentを参照できるアプリ。

[http://kapeli.com/dash](http://kapeli.com/dash)

現在、Dart, PolymerDart, AngularDartのDocSetが利用できる。DocSetのインストールはPreferences -> DownloadsからDartを検索するしてDownloadするだけ。


で、Dash Pluginを使えばWebStormからショートカットでDashのDocumentを開くことができる。

[https://github.com/gdelmas/IntelliJDashPlugin#readme](https://github.com/gdelmas/IntelliJDashPlugin#readme)


このPluginのインストールは通常のPluginのインストール手順通り、
Preferences -> Plugins -> Browse repositories で Dashと検索してインストール。

その後WebStormを再起動してDocumentを参照したいものの上で**Cmd-Shift-D**でDashの該当Documentが開く。

WebStormを始めJetBrainsのIDEは一部の製品を除き有料だが、非常に便利で元は十分取れるので、日本のJetBrainsユーザー仲間がもっと増えてほしい。
