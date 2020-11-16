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
