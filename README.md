## About
* An app to practice job interview.
* In `start_page`, user can practice job interview by answering the question that app 
* User can also resister `Question` in `edit_page`, which seems to be asked in the interview.
* App can access device's camera and record the practice scene.(future task)  

## App Design
Please see [figma](https://www.figma.com/file/WbtYeobvJ4Pe2acxgKNkkL/Figma-Basics?node-id=0%3A286).  

## Network Archtecture (at 11/18)
Please see [draw.io](https://drive.google.com/file/d/1-5v0tJmJKE0aCYI0HZs25003zDii1DZh/view?usp=sharing)

## Directory Archtecture(at 11/16)
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

