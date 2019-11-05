# Koroibos
### A Turing Mod 4 Technical Challenge

---

Koroibos is a small API which provides data about the Olympics (currently just the 2016 Summer one). Built in Sinatra, using Postgres for databasing.

---

## Setup:
#### Remotely

The app has been deployed to Heroku, accessable here: https://korouroborous.herokuapp.com/

#### Locally

You will need: Bundle & Postgresql
1. Clone down this repo
2. Run `bundle` to install necessary dependencies
3. To run tests, make sure to run `rake` at least once (or after implementing any migrations), to set up the test database, afterwards, simply running `rspec` will do the trick.
4. To set up the development enviroment and seed the DB, run `rake import`
5. use `bundle exec rackup` to start the app, it will be accessible on `localhost:9292`

---

## How to Use:

* [All Olympians](#all-olympians)
* [Single Olympian](#single-olympian)
* [All Teams](#all-teams)
* [Single Team](#single-team)

#### All Olympians
GET `api/v1/olympians`
```
{"data":
  [
    {"id":"1",
     "type":"olympian",
     "attributes": {
        "name":"Andreea Aanei",
        "age":22,
        "team":"Romania",
        "sport":"Weightlifting",
        "total_medals":0
      }
    },
    {...}
  ]
}
```

#### Single Olympian
GET `api/v1/olympians/:id` (ex. 50)
```
{
  "data": {
    "id": "50",
    "type": "olympian",
    "attributes": {
      "name": "Denis Mikhaylovich Ablyazin",
      "age": 24,
      "team": "Russia",
      "sport": "Gymnastics",
      "total_medals": 3
    }
  }
}
```

#### All Teams
GET `api/v1/teams`
```
{
  "data": [
    {
      "id": "1",
      "type": "team",
      "attributes": {
        "name": "Romania",
        "olympians": [
          {
            "id": 2735,
            "name": "Valentina Neli Elisei (Ardean-)",
            "age": 34,
            "sex": "F",
            "height": 172,
            "weight": 64,
            "team_id": 1,
            "sport_id": 6
          },
          {...}
        ],
        "total_medals": 7
      }
    },
    {...}
  ]
}
```

#### Single Team
GET `/api/v1/teams/:id` (ex. 42)
```
{
  "data": {
    "id": "42",
    "type": "team",
    "attributes": {
      "name": "India",
      "olympians": [
        {
          "id": 77,
          "name": "Sharath Kamal Achanta",
          "age": 34,
          "sex": "M",
          "height": 186,
          "weight": 85,
          "team_id": 42,
          "sport_id": 21
        },
        {...}
      ],
      "total_medals": 0
    }
  }
}
```
