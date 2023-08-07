# d_plugin

[![pub package](https://img.shields.io/pub/v/d_plugin.svg)](https://pub.dev/packages/d_plugin)

## installing

```yaml
dependencies:
  flutter:
    sdk: flutter
  d_plugin:
    git:
      url: https://github.com/DyrALT/d_plugin.git
      ref: master
```

## usage

`CachedImage()` Widget.

```dart
CachedImage(
  imageUrl: 'https://picsum.photos/250?image=9',
  placeholder: (context, url) => CircularProgressIndicator(),
  errorWidget: (context, url, error) => Icon(Icons.error),
),
```

`StringExtension` Extension.

```dart
String imageUrl = 'https://picsum.photos/250?image=9';
String userEmail = 'info@exmaple.com';

imageUrl.isUrl; // true
userEmail.isEmail; // true
```

`NavigatorManager` Extension.

```dart
context.navigation.pushNamed('/home');
context.navigation.push(ExampleVie());
context.navigation.pop();
```

`FadeInAnimation` Widget.

```dart
const FadeInAnimation(
  duration: Duration(milliseconds: 500),
  child: Text('Hello World'),
)
```
