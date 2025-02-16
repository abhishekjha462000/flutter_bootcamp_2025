void main() {
  // classes are just a blueprint for objects. Objects are used to represent real world entities.
  Cookie c = Cookie('Rectangle', 25);
  print(c._brand); // This can be done but this is not good programming practice.
  print(c.brand); // Instead, we should do like this
  c.brand = 'Britannia';
  print(c.brand);
}


class Cookie {
  // In dart, we use camel case for the name of a class
  String shape = 'Circle';
  int size = 10;
  String _brand = 'Bourbon'; // This is a private variable and this can be used only inside the file in which this class is present. 

  Cookie(this.shape, this.size);

  void startBaking() {
    print('Your cookie with shape $shape and size = $size has started baking.');
  }

  int get brand => _brand; // getter for private member _brand
  set brand(String newBrand) => _brand = newBrand; // setter for private member _brand
  
}
