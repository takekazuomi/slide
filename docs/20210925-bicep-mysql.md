---
marp: true
theme: gaia
_class: lead
paginate: true
backgroundColor: #fff
header: 'Japan Azure User Group'
footer: 'Takekazu Omi @Baleen.Studio'
headingDivider: 1
inlineSVG: true
style: |
    section.right * , h6{
        text-align: right;
        overflow-wrap: normal;
    }
---
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@700&display=swap');
section {
    font-family: 'Noto Sans JP', sans-serif;
}
</style>

# Bicep 入門 MySQL編 :muscle:
<!-- _class: right -->

![bg right:30%](https://live.staticflickr.com/5621/30650775650_fd5be9a183_h.jpg)

[Japan Azure User Group 11周年イベント](https://jazug.connpass.com/event/223585/)

###### by Takekazu Omi(*@Baleen.Studio*)

###### 2021/09/25 v1.1.0

![left w:300px](https://www.baleen.studio/img/company/img-symbol.png)

# 自己紹介

近江 武一 [@takekazuomi](https://twitter.com/takekazuomi)

- 所属 [jazug](https://r.jazug.jp/)、[baleen.studio](https://baleen.studio)（[仲間を募集中](https://www.wantedly.com/projects/624553)）
- [GitHub](https://github.com/takekazuomi)、Azure関連のPull request、気がついたら直す方向で
  - Private AKS Cluster の`.bicep`を[PR](https://github.com/Azure/bicep/pull/2155)
  - SQL Elastic Pool のTemplate が動かなくなってたので [PR](https://github.com/Azure/azure-quickstart-templates/pull/8440)
- Blog [kyrt.in](https://kyrt.in)、[zenn.dev](https://zenn.dev/takekazuomi)を使い始めた
  - [ARM tempate DSL、Bicep を使おう(1)](https://zenn.dev/takekazuomi/articles/bicep-getting-started)
  - [ARM tempate DSL、Bicep を使おう(2)](https://zenn.dev/takekazuomi/articles/bicep-getting-started2)

# 今日の話 :muscle:

- Bicep の紹介
- Bicep で、MySQLをデプロイ

# Bicep の紹介

- 公式ドキュメント
  - <https://docs.microsoft.com/ja-jp/azure/azure-resource-manager/bicep/overview>
- Bicep を使用したコードとしてのインフラストラクチャの概要
  - <https://docs.microsoft.com/ja-jp/learn/modules/introduction-to-infrastructure-as-code-using-bicep/>

# Bicep + VSCode

- Bicepの良さの半分はVCodeで出来ている
- Azure リソースの型情報を使って、VSCode上でLangage Serverを動かしてインテリセンスを実装
- Azure リソースの型情報、例えば、ACRのSKUの例
  - [azure-rest-api-specs](https://github.com/Azure/azure-rest-api-specs/blob/b49af808cba06f45b01193623ce1ff9e2e017777/specification/containerregistry/resource-manager/Microsoft.ContainerRegistry/preview/2021-06-01-preview/containerregistry.json#L3960-L3980)
  - azure-rest-api-specsが間違っていることがある
    - <https://github.com/Azure/bicep/issues/4577>

# Demo

1. mysql.bicep を作成
2. az group create --location ${l} -n ${g}
3. az deployment group create -g ${g} mysql.bicep

これで待つ。待ってる間に次へ

# 雑談

もう少し実用的なMySQL+Firewall+Log Analyticsな構成例
<https://github.com/takekazuomi/bicep-random-note/tree/main/src/0917/09>

- [MySQL](https://github.com/takekazuomi/bicep-random-note/blob/main/src/0917/09/mysql.bicep#L82)
- [firewallRules(IP)](https://github.com/takekazuomi/bicep-random-note/blob/main/src/0917/09/mysql.bicep#L119)
- [virtualNetworkRules(Subnet)](https://github.com/takekazuomi/bicep-random-note/blob/main/src/0917/09/mysql.bicep#L109)
- [Log Analytics](https://github.com/takekazuomi/bicep-random-note/blob/main/src/0917/09/diagnosticSettings/mysql.bicep#L13)

さらに時間があれば

# bicep registry

8/24 あたりにmainにマージされた、bicep registry の紹介

PRは、このへん

- <https://github.com/Azure/bicep/pull/4144>

使ってみた例は、このへん

- <https://github.com/takekazuomi/bicep-random-note/tree/main/src/0924>

# 今回のコンテンツ

- GitHub [20210925-bicep-mysql](https://github.com/takekazuomi/slide/blob/main/docs/20210925-bicep-mysql.md)
- Slide share [20210925-bicep-mysql](https://www.slideshare.net/takekazuomi/bicep-mysql/takekazuomi/bicep-mysql)
- Powerd by [Marp](https://github.com/marp-team/marp-cli#docker)。ありがとうございました。

# 終

![bg auto](https://live.staticflickr.com/1459/23349702424_d4c2459d64_h.jpg)
