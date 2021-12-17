import { Package } from './types';

export function parse(input: string[]): Package[] {
  const packages = input.reduce((acc, current) => {
    acc.push(new BasePackage(current));
    return acc;
  }, [] as BasePackage[]);

  return packages;
}

export class BasePackage implements Package {
  packages: Package[];
  version: number;
  type: number;
  literal: number;

  constructor(input: string, isBinary = false) {
    const binary = !isBinary ? transformToBinary(input) : input;
    this.literal = 0;
    this.version = getVersion(binary);
    this.type = getType(binary);

    if (this.type === 4) {
      this.literal = getLiteral(binary.substring(6));
      this.packages = [];
    } else {
      this.packages = getPackages(binary.substring(6));
    }
  }

  sum(): number {
    return (
      this.version +
      this.packages.reduce((acc, current) => acc + current.version, 0)
    );
  }
}

function transformToBinary(input: string) {
  return input.split('').reduce((acc, current) => {
    acc += parseInt(current, 16).toString(2).padStart(4, '0');
    return acc;
  }, '');
}

function getVersion(binary: string): number {
  return parseInt(binary.substring(0, 3), 2);
}

function getType(binary: string): number {
  return parseInt(binary.substring(3, 6), 2);
}

function getLiteral(binary: string): number {
  return parseInt(binary.substring(0, 11), 2);
}

function getPackages(binary: string): Package[] {
  const packages: Package[] = [];

  // operator -> sub-packages
  const length = Number(binary[0]);
  if (length === 0) {
    const bitsSize = parseInt(binary.substring(1, 16), 2);
    let i = 0;
    let start = binary[17];
    while (start === '1') {
      const rest = binary.substring(17, 17 + 11 * i - 1);
      packages.push(new BasePackage(rest, true));
      i++;
      start = binary[17 + 11 * i];
    }
    packages.push(new BasePackage(binary.substring(17 + 11 * i), true));
  }
  if (length === 1) {
    // 11 bits
    const numOfPackages = parseInt(binary.substring(1, 12), 2);
    for (let i = 0; i < numOfPackages; i++) {
      const p = new BasePackage(
        binary.substring(12 + 11 * i, 11 + 12 + 11 * i),
        true,
      );
      packages.push(p);
    }
  }

  return packages;
}
