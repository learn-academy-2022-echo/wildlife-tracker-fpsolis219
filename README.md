# README

Wildlife Tracker Challenge
The Forest Service is considering a proposal to place in conservancy a forest of virgin Douglas fir just outside of Portland, Oregon. Before they give the go ahead, they need to do an environmental impact study. They've asked you to build an API the rangers can use to report wildlife sightings.

Story 1: In order to track wildlife sightings, as a user of the API, I need to manage animals.

Branch: animal-crud-actions

Acceptance Criteria

Create a resource for animal with the following information: common name and scientific binomial

<!-- rails generate resource Creature  common_name:string scientific_binomial:string -->

Can see the data response of all the animals

<!-- def index
        creatures = Creature.all 
        render json: creatures
    end
    
    get 'creatures' => 'creatures#index'

/////////postman///////

    get localhost:3000/creatures send

     {
        "id": 1,
        "common_name": "human",
        "scientific_binomial": "homosapien",
        "created_at": "2022-09-10T21:12:55.084Z",
        "updated_at": "2022-09-10T21:12:55.084Z"
    } -->

Can create a new animal in the database

<!-- def create
        creatures = Creature.create(creatures_params)
        if creatures.valid?
          render json: creatures
        else
          render json: creatures.errors
        end
      end
    
      private
      def creatures_params
        params.require(:creature).permit(:common_name, :scientific_binomial)
      end

      post 'creatures' => 'creatures#create'

//////////postman////////

post localhost:30000/creatures

{
    "common_name": "crocadile",
        "scientific_binomial": "Crocodylinae"
}

///////return//////

{
    "id": 2,
    "common_name": "crocadile",
    "scientific_binomial": "Crocodylinae",
    "created_at": "2022-09-10T21:44:40.617Z",
    "updated_at": "2022-09-10T21:44:40.617Z"
} -->



Can update an existing animal in the database
<!-- def update
        creatures = Creature.find(params[:id])
        creatures.update(creatures_params)
        if creatures.valid?
            render json: creatures
          else
            render json: creatures.errors
          end
        end

        post 'creatures' => 'creatures#create

        ///////posman//////

        patch localhost:3000/creatures/2

        {
    "common_name": "crocadile",
        "scientific_binomial": "Crocodylinae"
}

{
    "common_name": "crocadilians",
    "scientific_binomial": "Crocodylinae",
    "id": 2,
    "created_at": "2022-09-10T21:44:40.617Z",
    "updated_at": "2022-09-10T21:58:08.609Z"
} -->



Can remove an animal entry in the database

<!-- def destroy
            creatures = Creature.find(params[:id])
            if creatures.destroy
              render json: creatures
            else
              render json: creatures.errors
            end
          end

          delete 'creatures/:id' => 'creatures#destroy'
///////postman///////

delete http://localhost:3000/creatures/3/4   send -->


Story 2: In order to track wildlife sightings, as a user of the API, I need to manage animal sightings.

Branch: sighting-crud-actions

Acceptance Criteria

Create a resource for animal sightings with the following information: latitude, longitude, date
Hint: An animal has_many sightings (rails g resource Sighting animal_id:integer ...)
Hint: Date is written in Active Record as yyyy-mm-dd (“2022-07-28")

<!-- rails generate resource Sighting animal_id:integer latitude:string longitude:string date:string -->


Can create a new animal sighting in the database 

<!-- def create
        sightings = Sighting.create(sightings_params)
        if sightings.valid?
          render json: sightings
        else
          render json: sightings.errors
        end
      end
      private
      def sightings_params
        params.require(:sighting).permit(:animal_id, :latitude, :longitude, :date)
      end -->

Can update an existing animal sighting in the database

<!-- def update
        sightings = Sighting.find(params[:id])
        sightings.update(sightings_params)
        if sightings.valid?
            render json: sightings
          else
            render json: sightings.errors
          end
        end  -->

<!-- {
    "animal_id": 4,
        "latitude": "0.0000",
        "longitude": "0.0000",
        "date": "2022-09-10"
}

{
    "animal_id": 4,
        "latitude": "1.11111",
        "longitude": "1.1111",
        "date": "2022-09-10"
} -->


Can remove an animal sighting in the database

<!-- def destroy
            sightings = Sighting.find(params[:id])
            if sightings.destroy
              render json: sightings
            else
              render json: sightings.errors
            end
          end -->
<!-- ///////postman///////

delete http://localhost:3000/sightings/6   send --> -->
Story 3: In order to see the wildlife sightings, as a user of the API, I need to run reports on animal sightings.

Branch: animal-sightings-reports

Acceptance Criteria

Can see one animal with all its associated sightings
Hint: Checkout this example on how to include associated records
Can see all the all sightings during a given time period
Hint: Your controller can use a range to look like this:
class SightingsController < ApplicationController
  def index
    sightings = Sighting.where(date: params[:start_date]..params[:end_date])
    render json: sightings
  end
end
Hint: Be sure to add the start_date and end_date to what is permitted in your strong parameters method
Hint: Utilize the params section in Postman to ease the developer experience
Hint: Routes with params
Stretch Challenges
Story 4: In order to see the wildlife sightings contain valid data, as a user of the API, I need to include proper specs.

Branch: animal-sightings-specs

Acceptance Criteria
Validations will require specs in spec/models and the controller methods will require specs in spec/requests.

Can see validation errors if an animal doesn't include a common name and scientific binomial
Can see validation errors if a sighting doesn't include latitude, longitude, or a date
Can see a validation error if an animal's common name exactly matches the scientific binomial
Can see a validation error if the animal's common name and scientific binomial are not unique
Can see a status code of 422 when a post request can not be completed because of validation errors
Hint: Handling Errors in an API Application the Rails Way
Story 5: In order to increase efficiency, as a user of the API, I need to add an animal and a sighting at the same time.

Branch: submit-animal-with-sightings

Acceptance Criteria

Can create new animal along with sighting data in a single API request
Hint: Look into accepts_nested_attributes_for