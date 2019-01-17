# MRDataSource
I decided to make this to explore some architectural problems and save myself some time down the road. 
It is much quicker to whip up multiple screens now along with having thinned down view controllers, and a nice separation of concerns. 
The abstraction currently provides DataSource/Delegate default functionality for `numberOfSections`, `numberOfItemsInSection`, `cellForItem`, `didSelectItem` alongside basic section header configuration. 
I look forward to improving this as time permits. 

## Getting Started
These are the minimum steps to get started.

### 1.
* Create a View Model object that conforms to the `MRViewModel` protocol.

### 2.
* Create a UITableViewCell or UICollectionViewCell that conforms to the `MRConfigurableCell` protocol. 

### 3.
* Create a `MRTableViewController` or `MRCollectionViewController` subclass.
* Connect the UITableView or UICollectionView outlet to the class.
* Override the `registerCells()` method if needed.
* In the appropriate lifecycle method, create `MRViewModel` objects from step 2 followed by adding them to `MRDataSection` objects as appropriate. 
* Assign `self.sections` to array of `MRDataSection` objects
* Override any delegate methods necessary such as didSelect. The corresponding view model can be accessed via the sections property. I suggest pattern matching to decide what action to take if there is multiple types.

### Contained is a simple UITableView Example


