composer install 

php artisan key:generate

php artisan migrate

php artisan passport:install


Personal access client created successfully.
Client ID: 1
Client secret: XXXX
Password grant client created successfully.
Client ID: 2
Client secret: XXXX


> $u = new User();
[!] Aliasing 'User' to 'App\Models\User' for this Tinker session.
= App\Models\User {#6313}

> $u->name = "sistemas@cepsi.gob.ar";
= "sistemas@cepsi.gob.ar"

> $u->email = "sistemas@cepsi.gob.ar";
= "sistemas@cepsi.gob.ar"

> $u->password = bcrypt("XXX");
= "$2y$10$x0T9.HrNfSU/fjnEM4afJ.lpjulp.qzKXtgPXWmFW/8hcMz3SFP2a"

> $u->save();
= true

> 


usuario@ac366ed19264:/var/www$ php artisan passport:client --password

 What should we name the password grant client? [SnowstormManager Password Grant Client]:
 > cepsi

 Which user provider should this client use to retrieve users? [users]:
  [0] users
 > 0

Password grant client created successfully.
Client ID: 3
Client secret: XXXX


# CON ESTO
sistemas@cepsi.gob.ar
XXXX
Client ID: 3
Client secret: XXXXX


curl --location 'localhost:90/oauth/token' \
--header 'Accept: application/json' \
--header 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode 'grant_type=password' \
--data-urlencode 'client_id=3' \
--data-urlencode 'client_secret=XXXX' \
--data-urlencode 'username=sistemas@cepsi.gob.ar' \
--data-urlencode 'password=XXXX' \
--data-urlencode 'scope=*'


{"token_type":"Bearer","expires_in":31622399,"access_token":"XXXX","refresh_token":"XXXX"}