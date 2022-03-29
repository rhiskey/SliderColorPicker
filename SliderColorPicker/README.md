#  SliderColorPicker

Make a screen where you can change the background color of the view using sliders. 
The value of each slider should be displayed in the corresponding label. 
The color of the slider to the left of the slider must match the color for which it is responsible.

Add another screen and make it the start screen. The second screen is the settings screen, where you can adjust the color for the first screen.

When you go to the settings screen, you need to pass the current color of the main screen to ColorView.
When closing the settings screen, pass the color selected in the settings to the main application screen using delegation.

### Optional

Make text fields where you can set the color value from the on-screen keyboard. When calling the keyboard, make it possible to set the entered values ​​using the "Done" button. When you click on this button, the keyboard should be hidden. Also make it possible to hide the keyboard by tapping on the screen.

To work with text fields, subscribe the class to the UITextFieldDelegate protocol and implement the textFieldDidEndEditing(_ textField: UITextField) protocol method to pass the entered text values ​​to labels and sliders.

Slider values ​​must be passed to labels and text fields at the same time. Values ​​entered into text fields must be passed simultaneously to sliders and labels. In case of entering invalid values, an alert controller should be displayed.
