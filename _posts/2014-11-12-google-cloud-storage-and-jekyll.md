---
layout: post-no-feature
title: "Google Cloud StorageでCustom DomainのJekyll Static Siteを公開する手順のメモ"
description: ""
category: articles
tags: [gcp]
---

### 前提

* domain registrarでdomainを取得している。
* Jekyllの基本的な使い方がわかる。
* Google accountがあり、Google Cloud Platformのセットアップが終わっている。
* クレジットカードを持っている。

以下の手順はdomain: example.comでhttp://blog.example.com/を作成するものとして進める。


### CNAMEを設定

各domain registrarの提供するWeb ConsoleなどでCNAMEの設定を行う。

* NAME: blog
* TYPE: DATA
* CNAME: c.storage.googleapis.com


### Google Cloud StorageのBucketを作成

#### Google Developers Consoleを開く
[https://console.developers.google.com](https://console.developers.google.com)

#### 新規プロジェクトを作成

Create Projectをクリック -> PROJECT ID, PROJECT NAMEはexample-comとするなど、適当なものにする。

#### Bucketの作成

Storage -> Cloud Storage -> Storage Browser
クレジットカード情報の入力を求められたら入力する。
Bucket名は blog.example.com とする。


### Jekyll Static SiteをUpload

JekyllのCNAMEファイルにblog.example.comと書き、jekyll buildまで行っているものとする。

Jekyll projectのrootで、

`$ gsutil -m cp -R -a public-read  _site/* gs://blog.example.com`


で、_site/以下の全ファイルが公開状態で作成したbucketにuploadされる。


### index.htmlと404.htmlの設定

/にアクセスした際にindex.htmlを表示。また、404の際に404.htmlを表示する。

`gsutil web set -m index.html -e 404.html gs://blog.example.com`

#### 設定確認

`gsutil web get gs://blog.example.com`


#### 完了

http://blog.example.com で正常に表示されることを確認する。



あとはdeployのためのshell scriptを適当に書いておく。


<pre>
deploy.sh
#!/bin/sh

jekyll build
gsutil -m cp -R -a public-read  _site/* gs://blog.example.com
</pre>


## Ref

[https://cloud.google.com/storage/docs/website-configuration](https://cloud.google.com/storage/docs/website-configuration)
[https://cloud.google.com/storage/docs/gsutil/commands/cp](https://cloud.google.com/storage/docs/gsutil/commands/cp)
