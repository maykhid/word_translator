<!-- <div align="center" id="top"> 
  <img src="./.github/app.gif" alt="Word Translator" />
 -->
  &#xa0;

  <!-- <a href="https://word_translator.netlify.app">Demo</a> -->
</div>

<h1 align="center">Word Translator</h1>

<p align="center">
  <img alt="Github top language" src="https://img.shields.io/github/languages/top/maykhid/word_translator?color=56BEB8">

  <img alt="Github language count" src="https://img.shields.io/github/languages/count/maykhid/word_translator?color=56BEB8">

  <img alt="Repository size" src="https://img.shields.io/github/repo-size/maykhid/word_translator?color=56BEB8">

<!--   <img alt="License" src="https://img.shields.io/github/license/maykhid/word_translator?color=56BEB8"> -->

  <!-- <img alt="Github issues" src="https://img.shields.io/github/issues/{{YOUR_GITHUB_USERNAME}}/word_translator?color=56BEB8" /> -->

  <!-- <img alt="Github forks" src="https://img.shields.io/github/forks/{{YOUR_GITHUB_USERNAME}}/word_translator?color=56BEB8" /> -->

  <!-- <img alt="Github stars" src="https://img.shields.io/github/stars/{{YOUR_GITHUB_USERNAME}}/word_translator?color=56BEB8" /> -->
</p>

<!-- Status -->

<!-- <h4 align="center"> 
	🚧  Word_translator 🚀 Under construction...  🚧
</h4> 

<hr> -->

<p align="center">
  <a href="#dart-about">About</a> &#xa0; | &#xa0; 
  <a href="#sparkles-features">Features</a> &#xa0; | &#xa0;
  <a href="#rocket-technologies">Technologies</a> &#xa0; | &#xa0;
  <a href="#white_check_mark-requirements">Requirements</a> &#xa0; | &#xa0;
  <a href="#checkered_flag-starting">Starting</a> &#xa0; | &#xa0;
<!--   <a href="#memo-license">License</a> &#xa0; | &#xa0; -->
  <a href="https://github.com/maykhid" target="_blank">Author</a>
</p>

<br>

## :dart: About ##

This is a Translator app built with Flutter employing the <a href="https://azure.microsoft.com/en-us/services/cognitive-services/translator/#overview" target="_blank"> Microsoft Azure Translator Service</a>. Adhered to the Clean Architecture and Test Driven Development pattern proposed by Uncle Bob. This is a reproduction of a web project I saw online somewhere can't exactly remember now so I can't credit.

## :sparkles: Features ##

:heavy_check_mark: Provides realtime translation service for over 90+ languages.\
:heavy_check_mark: Clipboard feature to ease copying translated results.
<!-- :heavy_check_mark: Feature 3; -->

## :rocket: Technologies ##

The following tools were used in this project:

- [Flutter](https://flutter.dev/)
- [Dart](https://flutter.dev/)

<!-- - [Node.js](https://nodejs.org/en/)
- [React](https://pt-br.reactjs.org/)
- [React Native](https://reactnative.dev/) -->

## :white_check_mark: Requirements ##

Before starting :checkered_flag:, you need to have [Git](https://git-scm.com) and [Flutter](https://flutter.dev) installed.

## :checkered_flag: Starting ##

Do read <a href="https://azure.microsoft.com/en-us/services/cognitive-services/translator/#overview" target="_blank"> Microsoft Azure Translator Service</a> to subscribe and get your secret keys.

```bash
# Clone this project
$ git clone https://github.com/maykhid/word_translator

# Install dependencies
$ flutter pub get

From Android Studio/IntelliJ: Click Packages get in the action ribbon at the top of pubspec.yaml.

From VS Code: Click Get Packages located in right side of the action ribbon at the top of pubspec.yaml.

You need an Azure subscription and secret keys. When those are available you can directly add the secret keys to lib/features/translator_app/data/datasources/translator_remote_data_src.dart or create a seperate file lib/secrets.dart and add the keys there.
```

## 🖼️ Screenshots ##
<p float="left">
  <img src= "https://user-images.githubusercontent.com/54851623/197097148-203db6e1-8bf4-48ff-bc02-50f317ee244f.png" width="320" height="700" />
  <img src="https://user-images.githubusercontent.com/54851623/197097239-6f4a2b21-bded-439c-8945-92f705b1cb24.png" width="320" height="700"/> 
  <img src="https://user-images.githubusercontent.com/54851623/197097279-cbdfe44d-12c2-4511-a1b6-010c38f83a65.png" width="320" height="700" />
</p>
<!-- 
## :memo: License ##![Simulator Screen Shot - iPhone 12 Pro - 2022-10-21 at 03 25 07](https://user-images.githubusercontent.com/54851623/197097148-203db6e1-8bf4-48ff-bc02-50f317ee244f.png)![Simulator Screen Shot - iPhone 12 Pro ![Simulator Screen Shot - iPhone 12 Pro - 2022-10-21 at 03 26 20](https://user-images.githubusercontent.com/54851623/197097279-cbdfe44d-12c2-4511-a1b6-010c38f83a65.png)
- 2022-10-21 at 03 26 12](https://user-images.githubusercontent.com/54851623/197097239-6f4a2b21-bded-439c-8945-92f705b1cb24.png)



This project is under license from MIT. For more details, see the [LICENSE](LICENSE.md) file. -->


Made with :heart: by <a href="https://github.com/maykhid" target="_blank">maykhid</a>

&#xa0;

<!-- <a href="#top">Back to top</a> -->
