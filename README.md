# Overview
_____________________________________________________________
This api is to allocate phone number between range of  111-111-1111 and 999-999-9999 to end user in a city. The allocated phone number has to be unique, and can not be assigned twice. 
# Setup
______________________________________________________________

### Installation
Install gems
```sh
$ bundle install
```
Migrate tables on database
```sh
$ rake db:migrate
```
#### Start Up Server
```sh
$ rails -s 
```
#### Unit Test
```sh
$ rspec
```

# Usage
______________________________________________________________
## Parameters
| Field     | Description |  Type | Option |
| ----------- | ----------- |----------- |----------- |
| city     | City       |  String |  required |
| phone_number  |  Phone Number    | Integer |  Optional

#### Url
``
localhost:3000/api/v1/phone_numbers
``
#### Method
``
Post
``
