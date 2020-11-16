## About
* 
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

## Feature

### /home_page
- Buttons to jump each app page.  
### /start_page
- ExitButton to exit.
- NextButton to change current question  
### /setting_page
- 'number of question' button
### /edit_page



