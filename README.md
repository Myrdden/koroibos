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
* [All Events](#all-events)
* [Single Event](#single-event)
* [Olympian Stats](#olympian-stats)
* [Youngest and Oldest Olympian](#youngest-and-oldest-olympian)
* [All Medalists for Event](#all-medalists-for-event)

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

#### All Events
GET `api/v1/events`
```
{
  "data": [
    {
      "id": "1",
      "type": "sport",
      "attributes": {
        "name": "Weightlifting",
        "events": [
          "Weightlifting Women's Super-Heavyweight",
          "Weightlifting Men's Heavyweight",
          "Weightlifting Men's Middleweight",
          "Weightlifting Men's Middle-Heavyweight",
          "Weightlifting Men's Featherweight",
          "Weightlifting Women's Flyweight",
          "Weightlifting Women's Middleweight",
          "Weightlifting Women's Lightweight",
          "Weightlifting Men's Lightweight",
          "Weightlifting Men's Super-Heavyweight",
          "Weightlifting Men's Light-Heavyweight",
          "Weightlifting Women's Heavyweight",
          "Weightlifting Women's Light-Heavyweight",
          "Weightlifting Men's Bantamweight",
          "Weightlifting Women's Featherweight"
        ]
      }
    },
    {...}
  ]
}
```

#### Single Event
GET `/api/v1/events/:id` (ex. 24)
```
{
  "data": {
    "id": "24",
    "type": "event",
    "attributes": {
      "name": "Boxing Men's Lightweight",
      "olympians": [
        {
          "id": 19,
          "name": "Mahmoud Abdelaal",
          "age": 24,
          "sex": "M",
          "height": 176,
          "weight": 60,
          "team_id": 12,
          "sport_id": 7
        },
        {...}
      ]
    }
  }
}
```

#### Olympian Stats
GET `/api/v1/olympian_stats`
```
{
  "data": {
    "id": "0",
    "type": "stats",
    "attributes": {
      "total_competing_olympians": 2850,
      "average_weight": {
        "units": "kg",
        "male_olympians": "79.38",
        "female_olympians": "62.69"
      },
      "average_age": "26.37"
    }
  }
}
```

#### Youngest and Oldest Olympian
GET `api/v1/olympians?age=[oldest|youngest]`
```
{
  "data": {
    "id": "1321",
    "type": "olympian",
    "attributes": {
      "name": "Julie Brougham",
      "age": 62,
      "team": "New Zealand",
      "sport": "Equestrianism",
      "total_medals": 0
    }
  }
}

{
  "data": {
    "id": "2190",
    "type": "olympian",
    "attributes": {
      "name": "Ana Iulia Dascl",
      "age": 13,
      "team": "Romania",
      "sport": "Swimming",
      "total_medals": 0
    }
  }
}
```

#### All Medalists for Event
GET `api/v1/events/:id/medalists` (ex. 9)
```
{
  "data": {
    "id": "9",
    "type": "event_medalist",
    "attributes": {
      "name": "Rowing Men's Coxless Pairs",
      "medalists": [
        {
          "name": "Giovanni Abagnale",
          "team": {
            "id": 3,
            "name": "Italy"
          },
          "age": 21,
          "medal": "Bronze"
        },
        {
          "name": "Hamish Byron Bond",
          "team": {
            "id": 52,
            "name": "New Zealand"
          },
          "age": 30,
          "medal": "Gold"
        },
        {...}
      ]
    }
  }
}
        
```
