const module = await import('./core/Instruction.js');
const { Instruction, convertRegToAbi } = module;

let start = 108

function generateInstruction(instructionHex) {
  let output = "";

  for (let i = 0; i < 8; i += 2) {
    let byte = instructionHex.substring(i, i + 2);

    output += "core_proc.MainMemory.data_RAM[" + start++ + "] = 8'h" + byte + ";\n";
  }

  return output;
}

// used on page 
function parseInstructions(instructions) {
  let output = "";

  instructions.forEach(instruction => {
    let parsedInstruction = new Instruction(instruction);

    output += generateInstruction(parsedInstruction.hex) + "\n";
  })

  return output;
}

let instructions = [
  "ADDI x20, x0, 100",
  "ADDI x21, x20, -20 ",
  "ADDI x22, x0, 80 ",
  "addi x23, x21, -120 ",
  "ADDI x24, x23, -120 ",
  "add x15, x15, x23 ",
  "sw x23, 100(x23) ",
  "addi x23, x23, 1000 |",
  "lw x23, 100(x15) ",
  "ADDI x23, x23, -20 ",
  "SLT x2, x24, x23 ",
  "addi x15, x15, -20 ",
  "JAL x10, -24"
]

parseInstructions(instructions);
