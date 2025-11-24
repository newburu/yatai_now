# Yatai Location Sharing App

This is a Ruby on Rails application for sharing the real-time location of festival stalls (yatai).

## Features

- **Real-time Map View:** Visitors can view the current location of all stalls on a map.
- **GPS Sending:** Designated users can send their stall's GPS location.
- **Stall Management:** Stall managers can update their stall's information.
- **Admin Dashboard:** Administrators can manage festivals, stalls, and user accounts.

## Technology Stack

- **Backend:** Ruby on Rails
- **Database:** PostgreSQL
- **Frontend:** Hotwire (Turbo, Stimulus), Importmap
- **Authentication:** Devise
- **Authorization:** Pundit
- **Deployment:** Kamal

## Development Setup

### Prerequisites

- Ruby (see `.ruby-version` for the exact version)
- PostgreSQL

### Installation

1.  **Clone the repository:**
    ```bash
    git clone <repository-url>
    cd <repository-directory>
    ```

2.  **Install Ruby dependencies:**
    ```bash
    bundle install
    ```

3.  **Create and configure the database:**
    - Create a PostgreSQL user and database.
    - Copy `.env.example` to `.env` and fill in your database credentials:
      ```bash
      cp .env.example .env
      ```

4.  **Set up the database:**
    ```bash
    bundle exec rails db:create
    bundle exec rails db:migrate
    bundle exec rails db:seed_fu
    ```

### Running the Application

- **Start the Rails server:**
  ```bash
  bundle exec rails server
  ```

- **Run the test suite:**
  ```bash
  bundle exec rails test
  ```

## Deployment

This application is configured for deployment with [Kamal](https://kamal-deploy.org/). Refer to the official Kamal documentation for deployment instructions.
