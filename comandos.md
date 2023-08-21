composer install 

php artisan key:generate

php artisan migrate

php artisan passport:install


Personal access client created successfully.
Client ID: 1
Client secret: pc4LVlbf1ev24O28MAhbnnGYAr8ytYBC5CIVsB0q
Password grant client created successfully.
Client ID: 2
Client secret: 9zW6XASqWu6JYcTStOyIi6tMCeXSvwXXhsSf9lPO


> $u = new User();
[!] Aliasing 'User' to 'App\Models\User' for this Tinker session.
= App\Models\User {#6313}

> $u->name = "sistemas@cepsi.gob.ar";
= "sistemas@cepsi.gob.ar"

> $u->email = "sistemas@cepsi.gob.ar";
= "sistemas@cepsi.gob.ar"

> $u->password = bcrypt("snowstormcepsi");
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
Client secret: JFF078BUbd0Q9ji60K4waQjdzPezwpIeIkJMHJkh


# CON ESTO
sistemas@cepsi.gob.ar
snowstormcepsi
Client ID: 3
Client secret: JFF078BUbd0Q9ji60K4waQjdzPezwpIeIkJMHJkh


curl --location 'localhost:90/oauth/token' \
--header 'Accept: application/json' \
--header 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode 'grant_type=password' \
--data-urlencode 'client_id=3' \
--data-urlencode 'client_secret=JFF078BUbd0Q9ji60K4waQjdzPezwpIeIkJMHJkh' \
--data-urlencode 'username=sistemas@cepsi.gob.ar' \
--data-urlencode 'password=snowstormcepsi' \
--data-urlencode 'scope=*'


{"token_type":"Bearer","expires_in":31622399,"access_token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiMTc5Y2RmNDRkMzJjYmYxNzkyNmI1MTI3YmNiZGJhYzVkZDkyNDBmNTEzODVlOTVmYTExZTIzZTA3OWZlMTRjYTAxY2Q3MDY3NjI1YmYyYTYiLCJpYXQiOjE2OTI2NTYwNzUuOTM0NzA0LCJuYmYiOjE2OTI2NTYwNzUuOTM0NzA3LCJleHAiOjE3MjQyNzg0NzQuNzQzMjEsInN1YiI6IjEiLCJzY29wZXMiOlsiKiJdfQ.iMon_6O6UbHZJGwrLqjPtp86-SgaYXvOxh6y_tvJ_Ho-OYfS7ckYgClPYII9YJRk9uMvo3CBIWPEiy9BCaQTI1MFeH-fUUMASyqHzAHNyZcYLP_h6b94UlxP3xS4U89owcxwEF-YW0XL9qfewWYE6oM6UlQy3U_Z-PX96ULPk2yjo-jXtyzGqiI5x-rMl_Ly42zUlfhmj7rt0n5NXBldmTLag7qdP7g_dJKGHt3BZE6Anz_Jvv_TMnMqZ2Pm0BKyOhjSTQmZI8Lk4JeV0vru7B5SQ-8hJaDGsvm-I3PFbb-0-EQFF3iHyBIHsrNmY1fEch-Ey-aUBUJggpP7xZWdN49IBmovQ8PFyV5BDhAF47Hr3LasDTegS6-UjjeaBu_H3vs-SWZC4JSguRPYzMrAMAFL0fyg2pPJa25jtU9rS7a3_UYzLI__H5WXTsiD10kp8sfxRXnP92zbXMqIxk2ct4fnYlRmysrhafQ6qwtuh-7h-eCPWVoUbEO8OtgTVqQftSkzftB2cwCCz9nGAP3wuZSUFNXXrx46H5ezyB-oN_Z-2ZLxokVb4YIosHWosVZ_Mvs9pEGTVYKR5H5dOaZ9pBLLz8KQIhJzXh1XUZ9OfLcqbwaJcmZjUYkwBM3-SVDSoITcvjY_fmXxUd7VoPlzsdwRd3t0VczEGqnRFa163i8","refresh_token":"def5020033e7dddfaa9a1924cef39d380121a766431e384c6fed728ea14ecb86b6858714200aaa89fc40303eada52609a3ef0176bea6ff350d64fd3710302ae0a6d75080c65ac728a39ba2b34e17e0f1a9f442ad7f996d38c401b087e11ae450c6c7debfda1b1446cd4101caeb27495723e63f9e09c7d437060435b1a51eeb7010131890b305dd8926b795190808a621fb9f17ab25e60e777491a5bb6c040c4a328a8f7d34398cdea2a78782830fff828314b649c1dbe2052c3584b39ca1aa11ac6425618dbec8829b3cd9f227ab9b32df18c4638b87746f8b6d2856f607f6d649c6deff77aa5bdd59b5360e2bc536fe94a004fe72d0d9e528cf41325acc459e586daa309b06d17d867a007bad772c50b3a5b08496bc5e22caed6edf2766e5592fb5a996d353607ccaa8d9fc1f9de336bd61690403c225f78019e09dd38e3dc7c7311b8eeb20965c89cfc95858eb5df1aa5c014fc737a81db4f5b6d8f7219992220f9cc2"}