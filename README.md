# TemperatureChallengeSwiftui
First Challenge in 100 days of SwiftUI

### What I learned
- Forms in SwiftUI is like using the Eureka dependency
  - Allows for things like:
    - Text
    - TextFields
    - Picker
    - Segmented Control like picker
- Decimal output (specifier)
- Using enum to populate the `Picker`
  - String parent
  - CaseIterable - to make ForEach a breeze to use
  - Identifier - to give uuid for each cases
    - Needed in the `tag` - without this, SegmentedPickerStyle would not be clickable
- Navigation Bar Title and how to change its font `displayMode`
- Only 10 children can fit in a Form, Stacks, and many other views
- Computed property doesn't necessarily need get or set here
- Always use private with stateful variables

```
.previewDevice(PreviewDevice(rawValue: "iPhone 8 Plus"))
.previewDisplayName("iPhone 8 Plus")
```
