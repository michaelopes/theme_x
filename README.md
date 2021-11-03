
### ThemeX is an easy theme manipulation basied on Material Design. Only inform primary color and the ThemeX generate all color combination palette for you

## ThemeX result
![theme_x_palette](https://user-images.githubusercontent.com/10121156/140195240-f395fb4b-5f89-4d23-9a92-5b4963fa8773.jpg)

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

ThemeX a simple usage, only informe primary color and the magic happens

#### Create a ThemeX instance 
```dart
final theme = ThemeX(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF684437),
    colorEngine: ThemeXColorEngine.traditional,
    backgroundColor: Colors.white,
);
```

#### Set theme on MaterialApp
```dart
MaterialApp(
  title: 'ThemeX',
  theme: theme.get(), //Here set theme attribute with ThemeX codes
  home: const MyHomePage(),
);
```

## How to get properties from ThemeX?

#### Get primary color
```dart
var primary = ThemeX.I.primary;
```
#### OR get variants
```dart
var primary50 = ThemeX.I.primary[50];
var primary100 = ThemeX.I.primary[100];
var primary200 = ThemeX.I.primary[200];
var primary300 = ThemeX.I.primary[300];
var primary400 = ThemeX.I.primary[400];
var primary500 = ThemeX.I.primary[500];
var primary600 = ThemeX.I.primary[600];
var primary700 = ThemeX.I.primary[700];
var primary800 = ThemeX.I.primary[800];
var primary900 = ThemeX.I.primary[900];

```
