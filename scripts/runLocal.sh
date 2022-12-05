
dotnet publish -c release -o ./app
dotnet ./app/GoatlyCore.dll --urls=http://localhost:5000
