# Nimesa-Technologies-Intern_Assignment
Task 1 :
Write a terraform script to create resources mentioned below :

1. You need to create VPC with one private subnet and one public subnet. No need to create NAT gateway.

2. You need to create an EC2 instance in the above created VPC in public subnet, instance type should be t2.micro, volume size should be 8gb and volume type should be gp2, should not be encrypted. You need to Add tag as key should be "purpose" and value should be "Assignment".

3. You need to create security group and attach it to above Ec2 instance. Security group should have inbound rules for ssh port and should have outbound rules of all traffic.

The script and the proof of execution of the script is documented in Task 1 folder.

Task 2 :
The assignment is based on an API, wherein you will have to use the data provided in the API and write a program to get the Weather report, wind speed and pressure from the user and get the result based on the API.
API : https://samples.openweathermap.org/data/2.5/forecast/hourly?q=London,us&appid=b6907d289e10d714a6e88b30761fae22

The above API is the REST GET API Which gives you the response in JSON format and hourly weather forecast of London Location
I want you to write a program to get the option from the user and print the result based on the above API:
1. Get Temperature
2. Get Wind Speed
3. Get Pressure
0. Exit
If the user press 1, Prompt the user for the date with time then print the temp of the input date.
If the user press 2, Prompt the user for the date with time then print the wind.speed of the input date.
If the user press 3, Prompt the user for the date with time then print the pressure of the input date.
If the user press 0, Terminate the program.

The program and the proof of execution of the program is documented in Task 2 folder.
