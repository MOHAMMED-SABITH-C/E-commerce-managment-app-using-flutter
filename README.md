# E-COMMERCE MANAGEMENT APP - flutter 

A new Flutter project.

## Getting Started

### 1. Introduction

In this modern era of online shopping no seller wants to be left behind, moreover due to its simplicity the shift from offline selling model to an online selling model is witnessing a rampant growth.
Therefore, as an engineer our job is to ease the path of this transition for the seller. Amongst many things that an online site requires the most important is a database system. Hence in this project we are planning to design a database where small supermarket seller can sell their product online.

### 2. Basic Structure

#### 2.1 Functional requirement
- A new user can register on the App.
- A registered user can login using mobile number
- A customer can see details of the product present in the cart
- Admin can start a sale with certain discount on every product.
- Customer can sort the product based on price.
- Customer can filter the product based on the product details.
- A customer can get the bill of purchased product.
- A customer can add or delete a product from the cart.
- A customer can get the bill of products purchased from cart .
- Admin can view details and edit the all details of existing products
- Admin can add and delete perticular products.
#### 2.2 Software Requirements
• Flutter SDK
• SQLite

### 3. System Design

##### Tables
• User: Stores the details of users with phone number (phone)as the primary key.
• Cart: Cart table is use to store the carted product of users .Every product is stored with user phone number which is a foreign key that references the User table.Primary keys are phone number and product name.
• Electronic Devices: Which is used to store Electronic devices by admin.Primary key is name of products
• Vegitables: Which is used to store Vegitables by admin.Primary key is product name.
• Fruits: Which is used to store Fruits by admin.primary key is name of product.
##### Functions
• AddStocks:Admin can add products in each table with full details of product.
• UpdateStroks:Admin can update the stocks 
• Sort :Sort function is used to sort the product based on price.
• Search: Search function is used to search the perticular product.
• AddCart:User can update cart

### 4. User Interface

### User Section:

<img src="https://user-images.githubusercontent.com/128989395/229332810-72c72273-ae60-4816-9658-7b7fb1e2caf0.png"  width =" 330"> <img src="https://user-images.githubusercontent.com/128989395/229332825-ac663ee7-3ccd-466e-979d-e7a155bbcb08.png"  width =" 330">
<img src="https://user-images.githubusercontent.com/128989395/229332851-863077db-59eb-4dd5-bacd-11e92c0e6e9e.png"  width =" 330"> <img src="https://user-images.githubusercontent.com/128989395/229332862-cd2f2f1b-9039-4ff5-9188-dac8416c1c10.png"  width =" 330">
<img src="https://user-images.githubusercontent.com/128989395/229332862-cd2f2f1b-9039-4ff5-9188-dac8416c1c10.png"  width =" 330">
<img src="https://user-images.githubusercontent.com/128989395/229332865-4f964b19-49d3-4be4-9b17-44b99328959b.png"  width =" 330">
<img src="https://user-images.githubusercontent.com/128989395/229332872-121ae747-4f4e-48ea-a727-ccd795f72421.png"  width =" 330">
<img src="https://user-images.githubusercontent.com/128989395/229333112-1b038bbe-d68b-49b5-a197-a516e15557ba.png"  width =" 330">

#### Cart section:

<img src="https://user-images.githubusercontent.com/128989395/229333126-96ec29b1-83f8-4f96-b64f-a338f2c780ca.png"  width =" 330"> <img src="https://user-images.githubusercontent.com/128989395/229333239-5014b178-8eb5-4656-8b80-b9c27e7d0ff8.png"  width =" 330">
<img src="https://user-images.githubusercontent.com/128989395/229334222-caaf7936-455d-4a63-8e3b-a9748b583858.png"  width =" 330">

### Admin Section:

<img src="https://user-images.githubusercontent.com/128989395/229334328-856174b1-bc84-408b-bd61-ba4d7746abe5.png"  width =" 330"> <img src="https://user-images.githubusercontent.com/128989395/229334344-4639ab82-efb1-4d09-b593-825d04530b5f.png"  width =" 330">
<img src="https://user-images.githubusercontent.com/128989395/229334351-eec1cc6e-9315-468a-a323-f6c4cfe6edde.png"  width =" 330">

add items:  ______________________________________  update values of items:

<img src="https://user-images.githubusercontent.com/128989395/229334358-08b75a62-1458-4443-b82c-8ba0c637df31.png"  width =" 330"> <img src="https://user-images.githubusercontent.com/128989395/229334361-a896e0d3-af44-4cf2-9adc-1df53df49bb0.png"  width =" 330">




This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
