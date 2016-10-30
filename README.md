## MLTS Map Generator

This is small app to generate custom Google Maps showing past MLTS screenings in each state.

## How to Use

###### Import Screenings from a spreadsheet (this takes some time, due to geocoding)

```bash
RAILS_ENV=development rake import:screenings
```
###### Generate the google maps:
Start the server then just open up the screenings index route:
```
localhost:3000/screenings
```
Map images will be generated automatically for each state and saved in the maps/ directory.
