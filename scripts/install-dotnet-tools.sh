#!/bin/sh
if dotnet tool list -g | grep -q "dotnet-script"
then 
    dotnet tool update -g dotnet-script
else
    dotnet tool install -g dotnet-script
fi