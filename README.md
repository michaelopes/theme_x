
### ThemeX is an easy theme manipulation basied on Material Design. Only inform primary color and the ThemeX generate all color combination palette for you

## ThemeX result
![theme_x_palette](https://user-images.githubusercontent.com/10121156/140195240-f395fb4b-5f89-4d23-9a92-5b4963fa8773.jpg)


## Usage

ThemeX a simple usage. Only inform primary color and the magic happens

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
## How to see visual result?
For see result is simple call a dialog any page or menu that you will see the entire generated color palette
```dart
 showDialog(
  context: context,
  builder: (context) {
    return const ThemeXDialog();
  },
);
```
## How to get properties from ThemeX?

### Colors

#### Get primary color
```dart
var primary = ThemeX.I.primary;
```

#### OR get primary variants
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

#### Get secondary color
```dart
var secondary = ThemeX.I.secondary;
```

#### OR get secondary variants
```dart
var secondary100 = ThemeX.I.secondary[100];
var secondary200 = ThemeX.I.secondary[200];
var secondary400 = ThemeX.I.secondary[400];
var secondary700 = ThemeX.I.secondary[700];
```

#### Get Greyscale color
```dart
var grey = ThemeX.I.grey;
```

#### OR Greyscale variants
```dart
var grey50 = ThemeX.I.grey[50];
var grey100 = ThemeX.I.grey[100];
var grey200 = ThemeX.I.grey[200];
var grey300 = ThemeX.I.grey[300];
var grey400 = ThemeX.I.grey[400];
var grey500 = ThemeX.I.grey[500];
var grey600 = ThemeX.I.grey[600];
var grey700 = ThemeX.I.grey[700];
var grey800 = ThemeX.I.grey[800];
var grey900 = ThemeX.I.grey[900];
```

### Semantic colors
```dart
var success = ThemeX.I.success;
var danger = ThemeX.I.danger;
var warning = ThemeX.I.warning;
var info = ThemeX.I.info;
var secondarySuccess = ThemeX.I.secondarySuccess;
var secondaryDanger = ThemeX.I.secondaryDanger;
var secondaryWarning = ThemeX.I.secondaryWarning;
var secondaryInfo = ThemeX.I.secondaryInfo;
```

### Typography

```dart
var h1 = ThemeX.I.h1;
var h2 = ThemeX.I.h2;
var h3 = ThemeX.I.h3;
var h4 = ThemeX.I.h4;
var h5 = ThemeX.I.h5;
var bodyLarge = ThemeX.I.bodyLarge;
var bodyMedium = ThemeX.I.bodyMedium;
var buttonLarge = ThemeX.I.buttonLarge;
var buttonMedium = ThemeX.I.buttonMedium;
var subtitleLarge = ThemeX.I.subtitleLarge;
var subtitleMedium = ThemeX.I.subtitleMedium;
```

## Features

#### Discover Highlight/Contrast color from the another color
If you use the yellow color in the background and want to find out which one color accent this background
```dart
var backgroundAccentColor = ThemeX.I.contrastColor(Colors.yellow);
```

## Color engine
Color engine generate a pallet color variants basied on Constantin Material Design, Buckner Material Design and Traditional Material Design.

#### Pass attribute "colorEngine" on ThemeX create
```dart
final theme = ThemeX(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF684437),
    colorEngine: ThemeXColorEngine.constantin, //Or ThemeXColorEngine.buckner or ThemeXColorEngine.traditional
);
```

#### Pass attribute "googleFont" to using GoogleFonts packages
```dart
final theme = ThemeX(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF684437),
    colorEngine: ThemeXColorEngine.constantin, 
    googleFont: GoogleFonts.latoTextTheme, //Here pass google fonts
);
```




