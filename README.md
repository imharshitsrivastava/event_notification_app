# Event Notification App

## PreRequisites
- PostgreSQL
- Ruby version 3.1.1 via rvm or rbenv
- Rails

## Features:
* Create Event A: Clicking this button will create an instance of Event A associated with a user in Iterable.com.
* Create Event B: Clicking this button will create an instance of Event B associated with a user in Iterable.com.
* Email Notifications: For every Event B created, an email notification will be sent via the Iterable.com API using rake task.
* Mocking Iterable API: There is no api key unable to get the keys so I mocked it.

## Setup Instructions:
* Clone this repository to your local machine.
* Navigate to the project directory.
* Ruby version 3.1.1
* Install dependencies by running bundle install.
* Set up environment variables:
* Set up your .env.
* Obtain API keys from [Iterable](https://www.Iterable.com) (or use provided mock keys). if available
* Update .env file with your Iterable API keys.
* Run migrations with rails db:migrate to set up the database.
* Start the Rails server by running rails server.
* Access the application in your web browser at http://localhost:3000.

## Usage:
* Upon accessing the application need to sign up a user, you will see two link buttons on the UI: "Create Event A" and "Create Event B".
* Click "Create Event A" to trigger Event A creation for the associated user in [Iterable](https://www.Iterable.com).
* Click "Create Event B" to trigger Event B creation for the associated user in [Iterable](https://www.Iterable.com) .
* Upon creation of Event B, an email notification will be sent via  [Iterable](https://www.Iterable.com) API.

## Code Structure:
* app/controllers/events_controller.rb: Contains controller logic for handling event creation actions.
* app/models/event.rb: Defines the Event model.
* app/services/mock_iterable_service.rb: Contains logic for iterable api handling.
* config/routes.rb: Specifies application routes.
* app/views/: Contains view files for UI components.
* spec/: Directory for testing files.

## Testing:
* Run tests using RSpec by executing rspec command in the terminal.
