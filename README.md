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

## Allot phone number to user
### Parameters
| Field     | Description |  Type | example | Option |
| ----------- | ----------- |----------- |----------- |
| phone_number  |  Phone Number    | string | "312-111-2222 | required

#### Url
``
localhost:3000/api/v1/phone_numbers/assign
``
#### Method
``
Post
``
## To look up number
### Parameters
| Field     | Description |  Type | example | Option |
| ----------- | ----------- |----------- |----------- |
| phone_number  |  Phone Number    | string | "312-111-2222 | required

#### Url
``
localhost:3000/api/v1/phone_numbers/look_up
``
#### Method
``
Get
``

## To delete a phone number
### Parameters
| Field     | Description |  Type | example | Option |
| ----------- | ----------- |----------- |----------- |
| phone_number  |  Phone Number    | string | "312-111-2222 | required

#### Url
``
localhost:3000/api/v1/phone_numbers/delete
``
#### Method
``
Post
``

## To display all of the allotted phone numbers
### Parameters
``
none 
``
#### Url
``
localhost:3000/api/v1/phone_numbers/all_phones_numbers
``
#### Method
``
Get
``

