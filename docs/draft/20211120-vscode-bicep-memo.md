---
title: VSCode Conference Japan 2021 のメモ
---

VSCodeの集まりのURLと名称

VSCode Conference Japan 2021
https://vscodejp.github.io/conf2021/ja/

今日は、Bicep と VSCodeの話をします。

そもそもそ、Bicep って何？という人もいると思うので、

Bicep の紹介をして、VSCodeとBicepの関係の話をします。

## Bicepの紹介

Azureには、Azureの構成を宣言的に定義する、ARM Template というのがあります。

## ARM Templateとは

## ARM Template の問題

JSON

## 解決への道

- 型を導入
- JSONの廃止して独自構文

JavaScript とTypeScriptの関係に似ている

BicepはARM Templateの書きづらさ問題をほぼほぼ解決した。残はある。

## 型の導入

- 元々Azure Resource には型がある
- api specs として、型情報が公開されている
  - swagger(Open API)
- ここから、型情報を作る
  - https://github.com/Azure/bicep-types-az
- 出来上がったものは、nugetにある
  - https://www.nuget.org/packages/Azure.Bicep.Types.Az/
  - https://www.nuget.org/packages/Azure.Bicep.Types/
  - Type情報の実体は、
    - api spec から抜き出して、作ったJSONをリソースで埋め込んでる。

## Bicep LanguageServer

- https://github.com/Azure/bicep/tree/main/src/Bicep.LangServer
  - Bicep.LangServer.dll
  - 型情報があるので、エディターでの自動補完の範囲が増えた

## Demo

https://github.com/Azure/bicep/tree/main/src/vscode-bicep

1. Dot-property access
2. Resource property names & property values
3. List all available resource types
4. Other intellisense and completions
5. Snippets
6. Code navigation
7. Find all references, peek references
8. Outline view and breadcrumb view
9. Highlights
10. Hovers
11. Refactoring
    1. Rename symbol
    2. Formatting
12. Quick fixes
13. Insert Resource
    1. 先週マージされたやつ。

## devcontainerで楽々

Demo

## どんなAzureの新機能でも対応

Azure Native APIなので、新機能にも即時に対応できる。

しかし、ドキュメントがなかったり、肝心の型情報が無かったりで結構辛い。

例: Azure Container Apps

## 最後に

JAZUG の宣伝を入れる
