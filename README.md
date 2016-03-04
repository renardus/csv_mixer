# CSV Mixer
Purpose of this gem is to make it possible to manipulate CSV files.
The first operation which will be implemented is the addition of two files.

There are two additions possible: row and column addition.

With a row addition the headers need to be normalized that means that the resultant file will have a header composed of the headers of the two operands.
The first file header is taken and columns which are not present in the first file are added.

Another operation on one file which is needed, is the reordering of columns.

With a column addition there needs to be a key column which makes it possible to couple records.

