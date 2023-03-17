# demo_semantics

A sample App to demonstrate issues faced with Screen Readers on Web



## Setup

**Step 1:**

Download or clone this repo:


**Step 2:**

Go to project root and execute the following command in terminal to get the required dependencies: 

```
flutter pub get 
```

## Run on web

Go to project root and execute the following command in terminal to run the app in chrome browser

```
flutter run -d chrome 
```

## Issues with web screen readers
## Issues need to be resolved on Mac and Windows on Chrome, Safari and Edge browser

**1: Text Form Field**
1. Text Form fields do not get a focus
2. On windows using NVDA, user is not able set focus or remove focus. Focus on actionable widgets can be set only using Tab button
3. Validation error are only read the first time user clicks the submit button

**2: Alert Dialog**
1. Focus of alert dialog is not automatically set to title.
2. User is not aware that dialog box is opened since it is not announced by the screen reader

##### Temporary solution: Used SemanticsService.announce to resolve #2 (Works only on Mac web browesers)

**3: Date Picker**
1. When screen reader in enabled on web, if the first 3 rows of dates are disabled, user cannot select any valid date \nIn this example, user cannot select dates 23rd to 31st

##### Temporary solution: Used dates in text format in a DropdownButtonFormField

**4: Snack Bar**
1. Snack bars are not read out by windows screen readers NVDA

**5: Detecting if screen reader is enabled**
1. On web, we are unable to detect if screen readers are enabled using mediaQueryData.accessibleNavigation.
Value is always returned as enabled.
The mediaQueryData.accessibleNavigation return correct value on mobile app

##### Temporary solution:Added FAB button from which user has to enable Semantics ( RendererBinding.instance.setSemanticsEnabled(FAB button status);)

**6: Auto Scrolling with Screen Readers On**
1. When screen readers are activated, the pages do not always auto scroll to the elements beyond the visible area of the browser. This happens even when the reader announces the semantics for the element that is outside the currently visible area


**7: Focus Issue when navigating to detail screen**
1. When screen readers are activated and user tries to navigate from list to it's detail screen or it's child screen, the focus doesn't come on screen