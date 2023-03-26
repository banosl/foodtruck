# Dude, Where's My FoodTruck?

<a name="readme-top"></a>

<!-- PROJECT SHIELDS -->
[![Activity][commit-activity-shield]][commit-activity-url]
[![Commit][last-commit-shield]][last-commit-url]
[![Contributors][contributors-shield]][contributors-url]
[![Code-Size][code-size-shield]][code-size-url]<br>
<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/Dude-Where-s-the-FoodTruck/be-dude-wheres-my-foodtruck">
  <h3 align="center">Dude Where's the Food Truck</h3>
  </a>
  

</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ul list-style-position="inside">
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#learning-goals">Learning Goals</a></li>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li>
      <a href="#usage">Usage</a>
      <ul>
        <li><a href="#endpoints">Endpoints</a></li>
      </ul>
    </li>
    <li><a href="#developers">Developers</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ul>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project

Dude, Where's the Food Truck is a web app where users can look up the available food trucks in a given area. Once choosing a food truck, a user can view where the food truck will be on a given date through a list of events displayed. Once registered, the owner of a food truck can add and edit events and their trucks's info. All 'events' visibile are created by food truck owners. 

This repo is the back end for such a website. It exposes custom endpoints for creating, editing, and deleting food trucks as well as corresponding events. The backend consumes third party APIs such as the Yelp Fusion API and the Google Places API.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Learning Goals
- Engage in an agile project development cycle.
- Collaborate between dedicated front end and back end teams.
- Customize RESTful API endpoints to meet the criteria set as a JSON contract.
- Learn to implement AWS' EC2 technology for deployment of the web app.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Built With

</br>[![Rails]][Rails-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->
## Getting Started

### Prerequisites

* Ruby 2.7.4
* Rails 5.2.8

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/Dude-Where-s-the-FoodTruck/be-dude-wheres-my-foodtruck.git
   ```
2. Install gems
   ```sh
   bundle install
   ```
3. Setup db
   ```js
   rails db:{create,migrate}
   ```
4. Run RSpec tests
    ```sh
    bundle exec rspec
    ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Schema



## Usage

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Endpoints

##### Status Codes

| Code    | Status    | Description   |
| :---    | :---      | :---          |
| 200     |    OK     |               |
| 404     | Not Found |               |
| 500     |           |               |
|         |           |               |

Root directory: 'http://localhost:3000/api/v1'

- `GET /food_trucks`
  - Params:
  - Successful response:
    ```
    {
      "data": [
         {"id": integer,
         "attributes": {
            "name": string,
            "cuisine_type": string,
            "web_link": string,
            "image_link": string
          }
         }
       ]
    }
    ```
- `GET /food_trucks/:id`
  - Params:
  - Successful response:
    ```
    {
     "data": {
        "id": integer,
        "attributes": {
          "name": string,
          "cuisine_type": string,
          "web_link": string,
          "image_link": string
         },
        "relationships": [
          {
            "type": event,
            "id": integer,
            "attributes": {
              "event_date": string,
              "latitude": integer,
              "longitude": integer,
              "start_time": string,
              "end_time": string,
              "description": text
            },
          }
        ]
      }
    }
    ```
- `POST food_trucks`
  - Params:
  - Body:
  - Successful response:
    ```
    {
      "data": [
         {"id": integer,
         "attributes": {
            "name": string,
            "cuisine_type": string,
            "web_link": string,
            "image_link": string
          }
         }
       ]
    }
    ```
- `PATCH food_trucks/:id`
  - Params:
  - Body:
  - Successful response:
    ```
    {
      "data": [
         {"id": integer,
         "attributes": {
            "name": string,
            "cuisine_type": string,
            "web_link": string,
            "image_link": string
          }
         }
       ]
    }
    ```
- `POST food_trucks/:id/events`
  - Params:
  - Body:
  - Successful response:
    ```
    {
      "data": {
        "id": integer,
        "attributes": {
          "event_date": string,
          "latitude": integer,
          "longitude": integer,
          "start_time": string,
          "end_time": string,
          "description": text,
          "city": string
        },
        "relationships": foodtruck_id
      }
    }
    ```

- `PATCH /food_trucks/:id/events/:id`
  - Params:
  - Body:
  - Successful response:
    ```
    {
      "data": {
        "id": integer,
        "attributes": {
          "event_date": string,
          "latitude": integer,
          "longitude": integer,
          "start_time": string,
          "end_time": string,
          "description": text,
          "city": string
        },
        "relationships": foodtruck_id
      }
    }
    ```
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTACT -->
## Developers

#### Front End

<div align="center">
  <p align="center">
    <!-- Angie -->
    <img src="https://avatars.githubusercontent.com/u/106895319?s=96&v=4" alt="Profile" width="80" height="80"><br>
      Angie Staffieri
      <a href="https://github.com/arstaffieri">Github: arstaffieri</a><br>
      <a href="https://www.linkedin.com/in/angie-staffieri/">LinkedIn</a><br>
    <!-- John -->
    <img src="https://avatars.githubusercontent.com/u/113194002?s=96&v=4" alt="Profile" width="80" height="80"><br>
      John Ammon
      <a href="https://github.com/Mortis78">Github: Mortis78</a><br>
      <a href="https://www.linkedin.com/in/johnathon-ammon-turing-01a86919a/">LinkedIn</a><br>
    <!-- Jordan -->
    <img src="https://avatars.githubusercontent.com/u/107894408?s=96&v=4" alt="Profile" width="80" height="80"><br>
      Jordan Smith
       <a href="https://github.com/jaysmith2022">Github: jaysmith2022</a>
      <a href="https://www.linkedin.com/in/jordan-smith-331a0280/">LinkedIn</a><br>
  </p>
</div>

#### Back End
  <div align="center">
  <p align="center">
<!-- Brady -->
  <img src="https://avatars.githubusercontent.com/u/108315713?v=4" alt="Profile" width="80" height="80"><br>
    Brady Rohrig
    <a href="https://github.com/BRohrig">Github: BRohrig</a><br>
    <a href="https://www.linkedin.com/in/bradyrohrig/">LinkedIn</a><br>

<!-- Bryan -->
  <img src="https://avatars.githubusercontent.com/u/109649285?s=96&v=4" alt="Profile" width="80" height="80"><br>
    Bryan Flanagan
    <a href="https://github.com/bflanagan138">Github: bflanagan138</a><br>
    <a href="https://www.linkedin.com/in/jordan-smith-331a0280/">LinkedIn</a><br>

<!-- Leo -->
  <img src="https://avatars.githubusercontent.com/u/111591731?v=4" alt="Profile" width="80" height="80"><br>
    Leo Banos Garcia
    <a href="https://github.com/banosl">Github: banosl</a>
    <a href="https://www.linkedin.com/in/leo-banos-garcia/">LinkedIn</a><br>

  </p>
</div>

  #### Project Management & Mentorship
<div align="center">
  <p align="center">
<!-- Brian -->
  <img src="https://avatars.githubusercontent.com/u/8962411?v=4" alt="Profile" width="80" height="80"><br>
    Brian Zanti
    <a href="https://github.com/brianzanti">Github: brianzanti</a><br>
    <a href="https://www.linkedin.com/in/brianzanti/">LinkedIn</a><br>

<!-- Taylor -->
  <img src="https://media.licdn.com/dms/image/C4E03AQFHaHNNYFW_ZQ/profile-displayphoto-shrink_400_400/0/1593050161041?e=1685577600&v=beta&t=5VbVgzqev-QMUqAmcqdSsAv5Rtj8DOzdOa2wLwjNpk0" alt="Profile" width="80" height="80"><br>
    Taylor Pridgen
    <a href="https://www.linkedin.com/in/taylor-pridgen-a3aa7918/">LinkedIn</a><br>

  
  </p>
</div>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [Choose an Open Source License](https://choosealicense.com)
* ["The Best README Template" by Github User othneil](https://github.com/othneildrew/Best-README-Template)
* APIs used:
  - [Google Places API](https://developers.google.com/maps/documentation/places/web-service/overview)
  - [Yelp Fusion API](https://docs.developer.yelp.com/docs/fusion-intro)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

[commit-activity-shield]: https://img.shields.io/github/commit-activity/m/Dude-Where-s-the-FoodTruck/be-dude-wheres-my-foodtruck?style=for-the-badge
[commit-activity-url]: https://github.com/Dude-Where-s-the-FoodTruck/be-dude-wheres-my-foodtruck/commits/main
[last-commit-shield]: https://img.shields.io/github/last-commit/Dude-Where-s-the-FoodTruck/be-dude-wheres-my-foodtruck?style=for-the-badge
[last-commit-url]: https://github.com/Dude-Where-s-the-FoodTruck/be-dude-wheres-my-foodtruck/commits/main
[contributors-shield]: https://img.shields.io/github/contributors/Dude-Where-s-the-FoodTruck/be-dude-wheres-my-foodtruck.svg?style=for-the-badge
[contributors-url]: https://github.com/Dude-Where-s-the-FoodTruck/be-dude-wheres-my-foodtruck/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/Dude-Where-s-the-FoodTruck/be-dude-wheres-my-foodtruck.svg?style=for-the-badge
[forks-url]: https://github.com/Dude-Where-s-the-FoodTruck/be-dude-wheres-my-foodtruck/network/members
[stars-shield]: https://img.shields.io/github/stars/Dude-Where-s-the-FoodTruck/be-dude-wheres-my-foodtruck.svg?style=for-the-badge
[stars-url]: https://github.com/Dude-Where-s-the-FoodTruck/be-dude-wheres-my-foodtruck/stargazers
[issues-shield]: https://img.shields.io/github/issues/Dude-Where-s-the-FoodTruck/be-dude-wheres-my-foodtruck.svg?style=for-the-badge
[issues-url]: https://github.com/Dude-Where-s-the-FoodTruck/be-dude-wheres-my-foodtruck/issues
[code-size-shield]: https://img.shields.io/github/languages/code-size/Dude-Where-s-the-FoodTruck/be-dude-wheres-my-foodtruck?style=for-the-badge
[code-size-url]: https://github.com/Dude-Where-s-the-FoodTruck/be-dude-wheres-my-foodtruck/wiki
[watchers-shield]: https://img.shields.io/github/watchers/Dude-Where-s-the-FoodTruck/be-dude-wheres-my-foodtruck?style=social
[watchers-url]: https://github.com/Dude-Where-s-the-FoodTruck/be-dude-wheres-my-foodtruck/network/members
[license-shield]: https://img.shields.io/github/license/Dude-Where-s-the-FoodTruck/be-dude-wheres-my-foodtruck.svg?style=for-the-badge
[license-url]: https://github.com/Dude-Where-s-the-FoodTruck/be-dude-wheres-my-foodtruck/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/linkedin_username
[product-screenshot]: images/screenshot.png
[Bootstrap.com]: https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white
[Bootstrap-url]: https://getbootstrap.com
[Rails]: https://img.shields.io/badge/-Ruby%20on%20Rails-CC0000?logo=ruby-on-rails&logoColor=white&style=for-the-badge
[Rails-url]: https://rubyonrails.org 