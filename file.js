
//Question 2 : Write a program to merge the contents of two files, “file1.txt” and “file2.txt”, into a 
//new file named “merged.txt”.

const fs = require('fs');

// Check if both files exist
if (fs.existsSync('file1.txt') && fs.existsSync('file2.txt')) {
    // Read contents of both files
    const data1 = fs.readFileSync('file1.txt', 'utf-8');
    const data2 = fs.readFileSync('file2.txt', 'utf-8');

    // Merge the contents with a newline in between (optional)
    const mergedData = data1 + "\n" + data2;

    // Write merged content to merged.txt
    fs.writeFileSync('merged.txt', mergedData);

    console.log("Files merged successfully!");
} else {
    console.log("One or both source files do not exist.");
}
