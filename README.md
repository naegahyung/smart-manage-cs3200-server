# CS3200 Smart Manage Server side

This is a server-side code for CS3200 project.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software and how to install them

```
python 2.7 (python 3 might work, but development was done in python 2)
pip 19.0.3
mysql 8.0.15
virtualenv
```

### Installing

A step by step series of examples that tell you how to get a development env running.

Before starting a development server, you must have SQL table defined. Data/smart_manage.sql is a dump file you can use.
You must create an .env file or a way to set environmental variables on the initiation of the server.
You must have the following environmental variables: 

```
DATABASE_USERNAME=root
DATABASE_PASSWORD=
DATABASE_SCHEMA= ?? YOUR_CHOICE ??
DATABASE_PORT=3306
DATABASE_HOST=localhost
PORT=5000
```

1. virtualenv venv
2. pip install 

### Running

Once you have set up everything correctly, you won't see any error running the server.

You run the server by:
```
flask run
```