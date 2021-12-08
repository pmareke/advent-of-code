export function solvePart1(input: string[]): number {
  return input.reduce(
    (acc, current) =>
      (acc += current
        .split(' | ')[1]
        .split(' ')
        .filter((o) => [2, 3, 4, 7].includes(o.length)).length),
    0,
  );
}

export function solvePart2(input: string[]): number {
  const result = input.reduce((acc, current) => {
    const parts = current.split(' | ');
    const decode = createDecode(parts[0]);
    const x = calculateNumber(decode, parts[1]);
    acc += x;
    return acc;
  }, 0);

  return result;
}

export function createDecode(input: string): { [key: string]: string } {
  const map: { [key: string]: string } = {};
  const command = input.split(' | ')[0].split(' ');

  command.reduce((acc, current) => {
    if (current.length === 2) map['1'] = current;
    if (current.length === 3) map['7'] = current;
    if (current.length === 4) map['4'] = current;
    if (current.length === 7) map['8'] = current;
    return acc;
  }, map);

  for (let i = 0; i < command.length; i++) {
    if (command[i].length === 6 && isSix(map['1'], command[i])) {
      map['6'] = command[i];
      break;
    }
  }

  for (let i = 0; i < command.length; i++) {
    if (
      command[i].length === 6 &&
      isZero(map['4'], command[i]) &&
      !Object.values(map).includes(command[i])
    ) {
      map['0'] = command[i];
      break;
    }
  }

  for (let i = 0; i < command.length; i++) {
    if (command[i].length === 6 && !Object.values(map).includes(command[i])) {
      map['9'] = command[i];
      break;
    }
  }

  for (let i = 0; i < command.length; i++) {
    if (command[i].length === 5 && isFive(map['6'], command[i])) {
      map['5'] = command[i];
      break;
    }
  }

  for (let i = 0; i < command.length; i++) {
    if (
      command[i].length === 5 &&
      isThree(map['9'], command[i]) &&
      !Object.values(map).includes(command[i])
    ) {
      map['3'] = command[i];
      break;
    }
  }

  for (let i = 0; i < command.length; i++) {
    if (command[i].length === 5 && !Object.values(map).includes(command[i])) {
      map['2'] = command[i];
      break;
    }
  }

  return map;
}

function isSix(current: string, input: string): boolean {
  return (
    input.split('').filter((x) => current.split('').includes(x)).length === 1
  );
}

function isZero(current: string, input: string): boolean {
  return (
    current.split('').filter((x) => !input.split('').includes(x)).length > 0
  );
}

function isFive(current: string, input: string): boolean {
  return (
    input.split('').filter((x) => current.split('').includes(x)).length === 5
  );
}

function isThree(current: string, input: string): boolean {
  return (
    input.split('').filter((x) => current.split('').includes(x)).length === 5
  );
}

export function calculateNumber(
  decode: { [key: string]: string },
  line: string,
): number {
  const result = line.split(' ').reduce((acc, current) => {
    Object.entries(decode).filter(([key, value]) => {
      if (
        current.split('').sort().join('') === value.split('').sort().join('')
      ) {
        acc += key;
      }
    });
    return acc;
  }, '');

  return Number(result);
}
