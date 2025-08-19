const fs = require("fs");
const path = require("path");

const sourceFile = path.join(__dirname, "source.txt");
const destinationFile = path.join(__dirname, "destination.txt");

fs.access(sourceFile, fs.constants.F_OK, (err) => {
  if (err) {
    console.error("❌ Source file does not exist.");
    return;
  }

  fs.copyFile(sourceFile, destinationFile, (copyErr) => {
    if (copyErr) {
      console.error("❌ Error while copying:", copyErr);
    } else {
      console.log("✅ File copied successfully to destination.txt");
    }
  });
});
