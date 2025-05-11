let start = 0

function generateInstruction(instructionHex) {
  let output = "";

  for (let i = 0; i < 8; i += 2) {
    let byte = instructionHex.substring(i, i + 2);

    output += "core_proc.InstructionFetch_Module.InstructionMemory.instr_RAM[" + start++ + "] = 8'h" + byte + ";\n";
  }

  return output;
}

// put your instruction hexes here
let instructions = [
  "00000000",
  "00002783",
  "00178793",
  "0080056f",
  "00a182b3",
  "00a782b3",
  "004005ef",
  "0040066f",
  "00c582b3",
  "003282b3",
  "00c006ef",
  "003a8a33",
  "fd9ff76f",
  "00402683",
]

instructions.forEach(instruction => console.log(generateInstruction(instruction)));
