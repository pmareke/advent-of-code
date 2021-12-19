import { Scanner } from './types';

export class Solver {
  scanners: Scanner[] = [];

  constructor(data: string[]) {
    let scanner: Scanner = new Scanner();
    for (const input of data) {
      if (input.length === 0) continue;
      if (input[1] === '-') {
        scanner = new Scanner();
        this.scanners.push(scanner);
        continue;
      }
      const [x, y, z] = input.split(',').map(Number);
      scanner.addSignal(x, y, z);
    }
  }

  align() {
    const locked = new Set([0]);
    this.scanners[0].position = { x: 0, y: 0, z: 0 };
    while (locked.size < this.scanners.length) {
      for (let i = 0; i < this.scanners.length; i++) {
        for (let j = 0; j < this.scanners.length; j++) {
          if (i === j || !locked.has(i) || locked.has(j)) continue;
          const intersection = this.scanners[i].compare(this.scanners[j]);
          if (!intersection) continue;
          this.scanners[i].align(this.scanners[j], intersection);
          locked.add(j);
        }
      }
    }
  }

  get partOne() {
    this.align();
    const beacons = new Set();
    for (const scanner of this.scanners) {
      for (const signal of scanner.signals) {
        beacons.add([signal.x, signal.y, signal.z].join(','));
      }
    }

    return beacons.size;
  }

  get partTwo() {
    this.align();
    let max = 0;
    for (const s1 of this.scanners) {
      for (const s2 of this.scanners) {
        max = Math.max(
          max,
          Math.abs(s2.position.x - s1.position.x) +
            Math.abs(s2.position.y - s1.position.y) +
            Math.abs(s2.position.z - s1.position.z),
        );
      }
    }
    return max;
  }
}
