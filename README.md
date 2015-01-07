Workshare File Weight Test
===========================
A test driven web application that allows a user to login to the workshare account and get a report detailing their files and relative weights.

Problem statement
------------------
This assessment consists in writing a simple application that prints out a report detailing the "weights" of the files of a user, categorized by file type. The basic weight of a file is equal to it size in KB multiplied by a "specific gravity" based on the type. The report should list for each category (if any file present) the number of files, the type, the weight of all the files of the same category (including the gravity) plus two extra lines showing the total weight of all files and the total "gravity displacement", which is the the difference between the total weights including gravity and the total ideal weights (1).

File types are Songs, Videos, Documents (office, openoffice,...), Text, Binaries, Others Gravity is 1.1 for Documents, 1.4 for Videos, 1.2 for Songs, 1 for the rest any other file types, with the results roundedup to the upper 0.05. A fixed gravity of 100 is added to Text files.
