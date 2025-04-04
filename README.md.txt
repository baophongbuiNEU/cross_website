folder test: dart_frog
folder test_flutter: flutter

How to run:
- Open folder test -> run "dart_frog dev" in terminal
- Enter "http://localhost:8080/db/postgresql" to see sample database using PostgreSQL
- Open folder test_flutter -> Run debug to see the app has successfully connected to dart_frog

!!! Warning !!!
if you can't see any data after debugging the flutter app
=> run "dart pub global activate flutter_cors" -> "fluttercors --disable" then debug again
