# Making binaries of Earth
 
 ## Build earth-builder image
 $ docker-compose build earth-builder

 ## Rebuild Earth binaries
 $ docker-compose run earth-builder

 ## Copy binaries
 $ docker-compose build earth0 earth1 earth2 earth3 earth4

 ## Run services
 ### Debug nodes
 $ docker-compose run earth0
 $ docker-compose run earth1

 ### Seed nodes
 $ docker-compose up earth2 earth3 earth4

