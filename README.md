<h1>Food Haven</h1>

- In a world with food deserts, Food Haven supplies the public with location services for local farmer's markets. The search for markets focuses on farmer's markets that accept Supplemental Nutrition Assistance Program (SNAP) benefits and identifies the type of benefit assistance at the market if the data is available. The user can then select a market they wish to visit and utilizing the maps portion of the application, the user may locate public service transit routes and schedules available to connect them to the market from their current location. 

<b>Developers:</b>

Kailey Kaes: https://github.com/kaileykaes

Jesse Sorman: https://github.com/Jesse193

Kim Bergstrom: https://github.com/kbergstrom78

Andy Stilmock: https://github.com/AStilmock

<h2>BE: https://github.com/FoodHaven/BE_APP</h2> 
- Consumes the microservice to get SNAP approved farmer markets. <br>

Dependencies: 

Microservice: https://github.com/FoodHaven/microservice_sinatra

Front End: https://github.com/FoodHaven/FE_APP

<h3>Getting started</h3>

Rails Version: 7.0.6

- Run `bundle install` to get all Gems to work properly

- Run `rails db:{drop,create,migrate,seed}`

<h4>APIs</h4>

- Microservice
  - Utilizes USDA farmer market data

  - https://foodhaven-df0d805938ff.herokuapp.com/markets
    - This endpoint renders an index of all farmers markets in the database.
    ![Alt text](app/assets/images/All_markets.png?raw=true)

  - https://foodhaven-df0d805938ff.herokuapp.com/markets/#{market_id}

    - Renders a a JSON object for a single market by that market's id.
     ![Alt text](app/assets/images/One_Market.png?raw=true)
      
    
<h4>Gems</h4>

- Geocoder
  - Used to find geolocation of user in order to find nearby farmer markets that accept SNAP and transit options
  - Documentation for Geocoder can be found here: https://github.com/alexreisner/geocoder
    
- Faraday
  - Used for HTTP request to APIs 
  - Documentation for Faraday can be found here: https://lostisland.github.io/faraday/#/

- Figaro
  - Used to mask API key(s) from files. 
  - Documentation for Figaro can be found here: https://rubygems.org/gems/figaro/versions/1.1.1

- Webmock
  - Used to stub HTTP request
  - Documentation for Webmock can be found here: https://rubygems.org/gems/webmock/versions/3.18.1
