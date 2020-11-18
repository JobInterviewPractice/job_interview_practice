## About
* An app to practice job interview.
* In `start_page`, user can practice job interview by answering the question that app 
* User can also resister `Question` in `edit_page`, which seems to be asked in the interview.
* App can access device's camera and record the practice scene.(future task)  

## App Design
Please see [figma](https://www.figma.com/file/WbtYeobvJ4Pe2acxgKNkkL/Figma-Basics?node-id=0%3A286).  

## Archtecture(at the present)
```
.
├── data
│   ├── datasources
│   │   └── question_service.dart
│   └── models
│       └── question.dart
├── domain
│   ├── entities
│   │   └── question.dart
│   └── repository
│       └── question.dart
├── main.dart
├── presentation
   ├── pages
   │   ├── app.dart
   │   ├── edit.dart
   │   ├── home.dart
   │   ├── setting.dart
   │   └── start.dart
   └── widgets
       └── appBar.dart
```

### addtional features
* 他の人が苦手なquestionのlist化。サーバーがわでクエスチョンのレビューを集計している。
  - よく使われている質問をlist化してランキングにしてもいいかも
* 自分が独自に考えたquestionをアップできる。掲示板みたいなイメージ。(自分が考えたquestionが他の人にも使われているとuserとしてはやる気が出る？)
* 回答例が上がっているといいかも？？

Please see [figma](https://www.figma.com/file/WbtYeobvJ4Pe2acxgKNkkL/Figma-Basics?node-id=0%3A286).  
