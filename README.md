# MRDataSource
I decided to make this to explore some architectural problems and save myself some time down the road. 
It is much quicker to whip up multiple screens now along with having thinned down view controllers, and a nice separation of concerns. 
I look forward to keep improving this as time permits. 

## Steps to Implement
These are the bare minimum steps to get started.

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

### Contained is a simple UITableView Example


