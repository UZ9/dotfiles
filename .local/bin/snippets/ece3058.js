// usecase:
// 643426[23:13] should give you those particular bits 
// 634526 should give you 0110 0100 0011 0100 0010 0110
const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function question() {

  rl.question('Hex value with bit range (e.g. 32DFA657[25:17]): ', (input) => {
    const match = input.match(/^([0-9A-Fa-f]+)(?:\[(\d+):(\d+)\])?$/);
    if (!match) {
      console.log('Invalid input');
      rl.close();
      return;
    }

    const hex = match[1];
    const startBit = match[2] ? parseInt(match[2], 10) : null;
    const endBit = match[3] ? parseInt(match[3], 10) : null;

    const binary = parseInt(hex, 16).toString(2).padStart(32, '0');

    if (startBit !== null && endBit !== null) {
      const extractedBits = binary.slice(31 - startBit, 32 - endBit);
      console.log(`bits [${startBit}:${endBit}]: ${extractedBits}`);
    } else {
      const groupedBinary = binary.match(/.{1,4}/g).join(' ');
      console.log(`full binary: ${groupedBinary}`);
    }

    question();
  });
}

question();
