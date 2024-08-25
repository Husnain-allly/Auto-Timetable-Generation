# Auto-Timetable-Generation
Project Title
Timetable Generation with Binary Encoding

Description
This project implements a timetable generation algorithm using a genetic algorithm approach. The solution is encoded in a binary format and aims to optimize the assignment of courses, professors, and rooms within a weekly schedule. The project outputs the best possible timetable after running through several generations.

Features
Genetic Algorithm: The core algorithm evolves the population of timetables over generations to achieve the best fitness score.
Binary Encoding: Each timetable's data, such as professor assignments, room allocations, and time slots, is encoded using binary values.
Fitness Calculation: The fitness score evaluates the quality of the timetable based on constraints like course clashes, room availability, and professor schedules.
Output: The program prints the best timetable generated after all iterations, showing the day, time, course, professor, and room assignments.
Usage
To run the code, execute the cells in the Jupyter notebook. The output will display the best timetable configuration after completing the genetic algorithm's evolution process.

Dependencies
Python 3.11.4
Jupyter Notebook
Notes
The code is structured to allow easy modification of parameters like the number of generations, population size, and time slots.
The project is a proof of concept and may require further adjustments for real-world applications.
